import requests

def get_repositories(username):
    url = f"https://api.github.com/users/{username}/repos"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise exception for bad status codes
        repositories = response.json()
        return [repo['name'] for repo in repositories]
    except requests.exceptions.RequestException as e:
        print(f"Failed to fetch repositories: {e}")
        return []

username = "EduardUsatchev"
repositories = get_repositories(username)
print("Repositories for", username + ":")
for repo in repositories:
    print(repo)


