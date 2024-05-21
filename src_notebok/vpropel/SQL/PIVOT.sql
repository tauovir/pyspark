select * from CBAY.SC.PIVOTE101

create or replace TABLE PIVOTE101 (
	EMPID NUMBER(38,0),
	AMOUNT NUMBER(38,0),
	MONHT1 VARCHAR(100)
);

INSERT INTO PIVOTE101(empid, amount, month)
    (1, 10000, 'JAN'), 
    (1, 400, 'JAN'),
    (2, 4500, 'JAN'),
    (2, 35000, 'JAN'),
    (1, 5000, 'FEB'),
    (1, 3000, 'FEB'),
    (2, 200, 'FEB'),
    (2, 90500, 'FEB'),
    (1, 6000, 'MAR'),
    (1, 5000, 'MAR'),
    (2, 2500, 'MAR'),
    (2, 9500, 'MAR');

select get_ddl('table','PIVOTE101');


select * from PIVOTE101
pivot(avg(amount) for MONHT1 in ('JAN','FEB','MAR')) as p (EMPID, JAN, FEB, MAR)
order by empid;


-- select * from PIVOTE101
-- pivot(avg(amount) for MONHT1 in (SELECT MONHT1 WHERE AMOUNT > 10000 )) as p 
-- order by empid;

-- UNPIVOTE
create or replace TABLE UNPIVOTE (
	EMPID NUMBER(38,0),
	DEPT VARCHAR(16777216),
	JAN VARCHAR(16777216),
	FEB VARCHAR(16777216),
	MAR VARCHAR(16777216)
);

INSERT INTO UNPIVOTE(empid, dept, jan, feb, mar);
(1, 'electronics', 100, 200, 300),
(2, 'clothes', 100, 300, 150),
(3, 'cars', 200, 400, 100);



select * from UNPIVOTE
unpivot (sales for month in (jan, feb, mar))
order by empid;