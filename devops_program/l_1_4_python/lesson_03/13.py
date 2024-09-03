my_file = open("../../working_files/names.txt", "w")
for name in my_file.writelines(["moshe"]):
    print("hello " + name, end='')
my_file.close()