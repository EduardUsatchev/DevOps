from flask import Flask, jsonify, request
app = Flask("moshe")
data = [
    {"id": 1, "name": "Item 1"},
    {"id": 2, "name": "Item 2"},
    {"id": 3, "name": "Item 3"},
]
@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(data)

@app.route('/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    for item in data:
        if item['id'] == item_id:
            return jsonify(item)
    return jsonify({"error": "Item not found"}), 404



@app.route('/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    # modifying the data list, so you need to declare data as global to indicate that you're modifying the global variable.
    global data
    new_data = []
    for item in data:
        if item['id'] != item_id:
            new_data.append(item)
    data = new_data
    return jsonify({"message": "Item deleted successfully"})


app.run(host='127.0.0.1', port="8080")