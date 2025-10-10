import matplotlib
matplotlib.use('Agg')  # Force non-GUI backend before any other matplotlib import

import os
import logging
from logging.handlers import RotatingFileHandler
from flask import Flask
from dashboard import dashboard_blueprint
from utils import timestamp_to_str  # Import our custom filter

def create_app():
    app = Flask(__name__)

    # -------------------------
    # Logging Configuration
    # -------------------------
    if not os.path.exists('logs'):
        os.makedirs('logs')

    error_handler = RotatingFileHandler('logs/error.log', maxBytes=1000000, backupCount=3)
    error_handler.setLevel(logging.ERROR)
    error_formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    error_handler.setFormatter(error_formatter)
    app.logger.addHandler(error_handler)

    usage_handler = RotatingFileHandler('logs/access.log', maxBytes=1000000, backupCount=3)
    usage_handler.setLevel(logging.INFO)
    usage_formatter = logging.Formatter('%(asctime)s - %(message)s')
    usage_handler.setFormatter(usage_formatter)
    usage_logger = logging.getLogger('usage')
    usage_logger.addHandler(usage_handler)
    usage_logger.setLevel(logging.INFO)

    @app.before_request
    def log_request_info():
        from flask import request
        usage_logger.info(f"{request.remote_addr} - {request.method} {request.url}")

    # Register our blueprint
    app.register_blueprint(dashboard_blueprint)

    # Register custom Jinja2 filter so templates can use |timestamp_to_str
    app.jinja_env.filters['timestamp_to_str'] = timestamp_to_str

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(host='0.0.0.0', debug=True)
