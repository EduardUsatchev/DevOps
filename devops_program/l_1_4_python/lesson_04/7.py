import requests
name = "DevOps1302"
url = "https://api.github.com/users/eduardusatchev/repos"
response = requests.get(url)
if response.status_code == 200:
    repositories = response.json()

    # Iterate through the repositories to find the one named "devops"
    for repo in repositories:
        if repo["name"] == name:
            print(f"Found {name} repository.")
            break
    else:
        print(f"No {name} repository found.")
else:
    print("Failed to fetch repositories. Status code:", response.status_code)
