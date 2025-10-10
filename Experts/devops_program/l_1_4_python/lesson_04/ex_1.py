from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

search_query = "Eduard Usatchev"

driver = webdriver.Chrome()

driver.get("https://www.google.com")

search_box = driver.find_element(by="xpath",value="//*[@id=\"APjFqb\"]")

search_box.send_keys(search_query)
search_box.send_keys(Keys.RETURN)
sleep(10)

driver.quit()

