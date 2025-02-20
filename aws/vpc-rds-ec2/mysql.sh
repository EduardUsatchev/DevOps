docker exec -it mysql-server mysql -uadmin -ppassword
SHOW DATABASES;
USE mydb;
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));
INSERT INTO users (name) VALUES ('John Doe');
SELECT * FROM users;
EXIT;
mysql -h 127.0.0.1 -P 3306 -u admin -ppassword
