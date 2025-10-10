# Tip calc orig
from selenium import webdriver
from time import sleep
try:
    dr = webdriver.Chrome()
    dr.get("file:///Users/e0u00jg/Downloads/tip_calc%204/index.html")
    # sleep(2)
    dr.find_element(by="id",value="billamt").send_keys("5")
    dr.find_element(by="xpath", value="//*[@id=\"serviceQual\"]/option[5]").click()
    # sleep(2)
    dr.find_element(by="id",value="peopleamt").send_keys("2")
    # sleep(2)
    dr.find_element(by="id",value="music").send_keys("2")
    # sleep(2)
    dr.find_element(by="id",value="calculate").click()
    sleep(2)
    actual = dr.find_element(by="id",value="tip").text
    excpected = "2.25"
    print(f"The actual: {actual} , The excpected: {excpected}")

    assert actual == excpected
except AssertionError as e:
    print("The actual tip is different than excpected",e)







# sleep(5)
# billamt = dr.find_element(by="id", value="billamt")
# billamt.send_keys("100")
#
# dr.find_element(by="xpath", value="//*[@id=\"serviceQual\"]/option[3]").click()
# dr.find_element(by="id", value="peopleamt").send_keys("5")
# dr.find_element(by="id", value="calculate").click()
# actual = dr.find_element(by="id", value="tip").text
# expected = "4.00"
# print(actual)
# assert expected == actual
# sleep(10)