import time
import datetime

def f1(func):
    def wrapper(*args, **kwargs):
        print("Hello")
        func(*args, **kwargs)
        print("End")
    return wrapper

@f1
def f2(a , b=9):
    print(a, b)

f2("Hi")


# Use cases

def timer(func):
    def wrapper():
        before = time.time()
        func()
        print("Function took:" , time.time() - before, "seconds")
    return wrapper

@timer
def run():
    time.sleep(2)

run()


def sample(func):
    def wrapper(*args, **kwargs):
        with open("../../working_files/sample.txt", "a") as f:
            f.write("Called function with" + " ".join([str(args) for arg in args]) + " at " + str(datetime.datetime.now()) + " \n")
        val = func(*args, **kwargs)
        return val
    return wrapper

@sample
def run2(a, b, c=9):
    print(a+b+c)


run2(1, 3, c=9)
