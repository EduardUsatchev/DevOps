import requests

response = requests.get("http://localhost:8080/items")
a = response.json()
for i in a:
    print(i.get("name"))

item_id = input("Enter the ID of the item you want to delete: ")
response = requests.delete(f"http://localhost:8080/items/{item_id}")

if response.status_code == 200:
    print("Item deleted successfully")
else:
    print("Failed to delete item. Status code:", response.status_code)
