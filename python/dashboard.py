from flask import Blueprint, render_template, jsonify, request, send_file, current_app
from utils import generate_graph, get_top_earthquakes, get_last_earthquake, COUNTRIES
from datetime import datetime, timedelta
import requests

dashboard_blueprint = Blueprint('dashboard', __name__)

class EarthquakeDashboard:
    @staticmethod
    @dashboard_blueprint.route('/')
    def main_page():
        return render_template('main_page.html')

    @staticmethod
    @dashboard_blueprint.route('/ping')
    def ping():
        return 'pong', 200

    @staticmethod
    @dashboard_blueprint.route('/health')
    def health():
        return jsonify(status='ok', message='Application is healthy'), 200

    @staticmethod
    @dashboard_blueprint.route('/status')
    def status():
        status_info = {
            'service': 'Flask Application',
            'status': 'running',
            'uptime': '72 hours'
        }
        return jsonify(status_info), 200

    @staticmethod
    @dashboard_blueprint.route('/info')
    def info():
        app_info = {
            'name': 'Sample Flask App',
            'version': '1.0',
            'author': 'Your Name',
            'description': 'A sample Flask application demonstrating multiple routes'
        }
        return jsonify(app_info), 200

    @staticmethod
    @dashboard_blueprint.route('/telaviv-earthquakes')
    def telaviv_earthquakes():
        # Return raw Tel Aviv earthquake data (last 30 days)
        start_time = (datetime.utcnow() - timedelta(days=30)).strftime('%Y-%m-%d')
        params = {
            'format': 'geojson',
            'latitude': 32.0853,
            'longitude': 34.7818,
            'maxradiuskm': 100,
            'starttime': start_time
        }
        usgs_url = "https://earthquake.usgs.gov/fdsnws/event/1/query"
        response = requests.get(usgs_url, params=params)
        if response.status_code == 200:
            data = response.json()
            processed_events = []
            for feature in data.get('features', []):
                properties = feature.get('properties', {})
                geometry = feature.get('geometry', {})
                coordinates = geometry.get('coordinates', [])
                event_data = {
                    'magnitude': properties.get('mag'),
                    'place': properties.get('place'),
                    'time': properties.get('time'),
                    'coordinates': {
                        'longitude': coordinates[0] if len(coordinates) > 0 else None,
                        'latitude': coordinates[1] if len(coordinates) > 1 else None,
                        'depth': coordinates[2] if len(coordinates) > 2 else None,
                    },
                    'type': properties.get('type')
                }
                processed_events.append(event_data)
            result = {
                'count': len(processed_events),
                'events': processed_events
            }
            return jsonify(result), 200
        else:
            current_app.logger.error("Error fetching data from USGS API")
            return jsonify(error="Error fetching data from USGS API"), response.status_code

    @staticmethod
    @dashboard_blueprint.route('/graph-earthquakes.png')
    def graph_earthquakes_image():
        days = int(request.args.get('days', 30))
        loc_name = request.args.get('location', "Tel Aviv, Israel")
        location = COUNTRIES.get(loc_name, COUNTRIES["Tel Aviv, Israel"])
        img = generate_graph(days, location["lat"], location["lon"], location["radius"])
        return send_file(img, mimetype='image/png')

    @staticmethod
    @dashboard_blueprint.route('/graph-earthquakes-5years.png')
    def graph_earthquakes_5years_image():
        days = 5 * 365  # Approximate days in 5 years
        loc_name = request.args.get('location', "Tel Aviv, Israel")
        location = COUNTRIES.get(loc_name, COUNTRIES["Tel Aviv, Israel"])
        img = generate_graph(days, location["lat"], location["lon"], location["radius"], title_suffix="(5 Years)")
        return send_file(img, mimetype='image/png')

    @staticmethod
    @dashboard_blueprint.route('/graph-earthquakes')
    def graph_earthquakes_page():
        days = int(request.args.get('days', 30))
        loc_name = request.args.get('location', "Tel Aviv, Israel")
        top_events = get_top_earthquakes(limit=5)
        last_event = get_last_earthquake()

        return render_template('graph_dashboard.html',
                               days=days,
                               current_location=loc_name,
                               countries=list(COUNTRIES.keys()),
                               top_events=top_events,
                               last_event=last_event)

# The static methods in EarthquakeDashboard register the routes automatically.
