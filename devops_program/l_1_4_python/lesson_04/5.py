from flask import Flask, request

app = Flask("moshe")

@app.route('/edi')
def my_func():
    return "hello and welcome to the world of games"

app.run(host="0.0.0.0", port=5001, debug=True)
