farray = []
sarray = [1, 2, True, "Edi"]
print(sarray[0] == sarray[1])

thisdict = {
  "brand": ["Ford", "subaru"],
  "model": "Mustang",
  "year": 1964,
}
print(thisdict)
thisdict["brand"] = "test"
print(thisdict["brand"])
print(thisdict)
del thisdict["brand"]
print(thisdict)

count= 3
print("count value reached %s" % (count))

# declaring numeric variables
num = 2021

# concatenating numeric value within string
print(" is %d here!! " % num)


# Prompting the user to input their age
age = int(input("Please enter your age: "))

# Checking various conditions based on age
if age < 0:
    print("Invalid age. Please enter a valid age.")
elif age < 18:
    print("You are a minor.")
elif age < 65:
    print("You are an adult.")
elif age < 100:
    print("You are a senior citizen.")
else:
    print("Wow! You are over 100 years old. Amazing!")

# Checking additional conditions based on age
if age >= 18:
    if age < 21:
        print("You are an adult but not old enough to drink alcohol in some countries.")
    else:
        print("You are old enough to drink alcohol in most countries.")
else:
    print("You are not old enough to drink alcohol.")

# Checking if the age is a prime number
is_prime = True
if age <= 1:
    is_prime = False
else:
    for i in range(2, int(age**0.5) + 1):
        if age % i == 0:
            is_prime = False
            break

if is_prime:
    print("Your age is a prime number!")
else:
    print("Your age is not a prime number.")

# Checking if the age is divisible by 5 or 10
if age % 5 == 0:
    print("Your age is divisible by 5.")
elif age % 10 == 0:
    print("Your age is divisible by 10.")
else:
    print("Your age is not divisible by 5 or 10.")

# Checking if the age is odd or even
if age % 2 == 0:
    print("Your age is even.")
else:
    print("Your age is odd.")
