import requests
try:
    github_api_url = "https://api.github.com/users/eduardusatchev/repos"
    github_response = requests.get(github_api_url)
    github_repositories = github_response.json()
    assert len(github_repositories) >= 7
except AssertionError as e:
    print("More than 7")
