import io
from datetime import datetime, timedelta
import matplotlib.pyplot as plt
import requests
from collections import defaultdict

# Country configuration
COUNTRIES = {
    "Tel Aviv, Israel": {"lat": 32.0853, "lon": 34.7818, "radius": 100},
    "United States (California)": {"lat": 36.7783, "lon": -119.4179, "radius": 300},
    "Japan": {"lat": 36.2048, "lon": 138.2529, "radius": 300},
    "Indonesia": {"lat": -0.7893, "lon": 113.9213, "radius": 300},
    "Chile": {"lat": -35.6751, "lon": -71.5430, "radius": 300}
}

def generate_graph(days, lat, lon, radius, title_suffix=""):
    start_time_dt = datetime.utcnow() - timedelta(days=days)
    start_time = start_time_dt.strftime('%Y-%m-%d')
    params = {
        'format': 'geojson',
        'latitude': lat,
        'longitude': lon,
        'maxradiuskm': radius,
        'starttime': start_time
    }
    usgs_url = "https://earthquake.usgs.gov/fdsnws/event/1/query"
    response = requests.get(usgs_url, params=params)

    plt.figure(figsize=(10, 5))
    if response.status_code != 200:
        plt.text(0.5, 0.5, "Error fetching data", horizontalalignment='center',
                 verticalalignment='center', fontsize=14)
        plt.axis('off')
    else:
        data = response.json()
        counts_by_day = defaultdict(int)
        for feature in data.get('features', []):
            timestamp = feature.get('properties', {}).get('time')
            if timestamp:
                event_date = datetime.utcfromtimestamp(timestamp / 1000).date()
                counts_by_day[event_date] += 1
        days_list = sorted(counts_by_day.keys())
        counts = [counts_by_day[day] for day in days_list]

        if days_list:
            plt.bar(days_list, counts)
            plt.xlabel('Date')
            plt.ylabel('Number of Earthquakes')
            plt.title(f'Earthquakes in Last {days} Days {title_suffix}')
            plt.xticks(rotation=45)
            plt.tight_layout()
        else:
            plt.text(0.5, 0.5, "No earthquake data available", horizontalalignment='center',
                     verticalalignment='center', fontsize=14)
            plt.axis('off')

    img = io.BytesIO()
    plt.savefig(img, format='png')
    plt.close()
    img.seek(0)
    return img

def get_top_earthquakes(limit=5):
    start_time = (datetime.utcnow() - timedelta(days=30)).strftime('%Y-%m-%d')
    params = {
        'format': 'geojson',
        'starttime': start_time,
        'minmagnitude': 1
    }
    usgs_url = "https://earthquake.usgs.gov/fdsnws/event/1/query"
    response = requests.get(usgs_url, params=params)
    top_events = []
    if response.status_code == 200:
        data = response.json()
        events = data.get('features', [])
        events = sorted(events, key=lambda f: f.get('properties', {}).get('mag', 0), reverse=True)
        top_events = events[:limit]
    return top_events

def get_last_earthquake():
    start_time = (datetime.utcnow() - timedelta(days=30)).strftime('%Y-%m-%d')
    params = {
        'format': 'geojson',
        'starttime': start_time,
        'minmagnitude': 1
    }
    usgs_url = "https://earthquake.usgs.gov/fdsnws/event/1/query"
    response = requests.get(usgs_url, params=params)
    last_event = None
    if response.status_code == 200:
        data = response.json()
        events = data.get('features', [])
        events = sorted(events, key=lambda f: f.get('properties', {}).get('time', 0), reverse=True)
        if events:
            last_event = events[0]
    return last_event

def timestamp_to_str(ts):
    return datetime.utcfromtimestamp(ts / 1000).strftime('%Y-%m-%d %H:%M:%S')
