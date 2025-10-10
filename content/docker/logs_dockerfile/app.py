from flask import Flask
import logging
import os

app = Flask(__name__)

# Ensure log directory exists
log_dir = '/var/log/my-flask-app'
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# Set up logging to a file
logging.basicConfig(filename=f'{log_dir}/app.log', level=logging.INFO)
logger = logging.getLogger()

@app.route('/')
def hello_world():
    logger.info('Hello, World! endpoint was reached')
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000,debug=True)
