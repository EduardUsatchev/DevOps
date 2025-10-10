
from flask import Flask, request, jsonify
import pymysql

app = Flask(__name__)

# Database connection details
DB_HOST = 'YOUR_RDS_ENDPOINT'
DB_USER = 'admin'
DB_PASSWORD = 'password123'
DB_NAME = 'homework_db'

def get_db_connection():
    connection = pymysql.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    return connection

@app.route('/students', methods=['GET'])
def get_students():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM students')
    students = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(students)

@app.route('/students', methods=['POST'])
def add_student():
    data = request.get_json()
    name = data['name']
    age = data['age']
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('INSERT INTO students (name, age) VALUES (%s, %s)', (name, age))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Student added successfully'}), 201

@app.route('/students/<int:id>', methods=['PUT'])
def update_student(id):
    data = request.get_json()
    age = data['age']
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('UPDATE students SET age = %s WHERE id = %s', (age, id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Student updated successfully'})

@app.route('/students/<int:id>', methods=['DELETE'])
def delete_student(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM students WHERE id = %s', (id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Student deleted successfully'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
