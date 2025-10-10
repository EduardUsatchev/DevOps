from selenium import webdriver

url = "https://www.ycombinator.com/"
expected_title = "Y Combinator"

driver = webdriver.Chrome()  # Assuming you are using Chrome WebDriver
driver.get(url)

if expected_title in driver.title:
    print("Title matches: Y Combinator")
else:
    print("Title does not match:", driver.title)

driver.quit()
