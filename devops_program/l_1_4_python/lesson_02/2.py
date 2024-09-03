my_dict = {'name': 'John', 'age': 25, 'country': 'USA'}
my_dict2 = {'name':['John','edi','daniel'] , 'age': 25, 'country': 'USA'}
print(my_dict2["name"][1])
name = 0
for name in my_dict2["name"]:
    print(name)
    if name != "David":
        my_dict2["name"].append("David")

print(my_dict2.keys())


