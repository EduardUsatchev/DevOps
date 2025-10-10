from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
from time import sleep

try:
    dr = webdriver.Chrome()
    dr.get("file:///Users/e0u00jg/Desktop/DevOpsCourse/tip_calc_new/index.html")

    # Entering bill amount
    billamt = dr.find_element(by="id", value="billamt")
    billamt.send_keys("100")

    # Selecting service quality
    dr.find_element(by="xpath", value="//*[@id=\"serviceQual\"]/option[2]").click()

    # Entering number of people
    dr.find_element(by="id", value="peopleamt").send_keys("5")

    # Entering music quality rating
    dr.find_element(by="id", value="musicQuality").send_keys("5")

    # Clicking calculate button
    dr.find_element(by="id", value="calculate").click()

    # Retrieving and comparing the calculated tip
    actual = dr.find_element(by="id", value="tip").text
    sleep(10)

    expected = "11"
    assert expected == actual

    # Sleep to allow time for validation
    sleep(10)

except NoSuchElementException as e:
    print("Element not found:", e)

except AssertionError as e:
    print("Assertion error:", e)

except Exception as e:
    print("An error occurred:", e)

finally:
        dr.quit()
