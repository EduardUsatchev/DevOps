import json
from app import app

def test_get_data():
    client = app.test_client()
    response = client.get('/get')
    assert response.status_code == 200

def test_post_data():
    client = app.test_client()
    response = client.post('/post', data=json.dumps({'key': 'value'}), content_type='application/json')
    assert response.status_code == 201

def test_delete_data():
    client = app.test_client()
    response = client.delete('/delete')
    assert response.status_code == 204
