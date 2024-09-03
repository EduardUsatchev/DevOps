def my_printer(prefix, amount_of_times):
    my_variable = 5
    for i in range(amount_of_times):
        print(prefix + str(i))


def mul_five(my_number):
    result = my_number * 5
    return result

if mul_five(10) > 1:
    my_printer("more then ", 10)