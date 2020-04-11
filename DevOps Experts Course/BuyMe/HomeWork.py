from selenium.webdriver.common.keys import Keys
from selenium import webdriver


# FirefoxDriver=webdriver.Firefox(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Firefox\\geckodriver.exe")
# ChromeDriver=webdriver.Chrome(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Chrome\\chromedriver.exe")

#########
### 1 ###
#########

# ChromeDriver.get("https://www.walla.co.il/")
# FirefoxDriver.get("https://www.ynet.co.il/home/0,7340,L-8,00.html")

#########
### 2 ###
#########
#
# T=FirefoxDriver.title()
# FirefoxDriver.refresh()
#
# if T == FirefoxDriver.title():
#     print("Same")


#########
### 3 ###
#########

# ChromeDriver.get("https://www.walla.co.il/")
# FirefoxDriver.get("https://www.walla.co.il/")

#No the element has no the same locators in other websites

#########
### 4 ###
#########

# FirefoxDriver.get("https://translate.google.com/?hl=iw")
# FirefoxDriver.find_element_by_id("source").send_keys("Eduard")

#########
### 5 ###
#########


# FirefoxDriver.get("https://www.youtube.com/")
# FirefoxDriver.find_element_by_name("search_query").click()
# FirefoxDriver.find_element_by_name("search_query").send_keys("Gangam style")
# FirefoxDriver.find_element_by_xpath("/html/body/ytd-app/div/div/ytd-masthead/div[3]/ytd-searchbox/form/button/yt-icon").click()

#########
### 6 ###
#########

# FirefoxDriver.get("https://translate.google.com/?hl=iw")
# FirefoxDriver.find_element_by_id("source").send_keys("Eduard")
# FirefoxDriver.find_element_by_xpath("//*[@id='source']").send_keys("Eduard")
# d=FirefoxDriver.find_elements_by_xpath("/html/body/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/span[1]")
# print(d)

#########
### 7 ###
#########


# FirefoxDriver.get("https://www.facebook.com/")
# FirefoxDriver.find_element_by_id("email").send_keys("Eduard@eduard.com")
# FirefoxDriver.find_element_by_id("pass").send_keys("Eduard1234")
# FirefoxDriver.find_element_by_id("u_0_2").click()

#########
### 8 ###
#########

# Cookie=FirefoxDriver.get_cookies()
# print(Cookie)
# FirefoxDriver.delete_all_cookies()

#########
### 9 ###
#########

# FirefoxDriver.get("https://github.com/")
# FirefoxDriver.find_element_by_name("q").send_keys("Selenium")
# FirefoxDriver.find_element_by_name("q").send_keys(Keys.ENTER)

#########
### 10 ###
#########

# from selenium.webdriver.chrome.options import Options
# chrome_options = Options()
# chrome_options.add_argument("--disable-extensions")
# Cbrowser = webdriver.Chrome(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Chrome\\chromedriver.exe", chrome_options=chrome_options)
# Cbrowser.get("https://github.com/")


########

# from selenium.webdriver.firefox.options import Options
# firefox_options = Options()
# firefox_options.add_argument("--disable-extensions")
# Fbrowser = webdriver.Chrome(executable_path="C:\\Users\\Eduard-Pc\\Desktop\\DevopsExperts\\Python\\Selenium\\Firefox\\geckodriver.exe",firefox_options=firefox_options)
# Fbrowser.get("https://github.com/")