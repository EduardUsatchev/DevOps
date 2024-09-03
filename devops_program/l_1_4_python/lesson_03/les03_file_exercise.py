import os
import csv

# Exercise 1: Reading a File
def read_file(file_name):
    with open(file_name, 'r') as file:
        data = file.read()
        print(data)

read_file("data.txt")

# Exercise : Writing to a File
def write_to_file(file_name):
    with open(file_name, 'w') as file:
        file.write("Hello, World!")

write_to_file("../../working_files/output.txt")

# Exercise 4: Appending to a File
def append_to_file(file_name):
    with open(file_name, 'a') as file:
        file.write("Goodbye!")

append_to_file("../../working_files/output.txt")

# Exercise 5: Checking if a File Exists
def check_file_existence(file_name):
    if os.path.exists(file_name):
        print(f"{file_name} exists!")
    else:
        print(f"{file_name} does not exist!")

check_file_existence("data.txt")

# Exercise 6: Copying a File
def copy_file(source, destination):
    with open(source, 'r') as src_file:
        with open(destination, 'w') as dest_file:
            dest_file.write(src_file.read())

copy_file("source.txt", "destination.txt")

