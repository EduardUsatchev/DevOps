# 1 Printing the square of all numbers from 0 to 10:

for num in range(11):
    print(f"The square of {num} is {num * num}")
# 2 Finding the sum of all even numbers from 0 to 10:

sum_even = 0
for num in range(0, 11, 2):
    sum_even += num
print(f"The sum of all even numbers from 0 to 10 is {sum_even}")

# 3 Checking how many numbers between 'a' and 'b' are divisible by 'c':

a = int(input("Enter the value of 'a': "))
b = int(input("Enter the value of 'b': "))
c = int(input("Enter the value of 'c': "))

count = 0
for num in range(a, b + 1):
    if num % c == 0:
        count += 1

print(f"There are {count} numbers between {a} and {b} that are divisible by {c}")

# 4 Python program to get the following output:

for i in range(1, 100):
    print(f"{i}-----{100 - i}")


def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)


num = int(input("Enter a number: "))
print(f"The factorial of {num} is {factorial(num)}")


def is_prime(n):
    if n <= 1:
        return False
    elif n <= 3:
        return True
    elif n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True


num = int(input("Enter a number: "))
if is_prime(num):
    print(f"{num} is a prime number")
else:
    print(f"{num} is not a prime number")


def count_primes(start, end):
    count = 0
    primes = []
    for num in range(start, end + 1):
        if is_prime(num):
            count += 1
            primes.append(num)
    return count, primes

def is_prime(n):
    if n <= 1:
        return False
    elif n <= 3:
        return True
    elif n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

start = 0
end = 100

prime_count, prime_list = count_primes(start, end)

print("Prime numbers between 0 and 100 are:")
print(prime_list)
print(f"Total prime numbers between 0 and 100: {prime_count}")
