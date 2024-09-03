# Part A
X = 10
Y = 5

if X > Y:
    print("BIG")
elif X < Y:
    print("small")

# Part B
for i in range(1, 6):
    print("Iteration number:", i)

# Part C
season_number = 3

if season_number == 1:
    print("summer")
elif season_number == 2:
    print("winter")
elif season_number == 3:
    print("fall")
elif season_number == 4:
    print("spring")

# Part D
# 1. The loop will run 10 times (from 0 to 9)
# 2. The last value printed will be 9
for i in range(10):
    print(i)

# Part E
age = 25
last_name_initial = 'D'
currency = 3.5
abroad_travel = True
apartment_number = 15

print("Age:", age)
print("Last name initial:", last_name_initial)
print("Currency:", currency)
print("Abroad travel:", abroad_travel)
print("Apartment number:", apartment_number)

result = age + currency
print("Age + Currency:", result)

# Part F
phone_number = input("Please enter your phone number: ")
print("Phone number:", phone_number)

# Part G
def printHello():
    print("hello")

def calculate():
    result = 5 + 3.2
    print("Result:", result)

printHello()
calculate()

# Part H
def print_name(name):
    print("Name:", name)

def divide_by_two(number):
    result = number / 2
    print("Result of division by two:", result)

print_name("John")
divide_by_two(10)

# Part I
def add_numbers(a, b):
    return a + b

def concatenate_strings(str1, str2):
    return str1 + ' ' + str2

result_sum = add_numbers(5, 3)
print("Sum of numbers:", result_sum)

result_concatenation = concatenate_strings("Hello", "world")
print("Concatenated string:", result_concatenation)

# Challenge K: Pyramid shape
for i in range(1, 6):
    print(" " * (5 - i) + "*" * (2*i - 1))

# Challenge L: X shape
for i in range(7):
    for j in range(7):
        if i == j or j == 6 - i:
            print("*", end="")
        else:
            print(" ", end="")
    print()

# Challenge M
def get_number():
    return int(input("Enter a number: "))

def sum_of_digits(number):
    total = 0
    while number:
        total += number % 10
        number //= 10
    return total

number = get_number()
result = sum_of_digits(number)
print("Sum of digits:", result)
