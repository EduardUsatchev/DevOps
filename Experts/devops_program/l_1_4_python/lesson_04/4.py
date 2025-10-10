from datetime import datetime  # Importing the datetime class from the datetime module
import requests  # Importing the requests module

print(datetime.now())  # Printing the current date and time

# List of URLs to check
urls = ["https://github.com",
        "https://google.com",
        "https://linkedin.com"]

# Looping through each URL
for url in urls:
    # Sending an HTTP GET request to the current URL
    response = requests.get(url)

    # Checking if the request was successful (status code 200)
    if response.status_code == 200:
        # If successful, printing a message indicating the URL is up
        print(f"{url} is up")

        # Checking if the URL contains "github"
        if "github" in url:
            # Sending another HTTP GET request to the GitHub API
            check_url = "https://api.github.com/users/python/repos"
            response = requests.get(check_url)

            # Parsing the JSON response
            repositories = response.json()
            print(repositories)
            # # Looping through each repository and printing its name
            for repo in repositories:
                print(repo["name"])
