from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys

ChromeDriver=webdriver.Chrome(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Chrome\\chromedriver.exe")

#########################
###Registration Screen
#########################

#Open the SIte
ChromeDriver.get("https://buyme.co.il/")
ChromeDriver.implicitly_wait(10)
## כניסה הרשמה
ChromeDriver.find_element_by_class_name("seperator-link").click()
ChromeDriver.implicitly_wait(10)
#הרשמה
# ChromeDriver.find_element_by_id("data-ember-action").get_attribute("1012").click()
ChromeDriver.find_element_by_xpath("//div/div[1]/div/div/div[3]/p/span").click()
ChromeDriver.implicitly_wait(10)
#הכנס שם
ChromeDriver.find_element_by_id("ember1037").send_keys("Eduard")
ChromeDriver.implicitly_wait(10)
#הכנס אימייל
ChromeDriver.find_element_by_id("ember1039").send_keys("eduard.usatchev@gmail.com")
ChromeDriver.implicitly_wait(10)
#הכנס סיסמא
ChromeDriver.find_element_by_id("valPass").send_keys("Eduard12QW")
ChromeDriver.implicitly_wait(10)
#הכנס סיסמא שנית
ChromeDriver.find_element_by_id("ember1043").send_keys("Eduard12QW")
ChromeDriver.implicitly_wait(10)
#קראתי תקנון
ChromeDriver.execute_script("argument[0].click();",ChromeDriver.find_element_by_name("ember1044-id")).click()
ChromeDriver.implicitly_wait(10)
#אישור
ChromeDriver.find_element_by_id("type").get_attribute("submit")
ChromeDriver.implicitly_wait(10)




# # FirefoxDriver.find_element_by_class_name("chosen-single").click()
# # FirefoxDriver.find_elements_by_css_selector("#ember664_chosen > a:nth-child(1) > span:nth-child(1)").click()
#
# ##Pick a bussines
# FirefoxDriver.find_element_by_id("ember815").click()
# FirefoxDriver.implicitly_wait(5)
# ## Pick a bussines
# FirefoxDriver.find_element_by_id("ember1061").click()
# FirefoxDriver.implicitly_wait(5)
# ##Insert number
# FirefoxDriver.find_element_by_id("ember1490").send_keys("500")
# FirefoxDriver.implicitly_wait(10)
# ## Choose לבחירה
# FirefoxDriver.
# ##Press radio buttom למישהו אחר
