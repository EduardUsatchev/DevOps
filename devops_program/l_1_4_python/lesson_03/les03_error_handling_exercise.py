# # Exercise 1: Handling File Not Found Error
# try:
#     with open("data.txt", "r") as file:
#         data = file.read()
#         print(data)
# except FileNotFoundError:
#     print("File not found!")
#
# # Exercise 2: Handling Division by Zero Error
# try:
#     numerator = int(input("Enter the numerator: "))
#     denominator = int(input("Enter the denominator: "))
#     result = numerator / denominator
#     print("Result:", result)
# except ZeroDivisionError:
#     print("Error: Division by zero!")
#
#
# # Exercise 3: Handling Type Error
# try:
#     num = int(input("Enter an integer: "))
#     print("Entered number:", num)
# except ValueError:
#     print("Error: Invalid input! Please enter an integer.")


# Exercise 4: Handling Index Error
my_list = [1, 2, 3]
try:
    print("5th element of the list:", my_list[4])
except IndexError:
    print("Error: Index out of range!")

# # Exercise 5: Handling Key Error
# my_dict = {"a": 1, "b": 2}
# try:
#     print("Value corresponding to key 'c':", my_dict['c'])
# except KeyError:
#     print("Error: Key not found!")

#
# # Exercise 7: Handling Assertion Error
# num = int(input("Enter a number: "))
# try:
#     assert num > 0, "Number should be positive"
#     print("Number is positive")
# except AssertionError as e:
#     print("Assertion Error:", e)

# # Exercise 8: Handling Value Error
# try:
#     num_str = input("Enter a number: ")
#     num = int(num_str)
#     print("Entered number:", num)
# except ValueError:
#     print("Error: Invalid input! Please enter a valid integer.")


#
#
