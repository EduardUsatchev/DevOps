from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.action_chains import ActionChains
from time import sleep
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import  expected_conditions

FirefoxDriver=webdriver.Firefox(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Firefox\\geckodriver.exe")




#########################
###Registration Screen
#########################





#open the site
FirefoxDriver.get("https://buyme.co.il/")
FirefoxDriver.implicitly_wait(5)
#open registration
FirefoxDriver.find_element_by_class_name("seperator-link").click()
FirefoxDriver.implicitly_wait(5)
#open registration

FirefoxDriver.find_element_by_xpath("/html/body/div[2]/div/div[1]/div/div/div[3]/p/span").click()
FirefoxDriver.implicitly_wait(5)
#insert name
FirefoxDriver.find_element_by_id("ember1041").send_keys("Eduard")
FirefoxDriver.implicitly_wait(5)
#insert email
FirefoxDriver.find_element_by_id("ember1043").send_keys("eduard.usatchev@gmail.com")
FirefoxDriver.implicitly_wait(5)
#insert password
FirefoxDriver.find_element_by_id("valPass").send_keys("Eduard12QW")
FirefoxDriver.implicitly_wait(5)
#repeat password
FirefoxDriver.find_element_by_id("ember1047").send_keys("Eduard12QW")
FirefoxDriver.implicitly_wait(5)
#aceept terms
FirefoxDriver.execute_script("argument[0].click();",FirefoxDriver.find_element_by_name("ember1048-id"))
FirefoxDriver.implicitly_wait(5)
#submit and register
FirefoxDriver.find_element_by_id("type").get_attribute("submit")
FirefoxDriver.implicitly_wait(5)


#Pick a price
FirefoxDriver.implicitly_wait(5)
S1 = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember664_chosen"]')))
ActionChains(FirefoxDriver).move_to_element(S1).perform()
click_item = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember664_chosen"]')))
click_item.click()



#Pick an area

FirefoxDriver.implicitly_wait(5)
S1 = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember679_chosen"]')))
ActionChains(FirefoxDriver).move_to_element(S1).perform()
click_item = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember679_chosen"]')))
click_item.click()


#Pick a category

FirefoxDriver.implicitly_wait(5)
S1 = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember689_chosen"]')))
ActionChains(FirefoxDriver).move_to_element(S1).perform()
click_item = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember689_chosen"]')))
click_item.click()

#Search
FirefoxDriver.find_element_by_id("ember724").click()



##Pick a bussines
FirefoxDriver.find_element_by_id("ember1066").click()
FirefoxDriver.implicitly_wait(5)

##Insert number
FirefoxDriver.find_element_by_id("ember1490").send_keys("750")
FirefoxDriver.implicitly_wait(10)

## Choose לבחירה
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("type").get_attribute("submit")

##Press radio buttom למישהו אחר
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("data").get_attribute("forMyself").click()

##Reciever Name
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("ember1216").send_keys("Eduardo")

#From Who
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("ember1218").send_keys("Eduardo")

#For What

FirefoxDriver.implicitly_wait(5)
S1 = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember1220_chosen"]')))
ActionChains(FirefoxDriver).move_to_element(S1).perform()
click_item = FirefoxDriver.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="ember1220_chosen"]')))
click_item.click()

#blessing

FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("ember1242").clear()
FirefoxDriver.find_element_by_id("ember1242").send_keys("Thank you")

#Image
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("ember1251").send_keys('C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\eduard.jpg')

#immediatelly after payment
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.execute_script("argument[0].click();",FirefoxDriver.find_element_by_class_name("send-now"))

#Send by email
FirefoxDriver.find_element_by_class_name("icon icon-envelope").click()
FirefoxDriver.find_element_by_id("ember1694").send_keys("eduard.usatchev@gmail.com")

#Save
FirefoxDriver.find_element_by_class_name("btn btn-theme btn-save").click()

#SUBMIT
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("type").get_attribute("submit").click()

#Size



#open the site
FirefoxDriver.get("https://buyme.co.il/")
FirefoxDriver.implicitly_wait(5)

#open registration
FirefoxDriver.find_element_by_class_name("seperator-link").click()
FirefoxDriver.implicitly_wait(5)

#SUBMIT
FirefoxDriver.implicitly_wait(5)
FirefoxDriver.find_element_by_id("type").get_attribute("submit").click()

#insert email
FirefoxDriver.find_element_by_id("ember1043").send_keys("eduard.usatchev@gmail.com")
FirefoxDriver.implicitly_wait(5)
#insert password
FirefoxDriver.find_element_by_id("valPass").send_keys("Eduard12QW")
FirefoxDriver.implicitly_wait(5)


#Take screenshot

Element=FirefoxDriver.find_element_by_id("siteFooter")
location=Element.location
Size=Element.size
PNG=FirefoxDriver.get_screenshot_as_png()

