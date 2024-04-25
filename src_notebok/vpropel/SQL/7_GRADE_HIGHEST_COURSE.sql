
Create table If Not Exists Enrollments 
(student_id int, 
course_id int, 
grade int
);

insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95') ,
('2', '3', '95'),
('1', '1', '90'),
('1', '2', '99'),
('3', '1', '80'),
('3', '2', '75'),
('3', '3', '82');

+----------+---------+-----+
|student_id|course_id|grade|
+----------+---------+-----+
|         2|        2|   95|
|         2|        3|   95|
|         1|        1|   90|
|         1|        2|   99|
|         3|        1|   80|
|         3|        2|   75|
|         3|        3|   82|
+----------+---------+-----+

Output:
+----------+---------+-----+
|student_id|course_id|grade|
+----------+---------+-----+
|         1|        2|   99|
|         2|        2|   95|
|         3|        3|   82|
+----------+---------+-----+


/*
Write a SQL query to find the highest grade with its corresponding course for each student.
In case of a tie you should find the course with the smallest course_id. The output must be sorted by student_id
*/

WITH GRADE_DATE AS
(
SELECT STUDENT_ID,COURSE_ID,GRADE,DENSE_RANK() OVER(PARTITION BY STUDENT_ID ORDER BY GRADE DESC,COURSE_ID ASC) AS RNK
FROM ENROLLMENTS
)
SELECT STUDENT_ID, COURSE_ID,GRADE FROM GRADE_DATE
WHERE RNK = 1 ORDER BY STUDENT_ID

--Snowflake 
SELECT STUDENT_ID,COURSE_ID,GRADE
FROM ENROLLMENTS
QUALIFY DENSE_RANK() OVER(PARTITION BY STUDENT_ID ORDER BY GRADE DESC,COURSE_ID ASC) = 1
ORDER BY STUDENT_ID