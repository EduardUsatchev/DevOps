from flask import Flask, request, jsonify

app = Flask(__name__)

data = []

@app.route('/get', methods=['GET'])
def get_data():
    return jsonify(data), 200

@app.route('/post', methods=['POST'])
def post_data():
    new_data = request.json
    data.append(new_data)
    return jsonify(new_data), 201

@app.route('/delete', methods=['DELETE'])
def delete_data():
    data.clear()
    return '', 204

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
