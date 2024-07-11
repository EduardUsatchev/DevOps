# test_app.py
import unittest
from app import app

class FlaskAppTestCase(unittest.TestCase):
    def setUp(self):
        # Create a test client
        self.app = app.test_client()
        self.app.testing = True

    def test_home(self):
        # Send a GET request to the root URL
        response = self.app.get('/')
        # Assert the response status code is 200 (OK)
        self.assertEqual(response.status_code, 200)
        # Assert the response data is 'Hello, World!'
        self.assertEqual(response.data.decode(), 'Hello, World!')

if __name__ == '__main__':
    unittest.main()
