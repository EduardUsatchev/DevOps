
import random


def func_a(x, y):
    if x == y:
        print(f"Both numbers are equal !!! x {x} y {y}")
    elif x > y:
        print(f"x ({x}) is bigger than y ({y})")
    else:
        print(f"y ({y}) is bigger than x ({x})")


def func_b():
    for i in range(5):
        print("this is iteration number : ", i)


def func_c():
    number = random.randint(1, 4)
    options = ["summer", "winter", "fall", "spring"]
    print(f"the number that has generate is {number} and season is ", options[number])


def func_d():
    count = 1
    while (count < 11):
        print(count)
        count = count + 1


def func_e():
    Dict = {"age": 48,
            "first_letter": "m",
            "currency": 3.5,
            "flew abroad": True,
            "apartment number": "47"}
    print(Dict)
    print(Dict["age"] + Dict["currency"])

def func_f():
    phone = "-1"
    while len(phone) != 10 :
        phone = input ("please enter your phone number ")
        if (phone.isdigit() and len(phone) == 10) :
            print (f"phone number is : ",phone)
        else:
            print ("phone number is not valid")
            func_f()

def func_g1():
    print ("Helo")

def func_g2():
    print (5 + 3.2)

def func_h(name , number):
    print(f"your name {name}")
    result = number / 2
    print(f"your number {number} devided in 2 {result}")

def func_i(num1,num2,str1,str2):
    result2 = num1 + num2
    print(f"the sum of {num1} + {num2} is : {result2}")
    str3 = str1 + " " + str2
    print(f"the new string is {str3}")

def func_m(number):
    if number<10 or number > 99 :
        print(f"the number you selected is {number} number must be between 10-99")
    else:
        a = number % 10
        b = number // 10
        res_ab = a + b
        print(f"the digits sum of number {number} digit is {res_ab}")


# running test

func_a(4,5)
func_a(14,5)
func_a(4,4)

func_b()

func_c()
func_c()
func_c()

func_d()

func_e()

func_f()

func_g1()

func_g2()

func_h("maor",100)
func_h("edi",200)

func_i(3,5,"maor","taieb")
func_i(5 , 5 , "kill" , "bill")

func_m(100)
func_m(99)
