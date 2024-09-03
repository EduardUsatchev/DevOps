# A
X = 10
Y = 5

if X > Y:
    print("BIG")
elif X < Y:
    print("small")

# B
for i in range(5):
    print("Iteration number:", i+1)

# C
season_number = 2

if season_number == 1:
    print("summer")
elif season_number == 2:
    print("winter")
elif season_number == 3:
    print("fall")
elif season_number == 4:
    print("spring")

# D
# 10 times
# "Iteration number: 10"

# E
age = 25
last_name_initial = 'D'
currency = 3.7
abroad = True
apartment_number = 22

print("Age:", age)
print("Last name initial:", last_name_initial)
print("Currency:", currency)
print("Flew abroad:", abroad)
print("Apartment number:", apartment_number)

age_with_currency = age + currency
print("Age with currency:", age_with_currency)

# F
phone_number = input("Enter your phone number: ")
print("Phone number:", phone_number)

# G
def printHello():
    print("hello")

def calculate():
    result = 5 + 3.2
    print("Result:", result)

printHello()
calculate()

# H
def print_name(name):
    print("Name:", name)

def divide_by_two(number):
    result = number / 2
    print("Result:", result)

print_name("John")
divide_by_two(10)

# I
def add_numbers(num1, num2):
    return num1 + num2

def add_space_strings(str1, str2):
    return str1 + " " + str2

result_sum = add_numbers(5, 3)
print("Sum:", result_sum)

result_string = add_space_strings("Hello", "World")
print("Spaced string:", result_string)

# Challenges:

# K
rows = 5
for i in range(rows):
    print(' ' * (rows - i - 1) + '*' * (2 * i + 1))

# L
size = 7
for i in range(size):
    for j in range(size):
        if j == i or j == size - i - 1:
            print("*", end="")
        else:
            print(" ", end="")
    print()

# M
def get_number_from_user():
    return int(input("Enter a number: "))

def compute_digit_sum(number):
    total = 0
    while number > 0:
        total += number % 10
        number //= 10
    return total

number = get_number_from_user()
print("Sum of digits:", compute_digit_sum(number))
