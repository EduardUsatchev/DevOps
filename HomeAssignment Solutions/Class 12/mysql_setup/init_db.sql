
CREATE DATABASE homework_db;
USE homework_db;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);
INSERT INTO students (name, age) VALUES ('Alice', 22), ('Bob', 23), ('Charlie', 24);
