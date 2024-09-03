# setting up chrome browser on a desired page
from selenium import webdriver
from time import sleep
driver = webdriver.Chrome()
sleep(3)
# # opening chrome browser on a desired page
driver.get("https://www.google.com")
sleep(3)
# # # Getting browser current page URL
print("url: " + driver.current_url)
# sleep(5)
driver.refresh()
sleep(2)
# driver.close()
# # Getting browser current page title
print("title: "+driver.title)
# # Getting browser current tab handle
# print("handle: "+driver.current_window_handle)
# # Getting browser first tab handle
print("handles: "+driver.window_handles[2])
# # Getting current page source
print("source: "+driver.page_source)


