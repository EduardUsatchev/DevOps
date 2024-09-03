from selenium import webdriver

url = "https://hub.docker.com/"
expected_title = "Docker Hub Container Image Library | App Containerization"

driver = webdriver.Chrome()
print(driver.title)
if expected_title in driver.title:
    print("Title matches: Docker Hub Container Image Library | App Containerization")
else:
    print("Title does not match:", driver.title)

driver.quit()
