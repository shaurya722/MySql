use bank_db;

CREATE TABLE classA (
    id INT,
    student VARCHAR(20)
);

insert into classA values(1,'adam'),(2,'bob'),(3,'cassey');
insert into classB values(2,'English'),(5,'science'),(3,'math'),(4,'computer science');


create table classB(
id int,
course varchar(20));


select * from classA INNER JOIN classB ON 
classA.id = classB.id;

select * from classA LEFT JOIN classB ON classA.id = classB.id;

select * from classA Right JOIN classB ON classA.id = classB.id;


select * from classA LEFT JOIN classB ON classA.id = classB.id
UNION
select * from classA Right Join classB ON classA.id = classB.id;


select * from classA LEFT JOIN classB ON classA.id = classB.id where classB.id IS NULL;

select * from classB LEFT JOIN classA ON classA.id = classB.id where classA.id IS NULL;



use practice;

select new_function(2,3)
