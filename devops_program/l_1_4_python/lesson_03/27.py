try:
   myfile = open("../../working_files/read_my_content.txt", 'r')
   extracontents = myfile.write("\nsome more text\n")
except BaseException as e:
   print("Oops something when wrong.\nError is: " + str(e.args[0]))
finally:
   print("Closing file descriptor")
   myfile.close()
