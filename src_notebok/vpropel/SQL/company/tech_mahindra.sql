CREATE or replace  TABLE EMP_MNG(
EMP_ID INTEGER,
EMP_NAME STRING,
SALARY INT,
MANAGER_ID INT
);

INSERT INTO EMP_MNG(EMP_ID,EMP_NAME,SALARY,MANAGER_ID)
VALUES(10,'Alex',5000,18),
(11,'Angelo',75000,16),
(12,'Micheal',40000,18),
(13,'Nash',70000,17),
(14,'Patric',70000,18),
(15,'Mark',45000,18),
(16,'Rick',90000, null),
(17,'Todd',85000,16),
(18,'Sam',70000,17);

/*
Write a query that will show the Average Salary of the Employees reporting to each manager in the following table format
| Manager_Id | Manager_Name | Average_Salary_Emp |
*/
--METHOD-1

SELECT e.emp_name as manager_name,m.manager_id,m.salary from EMP_MNG as e
inner join(
SELECT
MANAGER_ID,
CAST(AVG(SALARY) AS INT) AS SALARY FROM EMP_MNG WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID) m
on e.emp_id = m.manager_id;

--METHOD-2
SELECT m.Emp_name as Manager_Name,m.Emp_Id as Manager_Id,
AVG(e.salary)::INT as salary from EMP_MNG as e
inner join EMP_MNG as m on m.Emp_Id = e.Manager_Id
GROUP BY m.Emp_Id,m.Emp_name;




/*
find total_confirmation,and total amount of customer
confirmation :  confirmation > 20 
*/


CREATE TABLE wallet 
(
walet_id  INTEGER,
amount INTEGER,
confirmation INTEGER
);


CREATE TABLE customer 
(
id  INTEGER,
name VARCHAR(120),
address VARCHAR(120)
);

select * from wallet;
select * from customer;

INSERT INTO customer(id,name,address)
VALUES(1,'Taukir','MEERUT'),
(2,'TAUKIR','KANPUR'),
(3,'SAB','AGRA'),
(4,'GANGA','DELHI');

INSERT INTO wallet(walet_id,amount,confirmation)
VALUES(1,100,25),
(2,150,30),
(3,200,40),
(1,300,26),
(2,150,30),
(3,500,50),
(4,2000,12);





with records as (
SELECT walet_id,COUNT(walet_id) as wallet_cnt,
SUM(amount) as amount_sum
from wallet where confirmation > 20
group by walet_id ORDER BY walet_id
	)
select c.name,c.address,
w.wallet_cnt,w.amount_sum
from customer as c join records as w on c.id = w.walet_id
order by w.amount_sum desc

select c.name,c.address,
COUNT(w.walet_id) as wallet_cnt, 
SUM(w.amount) as amount_sum
from customer as c join wallet as w on c.id = w.walet_id
where w.confirmation > 20
group by c.name,c.address
order by amount_sum desc

--- Below method can not be use every condition
/*
SELECT walet_id,COUNT(CASE WHEN confirmation > 20 THEN walet_id END) as wallet_cnt,
SUM(CASE WHEN confirmation > 20 THEN amount END) as amount_sum
from wallet
group by walet_id ORDER BY walet_id
*/
