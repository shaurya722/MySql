create database USER;
use USER;

-- bank has many bank_emp

create table bank(
		Bank_Name varchar(34),
        Bank_IFSC varchar(45) primary key
);
 
 drop table bank;
-- bank_emp manage many customer and acc
 
create table bank_emp(
	Bank_emp_id INT,
    Bank_emp_name varchar(32),
    Bank_IFSC varchar(45),
    foreign key (Bank_IFSC) references bank(Bank_IFSC)
);

-- Create Customer table
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    cust_email VARCHAR(37)
);

-- Create Account table with a one-to-one relationship to Customer
CREATE TABLE acc (
    acc_no INT PRIMARY KEY,
    acc_holder_name VARCHAR(100),
    acc_type varchar(255),
    cust_id INT UNIQUE,  -- Unique foreign key to enforce one-to-one relationship
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

--  acc to cust has many transcation
CREATE TABLE transaction (
    cust_id INT,
    acc_no INT,
    PRIMARY KEY (cust_id, acc_no),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
    FOREIGN KEY (acc_no) REFERENCES acc(acc_no)
);


show create table transaction;


drop database USER;






