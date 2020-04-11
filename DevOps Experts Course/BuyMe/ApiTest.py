# import urllib.request
# val = urllib.request.urlopen("https://www.google.com").read()
# print(val)
#
#
# import json
# x =  '{ "name":"John", "age":30, "city":"New York"}'
# y = json.loads(x)
# print(y["age"])
#

import urllib.request , json

# Opening a web request
url = urllib.request.urlopen("https://free.currconv.com/api/v7/convert?q=USD_ILS&compact=n&apiKey=a539f9759c8230cfbe75")
url2=urllib.request.urlopen("https://free.currencyconverterapi.com/api/v5/convert?q=USD_ILS&compact=n")
# Decoding response to str
data = json.loads(url.read().decode()) # Decoding a web request

# Parsing results
results = data['results']
USD_ILS = results['USD_ILS']
val = USD_ILS['val']
print(val)

FirefoxDriver.find_element_by_class_name("seperator-link").click()