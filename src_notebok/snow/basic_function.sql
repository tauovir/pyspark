
-- Return character for each integer
SELECT CHAR(100);

-- Returns the position of a substring within the given string.
SELECT CHARINDEX('s', 'Tutorialspoint') As charindex;

SELECT CONCAT_WS('|','khan','taukir') as name;
select CONCAT('Banana',' ','Mango') as concat_str;
-- lENGHT OF STRING
SELECT 'MANGO' AS NAME,LEN('MANGO') AS L1;

--Trim/LTRIM()/RTRIM()
SELECT ' KHAN ' AS NAME, TRIM(' KHAN ') AS NAME2;

--- REPLACE SUBSTRING FROM STRING
SELECT REPLACE('KHAN IS EATING MANGO AND APPLE AND MANGO', 'MANGO2', 'PINEAPPLE');

-- REVERSE STRING
SELECT 'KHAN' AS NAME,REVERSE('KHAN') AS RE_NAME;

--RIGHT
SELECT RIGHT('Hello how are you', 10);

SELECT * FROM PIVOTE101;
-- SELECT EMPID, STRING_AGG(MONHT1,',') FROM PIVOTE101 GROUP BY EMPID;
SELECT EMPID, LISTAGG(DISTINCT MONHT1,',') FROM PIVOTE101 GROUP BY EMPID;

SELECT SPLIT('Java IS A PROGRAMMING LANGUAGE',' ');

SELECT ARRAY_TO_STRING(SPLIT('Java IS A PROGRAMMING LANGUAGE',' '),'|');

SELECT SUBSTRING('Hello World', 2, 5) AS NEW_STRING;
select 'khan' as name, upper('khan') as name2;


--------DATE FUNCTION----------
select DATE_PART('month','2024-05-06'::date) as date_par;
SELECT EXTRACT('MONTH', '2024-05-01'::DATE);
select month('2024-05-06'::date) as date_par;

select to_date('24-05-2024','dd-mm-yyyy') as date2;
select CAST('2024-05-01' as date) as bb;

SELECT DATEDIFF('day','2024-05-01'::date, '2024-05-12'::date) as date_diff;
SELECT TO_DATE('2013-05-08') AS v1, DATEADD(year, 2, TO_DATE('2013-05-08')) AS v;

-------------like wild card
--https://www.w3schools.com/sql/sql_wildcards.asp

select * from flats
where city like '_'




