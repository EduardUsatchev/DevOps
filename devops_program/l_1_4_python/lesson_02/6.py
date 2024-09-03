for moshe in range(5):
    print("hello " + str(moshe))
else:
    print("finished")
class_mates = ["maksim", "yoni", "gilad", "oren"]
for current_name in class_mates:
    if current_name == "yoni":
        current_name = "amir"
    print(current_name)
print(class_mates)
for i in range(len(class_mates)):
    class_mates[i] = "moshe"
print(class_mates)
your_name = input("enter your name: ")
while your_name != "eduard":
    print("you are not eduard")
    if your_name.lower() == "haim".lower():
        print("oh my god")
        break
    your_name = input("enter your name: ")
else:
    print("your name is eduard")