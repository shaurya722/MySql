create database BANK_ER;

use BANK_ER;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255)
);

-- Inserting customers
INSERT INTO customers (customer_name, contact_info) 
VALUES 
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob@example.com'),
    ('Charlie Brown', 'charlie@example.com');


select * from customers;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00
);

-- Inserting accounts
INSERT INTO accounts (account_type, balance) 
VALUES 
    ('Savings', 1000.00),
    ('Checking', 2000.00),
    ('Business', 5000.00);


select * from accounts;


CREATE TABLE customer_accounts (
    customer_id INT,
    account_id INT,
    account_role ENUM('Primary Holder', 'Joint Holder') DEFAULT 'Joint Holder',
    PRIMARY KEY (customer_id, account_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

INSERT INTO customer_accounts (customer_id, account_id, account_role)
VALUES
    (1, 1, 'Primary Holder'),  
    (2, 1, 'Joint Holder'),    
    (3, 3, 'Primary Holder');  

select * from customer_accounts;

SELECT * -- a.account_id, a.account_type, a.balance, ca.account_role 
FROM accounts a
JOIN customer_accounts ca ON a.account_id = ca.account_id
JOIN customers c ON ca.customer_id = c.customer_id
WHERE c.customer_name = 'Alice Johnson';


SELECT * -- c.customer_name, c.contact_info, ca.account_role
FROM customers c
JOIN customer_accounts ca ON c.customer_id = ca.customer_id
JOIN accounts a ON ca.account_id = a.account_id
WHERE a.account_type = 'Savings';




SELECT * -- c.customer_name, ca.account_role
FROM customer_accounts ca
JOIN customers c ON ca.customer_id = c.customer_id
WHERE ca.account_id = 1 AND ca.account_role = 'Joint Holder';




-- Bank and customer many to many
-- customer and account one to many
-- account and transcation one to many
-- bank and transaction one to many
-- bank_emp account one to many
-- transaction has debit and credit
