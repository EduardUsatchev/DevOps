# x = 2
# print(x == 2)  # prints out True
# print(x == 3)  # prints out False
# print(x < 3)  # prints out True
#
#
# name = "Edi"
# age = 24
# if name == "John" and age == 23:
#     print(f"Your name is {name}, and you are also {age} years old.")
# elif age > 15:
#     print("Youre legal")
# else:
#     print(f"Your name is not {name} and your age is not {age} years old")
#
# if name == "John" or name == "Rick":
#     print("Your name is either John or Rick.")
#
# a = 50
# b = 10
# my_name = "eduard"
#
# if a == 50:
#     print("all good")
# else:
#     print("all bad")

# name = "Edi"
# if name in ["John", "Rick", "Yair", "Denis"]:
#     print("Your name is either John or Rick.")
# else:
#     print(f"Youre name is {name}")

# statement = False
# another_statement = True
# if statement is True:
#     print("This is True")
#     pass
# elif another_statement is True:  # else if
#     print("This is True")
#     pass
# else:
#     print("This is not True")
#     pass

#
# x = 2
# if x == 2:
#     print("x equals two!")
# else:
#     print("x does not equal to two.")
#

# x = [1, 2, 3]
# y = [1, 2, 3]
# print(x == y)  # Prints out True
# print(x is y)  # Prints out False

# print(not False)  # Prints out True
# print((not False) == (False))  # Prints out False

# Prints out 0,1,2,3,4 and then it prints "count value reached 5"

# count = 0
# while (count < 5):
#     print(count)
#     count += 1
# else:
#     print(" count %d value reached " % (count))
#     print(" %d count  value reached " % (count))
#
#     print(f" count {count} value reached ")

# Prints out 1,2,3,4
# for i in range(1, 10):
#     if i % 5 == 0:
#         break
#     print(i)
# else:
#     print("this is not printed because for loop is terminated because of break but not due to fail in condition")

# a = 11
# b = 6
# my_name = "Yair"
# if a < 10 and b > 5:
#     print("you are eduard")
#     print("hello")
#     print("world")
# elif my_name == "eduard":
#     print("found your name")
# elif b > 5:
#     print("b is good")
# else:
#     print("balbla")
#
# a = 50
# b = 90
# print(a == 50)
# should_i_work_today = a == 50 and b < 100
#
# if should_i_work_today:
#     print("go to work")
# else:
#     print("stay at home")

# my_list = [2, 2, 3, 4, 6, True, "Tal", "Denis"]
# if len(my_list) > 0:
#     print("you have items")
#     if my_list[0] == 1:
#         print(f"The value is {my_list[0]}")
#     elif my_list[0] != 1:
#         print(f"The value is != {my_list[0]}")
# else:
#     print("no items in the list")

# string_len = len("ksadjfnkasjdf")
# print(string_len)
# aa = string_len + 1
# print(aa)


# my_other_list = ["or", "tohar", "adam"]
# my_other_name = "Denis"
# my_other_list.append("Denis")
# print(my_other_list)
# if my_other_name in my_other_list:
#     print("i found you")

# myDict = {"name": "eduard",
#           "age": 28,
#           "hobbies": ["Skiing", "Cooking"],
#           "children": None }
#
# print(myDict["hobbies"][2])


# # Outer loop
# for i in range(3):
#     print("Outer loop iteration:", i)
#     # Inner loop
#     for j in range(2):
#         print("    Inner loop iteration:", j)
# #

# myDict = {"name": "eduard", "age": 29, "hobbies": ["Skiing", "Cooking"], "children": None}

# myDict = {"name": "eduard",
#           "age": 29,
#           "hobbies": ["Skiing", "Cooking"],
#           "children": None}
# print(list(myDict.keys()))
#
# var = ['name', 'age', 'hobbies', 'children']
# print(list(myDict.values()))
# var = ['eduard', 29, ['Skiing', 'Cooking'], None]
#
# tt = 49
# rr = 50
# print(id(tt))
# print(id(rr))
# #
# details = ["eduard", "usatchev", 34, True]
# details_dict = {"fname": "eduard",
#                 "lname": "usatchev",
#                 "age": 34,
#                 "is_married": True}
# my_class = [
#     {"fname": "or", "lname": "shemesh"},
#     {"fname": "maksim", "lname": "hamaksim"},
# ]
#
# for student in my_class:
#     print(student["fname"] + student["lname"])
# print(details_dict.keys())
# print(details_dict.values())
#
#
# thisdict = {
#   "brand": "Ford",
#   "model": "Mustang",
#   "year": 1964,
#   "year": 2020
# }
# print(thisdict)
# print(len(thisdict))
#
#
# thisdict = {
#   "brand": "Ford",
#   "electric": False,
#   "year": 1964,
#   "colors": ["red", "white", "blue"]
# }
#
# thisdict = {
#   "brand": "Ford",
#   "model": "Mustang",
#   "year": 1964
# }
# print(type(thisdict))
#
#
# thisdict = {
#   "brand": "Ford",
#   "model": ["Mustang","subaru" , "Chevi"] ,
#   "year": 1964
# }
#
# for i in len(thisdict["model"]):
#     print(thisdict[i])
#
# x = thisdict["model"][1]
# print(x)
# # x = thisdict.get("model")
# # print(x)