create database em;
use em;

drop database em;
-- CREATE TABLE Bank (
--     bank_id INT PRIMARY KEY AUTO_INCREMENT,
--     bank_name VARCHAR(100) NOT NULL,
--     location VARCHAR(100)
-- );

-- CREATE TABLE Customer (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_name VARCHAR(100) NOT NULL,
--     contact_info VARCHAR(255)
-- );

-- CREATE TABLE Account (
--     account_id INT PRIMARY KEY AUTO_INCREMENT,
--     account_type VARCHAR(50) NOT NULL,
--     balance DECIMAL(15, 2) DEFAULT 0.00,
--     customer_id INT,
--     bank_id INT,
--     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
--     FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
-- );

-- CREATE TABLE Transaction (
--     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
--     transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--     amount DECIMAL(15, 2),
--     transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer'),
--     account_id INT,
--     bank_id INT,
--     FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
--     FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
-- );

-- CREATE TABLE Bank_Employee (
--     employee_id INT PRIMARY KEY AUTO_INCREMENT,
--     employee_name VARCHAR(100) NOT NULL,
--     position VARCHAR(50),
--     bank_id INT,
--     FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
-- );

-- CREATE TABLE Bank_Customer (
--     bank_id INT,
--     customer_id INT,
--     PRIMARY KEY (bank_id, customer_id),
--     FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE,
--     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
-- );




CREATE TABLE Bank (
    bank_id INT PRIMARY KEY AUTO_INCREMENT,
    bank_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255)
);

CREATE TABLE Account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    customer_id INT,
    bank_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    account_id INT,
    bank_id INT,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

CREATE TABLE Debit (
    debit_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT,
    amount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id) ON DELETE CASCADE
);

CREATE TABLE Credit (
    credit_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT,
    amount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id) ON DELETE CASCADE
);

CREATE TABLE Bank_Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    bank_id INT,
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

drop table Bank_Employee;

CREATE TABLE Bank_Customer (
    bank_id INT,
    customer_id INT,
    PRIMARY KEY (bank_id, customer_id),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

