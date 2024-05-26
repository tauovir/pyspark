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