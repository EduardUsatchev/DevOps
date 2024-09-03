import requests

url = "http://universities.hipolabs.com/search?country=Israel"
response = requests.get(url)
if response.status_code == 200:
    universities = response.json()
    if len(universities) >= 5:
        print("Israel has at least 5 universities.")
    else:
        print("Israel has less than 5 universities.")
else:
    print("Failed to fetch universities. Status code:", response.status_code)
