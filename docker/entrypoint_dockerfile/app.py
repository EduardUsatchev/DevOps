from flask import Flask, request, jsonify
import logging
import os
import json

app = Flask(__name__)

# Ensure log directory exists
log_dir = '/var/log/my-flask-app'
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# Set up logging to a file and stdout
logging.basicConfig(level=logging.INFO, handlers=[
    logging.FileHandler(f'{log_dir}/app.log'),
    logging.StreamHandler()
])
logger = logging.getLogger()

@app.route('/')
def hello_world():
    logger.info('Hello, World! endpoint was reached')
    return 'Hello, World!'

@app.route('/data', methods=['POST'])
def save_data():
    data = request.json
    if not data:
        return jsonify({"error": "No data provided"}), 400

    # Save data to file
    data_dir = '/var/data/my-flask-app'
    os.makedirs(data_dir, exist_ok=True)
    with open(os.path.join(data_dir, 'data.json'), 'w') as f:
        f.write(json.dumps(data))

    logger.info('Data saved')
    return jsonify({"status": "success"}), 200

if __name__ == '__main__':
    app.run()
