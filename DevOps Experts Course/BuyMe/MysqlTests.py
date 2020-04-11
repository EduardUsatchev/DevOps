# Establishing a connection to DB

import pymysql
conn = pymysql.connect(host='remotemysql.com', port=3306, user='kVYHq6JaLm', passwd='WVbqe1BO8J', db='kVYHq6JaLm')
conn.autocommit(True)
# Getting a cursor from Database
cursor = conn.cursor()

# Getting all data from table “users”
cursor.execute("INSERT into users.players2 (name, id , age) VALUES ('Eduarduy', 4 , 35)")
cursor.execute("DELETE FROM users.players2 WHERE age=40")
cursor.execute("UPDATE users.players2 SET name='Yana' WHERE id='2'")
cursor.execute("SELECT * FROM users.players2 ;")



cursor.execute("INSERT into `dogs`.`dogs` (name,age,breed) VALUES ('Noam',12,'Puddle');")
cursor.execute("INSERT into `dogs`.`dogs` (name,age,breed) VALUES ('Zahi',10,'Yorksher');")
cursor.execute("INSERT into `dogs`.`dogs` (name,age,breed) VALUES ('Rexi',19,'Pitbull');")
cursor.execute("UPDATE into `dogs`.`dogs` SET age='2'  WHERE name='Zahi';")
cursor.execute("DELETE FROM `dogs`.`dogs`  WHERE name='Pitbull';")
cursor.execute("SELECT * FROM `dogs`.`dogs`;")
for row in cursor:
    print(row)




# Iterating table and printing all users
for row in cursor:
    print(row)

cursor.close()
conn.close()