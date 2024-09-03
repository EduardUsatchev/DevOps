import requests
from requests.exceptions import InvalidURL
from time import sleep

try:
    response = requests.get("https://google.com")
    print(response)
    print(response.status_code)

except InvalidURL:
    print("invalid url was given")

