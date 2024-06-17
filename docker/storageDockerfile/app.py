from flask import Flask, render_template, request
import os

app = Flask(__name__)

# Directory to store data
DATA_DIR = '/app/data'
os.makedirs(DATA_DIR, exist_ok=True)

# Route to handle user interactions
@app.route('/')
def home():
    return render_template('index.html')

@app.route('/log', methods=['POST'])
def log_data():
    data = request.form.get('data')
    with open(os.path.join(DATA_DIR, 'logs.txt'), 'a') as f:
        f.write(data + '\n')
    return 'Data logged successfully!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
