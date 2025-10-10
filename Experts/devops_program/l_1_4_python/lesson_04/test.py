import requests
from selenium import webdriver

# API Testing

# Testing Github API
github_api_url = "https://api.github.com/users/eduardusatchev/repos"
github_response = requests.get(github_api_url)
github_repositories = github_response.json()
assert len(github_repositories) >= 5, "There are not at least 5 repositories for user 'eduardusatchev'."

# Testing agify API
names = ["John", "Emma", "Michael"]
for name in names:
    agify_api_url = f"https://api.agify.io/?name={name}"
    agify_response = requests.get(agify_api_url)
    age = agify_response.json()['age']
    assert 0 <= age <= 120, f"The age {age} for name {name} is not within the expected range of 0-120."

# Testing universities API
universities_api_url = "http://universities.hipolabs.com/search?country=Israel"
universities_response = requests.get(universities_api_url)
israel_universities = universities_response.json()
assert len(israel_universities) >= 5, "There are not at least 5 universities in Israel."

# UI Testing

# Using Selenium to test Y Combinator website
ycombinator_url = "https://www.ycombinator.com/"
driver = webdriver.Chrome()  # Make sure you have chromedriver installed and added to PATH
driver.get(ycombinator_url)
ycombinator_title = driver.title
driver.quit()
assert ycombinator_title == "Y Combinator", f"The title is not 'Y Combinator', instead it is '{ycombinator_title}'."

# Using Selenium to test Docker Hub website
dockerhub_url = "https://hub.docker.com"
driver = webdriver.Chrome()  # Make sure you have chromedriver installed and added to PATH
driver.get(dockerhub_url)
dockerhub_title = driver.title
driver.quit()
assert dockerhub_title == "Docker Hub Container Image Library | App Containerization", \
    f"The title is not 'Docker Hub Container Image Library | App Containerization', instead it is '{dockerhub_title}'."
