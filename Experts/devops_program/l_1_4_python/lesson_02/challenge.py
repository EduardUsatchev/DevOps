myDict = {"name": "eduard", "age": 28, "hobbies": ["Skiing","Cooking"], "children": None}
print(myDict["name"])

myDict = {"name": "eduard",
         "age": 28,
         "hobbies": ["Skiing", "Cooking"],
         "children": None}

print(myDict["name"])

myDict["age"] = 29
myDict = {"name": "aviel",
         "age": 29,
         "hobbies": ["Skiing", "Cooking"],
         "children": None}
print(list(myDict.keys()))

print(list(myDict.values()))


tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5 );
tup3 = "a", "b", "c", "d";
print("tup1[0]: ", tup1[0])



myItems = ["first item", 3, True, "last item"]
for i in range(len(myItems)):
    print("item in location: " + str(i) + " values is: " + str(myItems[i]))

print("Enter your name:", end=" ")
name = input()
print("Have a good day " + name)

a = 5
print(f"{a} + {a} = {a + a}")
print("My name \n is Eduard \n and i am \n 28 years old", end=" ")
str(a)
print(a, end=" ")

height = 5  # You can adjust the height of the pyramid

for i in range(height):
    # Print spaces before the stars
    for j in range(height - i - 1):
        print(" ", end="")

    # Print stars
    for k in range(2 * i + 1):
        print("*", end="")

    # Move to the next line after each row
    print()

size = 7

for i in range(size):
    for j in range(size):
        if j == i or j == size - i - 1:
            print("*", end="")
        else:
            print(" ", end="")
    print()

rows = int(input("Enter number of rows: "))

for i in range(rows):
    for j in range(i + 1):
        print("* ", end="")
    print()

rows = int(input("Enter number of rows: "))

for i in range(rows):
    for j in range(i + 1):
        print(j + 1, end=" ")
    print()
