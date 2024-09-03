from flask import Flask, jsonify, request
import random
import requests

app = Flask(__name__)

@app.route('/')
def home():
    return '''
        <h1>Welcome to the Flask Random Number Service!</h1>
        <p><a href="/random">Generate Random Number</a></p>
    '''

@app.route('/random')
def random_number():
    number = random.randint(1, 100)
    return '''
        <h1>Random Number: {}</h1>
        <p><a href="/check?number={}">Check if Prime</a></p>
    '''.format(number, number)

@app.route('/check')
def check_prime():
    number = request.args.get('number')
    response = requests.get(f'http://fastapi_prime_checker:8000/check?number={number}')
    result = response.json()
    is_prime = result['is_prime']
    return '''
        <h1>Number: {}</h1>
        <h1>Is Prime: {}</h1>
        <p><a href="/">Generate Another Number</a></p>
    '''.format(number, is_prime)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
