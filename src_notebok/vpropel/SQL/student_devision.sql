CREATE DATABASE IF NOT EXISTS CBAY;
CREATE SCHEMA IF NOT EXISTS STAGING;


CREATE OR REPLACE TABLE VPRO_STUDENT (
	student_id NUMBER(38,0) autoincrement start 1 increment 1 order,
	name VARCHAR(16777216),
	CREATED_AT DATE DEFAULT CURRENT_DATE()
);
INSERT INTO VPRO_STUDENT(name)
	VALUES ('Khan'),
	('Rahul'),
	('Lavan');



CREATE OR REPLACE TABLE VPRO_STUDENT_MARKS (
	student_id NUMBER(38,0),
	subject VARCHAR(16777216),
    marks NUMBER(38,0),
	CREATED_AT DATE DEFAULT CURRENT_DATE()
);
INSERT INTO VPRO_STUDENT_MARKS(student_id,subject,marks)
	VALUES (1,'Pyspark',90),
	(1,'SQL',100),
	(2,'SQL',70),
    (2,'Pyspark',60),
    (3,'SQL',30),
    (3,'Pyspark',20);


'''
Calculate the % Marks for each student.
Each subject is of 100 marks. Create the Division column by following the below condition.

% Marks greater than or equal to 70 then "Distinction"
% Marks range between 60-69 then "First class"
% Marks range between 50-59 then "Second class"
% Marks range between 40-49 then "Third class"
% Marks less then or equal to 39 the "fail"

+----------+-----+----------+-----------+
|student_id| name|percentage|   Division|
+----------+-----+----------+-----------+
|         1| Khan|      95.0|   Distinct|
|         2|Rahul|      65.0|First class|
|         3|Lavan|      25.0|       Fail|
+----------+-----+----------+-----------+

'''
SELECT * FROM VPRO_STUDENT;
SELECT * FROM VPRO_STUDENT_MARKS;

WITH DATA AS (
SELECT S.STUDENT_ID,S.NAME,M.SUBJECT,M.MARKS,
SUM(M.MARKS) OVER(PARTITION BY S.STUDENT_ID) AS TOTAL_MARKS,
ROW_NUMBER() OVER(PARTITION BY S.STUDENT_ID ORDER BY S.STUDENT_ID ASC) AS RN,
ROUND((TOTAL_MARKS * 100)/200,2) AS PER,
CASE
WHEN PER >=70 THEN 'DISTINCT'
WHEN PER BETWEEN 60 AND 69 THEN 'FIRST DIVISION'
WHEN PER BETWEEN 50 AND 59 THEN 'Second class'
WHEN PER BETWEEN 40 AND 49 THEN 'Third class'
ELSE 'FAIL' END AS Division
FROM VPRO_STUDENT S
INNER JOIN VPRO_STUDENT_MARKS AS M ON  S.STUDENT_ID = M.STUDENT_ID
)
SELECT STUDENT_ID,NAME,MARKS,TOTAL_MARKS,PER,Division
FROM DATA WHERE RN=1 ORDER BY PER DESC;