-- show databases;

-- use student;

-- CREATE TABLE customer(
--     id INT,
--     age INT,
--     name VARCHAR(30)
-- );


-- delimiter //
-- create trigger age_verify
-- before insert on customer
-- for each row
-- if new.age < 0 then set new.age = 0;
-- end if; //

-- insert into customer values(1,20,'abc'),(2,-30,'asd');

-- select * from customer;


-- --- Create the customer2 table
-- CREATE TABLE customer2 (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(30) NOT NULL,
--     email VARCHAR(20),
--     birthdate DATE
-- );

-- -- Create the message2 table
-- CREATE TABLE message2 (
--     id INT AUTO_INCREMENT,
--     messageId INT,
--     message VARCHAR(300) NOT NULL,
--     PRIMARY KEY (id)
-- );

-- -- Create the trigger
-- DELIMITER //

-- CREATE TRIGGER check_null_dob2
-- AFTER INSERT ON customer2
-- FOR EACH ROW
-- BEGIN
--     IF NEW.birthdate IS NULL THEN
--         INSERT INTO message2 (messageId, message)
--         VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please enter your birthdate.'));
--     END IF;
-- END //

-- DELIMITER ;

-- -- Insert records into customer2
-- INSERT INTO customer2 (name, email, birthdate) 
-- VALUES 
--     ('abc', 'abc@gmail.com', '1998-11-16'),
--     ('zxc', 'zxc@gmail.com', NULL),
--     ('asd', 'asd@gmail.com', '2000-07-12'),
--     ('qwe', 'qwe@gmail.com', NULL);

-- -- Check messages in message2
-- SELECT * FROM message2;

-- SELECT * FROM customer2;




-- before update


-- create table emp(emp_id INT PRIMARY KEY,emp_name VARCHAR(25),age INT,salary float);

-- insert into emp values(101,'jimmy',35,70000),(102,'shane',30,55000),(103,'Marry',28,62000);

-- delimiter //
-- create trigger upd_trigger
-- before update
-- on emp
-- for each row
-- begin
-- if new.salary = 10000 then 
-- set new.salary = 85000;
-- elseif new.salary < 10000 then
-- set new.salary = 72000;
-- end if;
-- end //
-- delimiter ;



-- UPDATE emp SET salary = 8000 WHERE emp_id = 102;

-- select * from emp;


-- after update

create table salary(
eid int primary key,
validationfrom date not null,
amount float not null);

insert into salary(eid,validationfrom,amount)
values (101,'2025-08-01',68000),
(102,'2007-05-03',55000),
(103,'2006-09-02',75000);


select * from salary;

create table salarydel(id int primary key auto_increment,
eid int ,validationfrom date not null,
amount float not null,
deletedat timestamp default now());


delimiter $$

create trigger salary_delete
before delete on salary
for each row
begin
insert into salarydel(eid,validationfrom,amount)
values (old.eid,old.validationfrom,old.amount);

end$$
delimiter ;
delimiter $$

create trigger salary_delete
before delete on salary
for each row
begin
insert into salarydel(eid,validationfrom,amount)
values (old.eid,old.validationfrom,old.amount);

end$$
delimiter ;

delete from salary
where eid = 103;

select * from salarydel;