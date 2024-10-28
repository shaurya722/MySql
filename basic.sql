show databases;

use student;

CREATE TABLE customer(
    id INT,
    age INT,
    name VARCHAR(30)
);


delimiter //
create trigger age_verify
before insert on customer
for each row
if new.age < 0 then set new.age = 0;
end if; //

insert into customer values(1,20,'abc'),(2,-30,'asd');

select * from customer;


-- after insert trigger 


create table customer1(
id int auto_increment primary key,
name varchar(30) not null,
email varchar(20),birthdate date);

create table message(
id int auto_increment,
messageId int,
meassage varchar(300) not null,
primary key (id,messageId);