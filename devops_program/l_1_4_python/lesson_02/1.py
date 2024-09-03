# name = "Eduard"
#
# a = 1
# b = 2.0
# e = 4
# c = True
# d = [1, a, "Dennis", c]
# print(name)
# print(a, b, c)
# # print(d[4])
# f = ("Edu", 1, 3, True)
# print(d)
# print(f)
# h = {"name": "Shani", "age": "26", "Address": "Iben Gavirol"}
# print(h["name"])
# print(4 % 3)
#
# if a < 4:
#     print("a is smaller than 4")
#
# if c == True:
#     print("this is true")
# if c:
#     print("this is true")
#
# print(5 - 3)
# print("Eduard " + "is" + " " , e ,  "years old ")
# print(5 * 4)
#
# number = 50
# if number > 60:
#     print("Number is bigger than 60")
# elif number > 55:
#     print("Number is bigger than 55")
# elif number > 50:
#     print("Number is bigger/equal than 50")
# else:
#     print("Number is not bigger than 50")
#
# names = ["Edi","Shani", "Dani", "Dima"]
#
# if names[0] == "Eduard":
#     print("Your name is " + names[0])
# else:
#     print("Your name is undifined")
#
# league = {"team":"Bnei Yehuda", "score":"5", "Manager":"Dennis"}
#
# if league["team"] == "Hapoel":
#     print("Your team is", league["team"])
# else:
#     print("Your team is not", league["team"])
#
#
# my_list = [1, 2, 3]
# my_list[0] = 2
#
# print(my_list)
#
# my_dict = {"Name":[],"Address":[],"Age":[]};
#
# my_dict["Name"].append("Guru")
# my_dict["Address"].append("Mumbai")
# my_dict["Age"].append(30)
# print(my_dict)
#
# if my_list[0] != 2:
#     print("your list doesnt have 2")
# elif my_dict["Name"] != "Guru":
#     print(my_dict)
# my_list.insert(2, 6)
# print(my_list)
#
# one = 1
# two = 2
# hello = "hello"
#
# my_list2 = ["a", "b", "c", "d", "f", "h", "natan"]
#
# print(my_list2)
# print(my_list2[0])
# print(my_list2[1])
# print(my_list2[2])
#
# for i in my_list2:
#     print("Your number")
#     print(i)
#     if i == "c":
#         print("boom")
#     else:
#         print("No boom")
# i = 0
# while i < len(my_list2):
#     print(i)
#     i = i +1
#
# # while True:
# #     print("DevOps Course")
#
# x = 5
# y = 2.36
# print(x + int(y))
#
#
for i in range(0,10):
    print(i)
    if i == 8:
        break
i = 0

while i < 15:
    if i == 5:
        print("i is 5")
    if i == 9:
        break
    i = i + 1


mispar = [
    951, 402, 984, 651, 360, 69, 408, 319, 601, 485, 980, 507, 725, 547, 544,
    615, 83, 165, 141, 501, 263, 617, 865, 575, 219, 390, 984, 592, 236, 105, 942, 941,
    386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345,
    399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217,
    815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717,
    958, 609, 842, 451, 688, 753, 854, 685, 93, 857, 440, 380, 126, 721, 328, 753, 470,
    743, 527
]

for number in mispar:
    if number == 237:
        break
    if number % 2 == 0:
        print(number)

s = 'geeksforgeeks'
# Using for loop
for letter in s:
    print(letter)
    # break the loop as soon it sees 'e'
    # or 's'
    if letter == 'e' or letter == 's':
        break

print("Out of for loop")
print()

i = 0
# Using while loop
while True:
    print(s[i])
    # break the loop as soon it sees 'e'
    # or 's'
    if s[i] == 'e' or s[i] == 's':
        break
    i += 1

print("Out of while loop")