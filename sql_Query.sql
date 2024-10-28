SHOW DATABASES;

SHOW Tables;

CREATE DATABASE practice;

CREATE DATABASE IF NOT EXISTS practice;

CREATE DATABASE new;

DROP DATABASE IF EXISTS new;

USE practice;

CREATE TABLE employee(Id INT PRIMARY KEY,Name Varchar(30),Age INT Not NUll);


CREATE TABLE employee1(Id INT PRIMARY KEY,Name Varchar(30),Age INT Not NUll);

DROP TABLE employee1;

INSERT INTO employee VALUES(1,'abc',20); 

SELECT * FROM employee; 

INSERT INTO employee (Id,Name,Age) VALUES(2,'def',50);

INSERT INTO employee (Id,Name,Age) VALUES(3,'ghi',30),(4,'mno',40),(5,'pqr',13);


CREATE TABLE employee2(ID INT,Name VARCHAR(20),City VARCHAR(20),PRIMARY KEY(ID,Name));

INSERT INTO employee2 VALUES(101,'abc','surat'),(101,'def','Gandhinagar');

select * from employee2;


CREATE TABLE employee3(cust_ID INT,Name VARCHAR(28),FOREIGN KEY(cust_ID) REFERENCES employee(Id)) ;

SELECT * FROM employee3;
ALTER TABLE employee3 ADD COLUMN salary INT DEFAULT 25000;
insert into employee3 values(1,'abc',30000);
insert into employee3(cust_ID,Name) values(2,'def');
 



CREATE TABLE student(roll_no INT PRIMARY KEY,Name VARCHAR(50),marks INT NOT NULL,grade VARCHAR(1),city VARCHAR(20));

INSERT INTO student(roll_no,Name,marks,grade,city) VALUES (101,'Ankit',34,'C','Pune'),(102,'Bhumika',23,'E','Goa'),(103,'asd',43,'B','Mumbai'),(104,'zxc',12,'F','Delhi');

SELECT * FROM student;


SELECT AVG(Marks),city from student GROUP BY city ORDER BY AVG(Marks) DESC;

SELECT Name,roll_no from student where roll_no IN(select roll_no from student where roll_no % 2 = 0);

call get_student_info(31);







