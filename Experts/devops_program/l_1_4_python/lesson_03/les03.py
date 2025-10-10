#
# def append_name_to_file(name):
#     with open('names.txt', 'a') as file:
#         file.write(name + '\n')
#
# names = ["John", "Emily", "Michael"]
# for name in names:
#     append_name_to_file(name)
#
# def greet_with_blessing():
#     with open('names.txt', 'r') as file:
#         names = file.readlines()
#         for name in names:
#             print("Hello", name.strip() + "! May blessings be upon you.")
#
# greet_with_blessing()
#
#
# # myfile = open("read_my_content.txt",'w+')
# # extracontents = myfile.write("some more \n")
# # myfile.close()
# # myfile = open("read_my_content.txt",'a')
# # myfile.write("\neduard")
# # myfile = open("read_my_content.txt",'r+')
# #
# # alllines = myfile.readlines()
# # print(alllines)
# #
# # edifile = open("test_dir/edi.txt","r")
# # print(edifile.readlines())
# #
# # for line in alllines:
# #     print(line, end="")
# # myfile.close()
#
#
#
# # # # Open file in read mode
# # # with open('sample.txt', 'r') as file:
# # #     data = file.read()
# # #     print(data)
# #
# # # Writing to a File:
# # # Open file in write mode
# # with open('output.txt', 'w') as file:
# #     file.write("Hello, world!")
# #
# # # Appending to a File:
# # # Open file in append mode
# # with open('output.txt', 'a') as file:
# #     file.write("\nAppending more content.")
# #
# # # Reading Line by Line:
# # # Open file in read mode
# # with open('sample.txt', 'r') as file:
# #     for line in file:
# #         print(line.strip())  # strip() removes newline characters
# #
# # # Advanced Examples:
# # # Working with CSV Files:
# # # Writing to a CSV file
# # import csv
# # with open('data.csv', 'w', newline='') as csvfile:
# #     writer = csv.writer(csvfile)
# #     writer.writerow(['Name', 'Age'])
# #     writer.writerow(['edi', 25])
# #     writer.writerow(['Alice', 30])
# #
# # # Reading from a CSV file
# # with open('data.csv', 'r') as csvfile:
# #     reader = csv.reader(csvfile)
# #     for row in reader:
# #         print(row)
# #
# #
# #
# # #
# # try:
# #    myfile = open("read_my_content.txt", 'r')
# #    extracontents = myfile.write("\nsome more text\n")
# # except BaseException as e:
# #    print("Oops something when wrong.\nError is: " + str(e.args[0]))
# # finally:
# #    print("Closing file descriptor")
# #    myfile.close()
# #
# #
# # #Try and catch exercise
# # while True:
# #     try:
# #         num = float(input("Enter a number: "))
# #         if num < 0:
# #             raise ValueError("Number cannot be negative.")
# #         break  # Break out of the loop if input is valid
# #     except ValueError as e:
# #         print("Error:", e)
# #         print("Please enter a non-negative number.")
# #
# # print("You entered:", num)
