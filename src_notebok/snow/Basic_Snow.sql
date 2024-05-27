select ceil(0.4) -- Ciel function goes up
select ceil(1.3);
-- Florr function goes down
select floor(0.4)
select floor(1.3)

select round(1.555,2)

---- DATE
-- truncate table date_tbl
create table if not exists date_tbl(date1 string,date2 string,date3 string);
insert into date_tbl(date1, date2,date3)
Values('2024-03-24','24-03-2024','24-Mar-2024'),
('2024-03-26','26-03-2024','26-Mar-2024');

select * from date_tbl;
,month(DATE2::DATE),month(DATE3::DATE) 
select month(DATE1::date) as month1,DAY(DATE1::date) as day1 from date_tbl;

select to_date(DATE2,'dd-mm-yyyy') as formated_date,
MONTH(to_date(DATE2,'dd-mm-yyyy')) as month1,
DAY(to_date(DATE2,'dd-mm-yyyy')) as DAY1
from date_tbl;

select to_date(DATE3,'dd-MON-yyyy') as formated_date,
MONTH(to_date(DATE3,'dd-MON-yyyy')) as month1,
DAY(to_date(DATE3,'dd-MON-yyyy')) as DAY1
from date_tbl;


----- COUND and SUM with CASE
CREATE table EMPCASE(name string,country string, budget float);
TRUNCATE TABLE EMPCASE;
INSERT INTO EMPCASE(name,country, budget)
VALUES('RAHUL','INDIA',1000),
('TAUKIR','INDIA',2000),
('ZEENAT','CANADA',3000),
('KANIZ','CANADA',4000),
('MANGO','GERMANY',NULL),
('ORANGE',Null,0);

SELECT * FROM EMPCASE;
-- COUNT COUNTRIES : It will skipp null values;
SELECT COUNT(COUNTRY) FROM EMPCASE;
-- cound india country
SELECT COUNT(case when COUNTRY='INDIA' then 1 else null end) count_india FROM EMPCASE;

SELECT sum(case when COUNTRY='INDIA' then budget else 0 end) count_india FROM EMPCASE;


create table emp101 (name string);.
insert into emp101(name)
values(null),(null),('banana'),('orange');

select * from emp101;

--- Count function incluede null values
select count(*) as cnt from emp101;
--- COund null values
select count(case when name is null then 1 end) as cnt from emp101;
