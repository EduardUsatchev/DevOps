def my_decorator(func):
    def wrapper():
        print("Something is happening before the function is called.")
        func()
        print("Something is happening after the function is called.")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()


def multiply_by_two(func):
    def wrapper(x):
        result = func(x) * 2
        print(f"The result after multiplying by two: {result}")
        return result
    return wrapper

@multiply_by_two
def add_five(x):
    return x + 5

result = add_five(10)
print(f"Final result: {result}")
