
from flask import Flask
import random

app = Flask(__name__)

@app.route("/")
def index():
    if random.random() < 0.2:  # Simulate occasional failures
        raise Exception("Simulated failure")
    return "Hello from Python App!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
