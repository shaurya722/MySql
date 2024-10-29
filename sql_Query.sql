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




use practice;

show tables in student;

show triggers in student;


-- Create the customer2 table
CREATE TABLE customer2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(20),
    birthdate DATE
);

-- -- Create the message2 table
CREATE TABLE message2 (
    id INT AUTO_INCREMENT,
    messageId INT,
    message VARCHAR(300) NOT NULL,
    PRIMARY KEY (id)
);


-- -- Create the trigger
DELIMITER //

CREATE TRIGGER check_null_dob
AFTER INSERT ON customer2
FOR EACH ROW
BEGIN
    IF NEW.birthdate IS NULL THEN
        INSERT INTO message2 (messageId, message)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please enter your birthdate.'));
    END IF;
END //

DELIMITER ;

-- -- Insert records into customer2
INSERT INTO customer2 (name, email, birthdate) 
VALUES 
    ('abc', 'abc@gmail.com', '1998-11-16'),
    ('zxc', 'zxc@gmail.com', NULL),
    ('asd', 'asd@gmail.com', '2000-07-12'),
    ('qwe', 'qwe@gmail.com', NULL);

-- -- Check messages in message2
SELECT * FROM message2;

SELECT * FROM customer2;





-- after insert

create table stdent_info(
id int primary key,
name varchar(23),
marks int default null); 

insert into stdent_info values(1,'alice',23),(2,'carry',54),(3,'mit',76);

select * from stdent_info;

create table stdent_info_time(
id int primary key,
name varchar(23),
marks int default null,
LastInserted time); 

select * from stdent_info_time;

-- delimiter //
-- create trigger after_insert_details
-- after insert in stdent_info
-- for each row
-- begin
-- insert into student_detail_time values(new.id,new.name,new.marks,CURTIME());
-- end;

-- delimiter ;

show triggers;

insert into stdent_info values(4,'john',45);

-- before  update

create table sale_info(
id int primary key,
product varchar(100),
quantity int
);


insert into sale_info 
values
(1,'maruti',110),
(2,'honda',203),
(3,'tata',150);


-- DELIMITER $$  
--   
-- CREATE TRIGGER before_update_salesInfo  
-- BEFORE UPDATE  
-- ON sales_info FOR EACH ROW  
-- BEGIN  
--     DECLARE error_msg VARCHAR(255);  
--     SET error_msg = ('The new quantity cannot be greater than 2 times the current quantity');  
--     IF new.quantity > old.quantity * 2 THEN  
--     SIGNAL SQLSTATE '45000'   
--     SET MESSAGE_TEXT = error_msg;  
--     END IF;  
-- END $$  

-- DELIMITER ;

select * from sale_info;
update sale_info set quantity = 600 where id = 2;
update sale_info set quantity = 123 where id = 2;


-- after update

select * from student;

create table student_log(
user varchar(23),
descreption varchar(255) NOT NULL);

update student set city = 'pune' where roll_no = 102;

select * from student_log;

select * from student;

create view view1 AS
select roll_no,Name,city,marks from student;

select * from view1;



