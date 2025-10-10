import requests

names = ["John", "Emma", "Michael"]

for name in names:
    url = f"https://api.agify.io/?name={name}"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        print(data)
        age = int(data['age'])
        if 0 <= age <= 120:
            print(f"Age for name {name} is within the range (0-120): {age}")
        else:
            print(f"Age for name {name} is out of range: {age}")
    else:
        print(f"Failed to fetch age for name {name}. Status code:", response.status_code)
