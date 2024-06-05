---  =================DOORDASH ========================
/*
https://datalemur.com/blog/doordash-sql-interview-questions
*/


CREATE OR REPLACE TABLE orders (
order_id INT,
customer_id INT,
trip_id INT,
status STRING,
order_timestamp timestamp
);

CREATE OR REPLACE TABLE trips(
dasher_id INT,
trip_id INT,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp
);

CREATE OR REPLACE TABLE trips(
dasher_id INT,
trip_id INT,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp
);
CREATE OR REPLACE TABLE customers (
customer_id INT,
signup_timestamp timestamp
);
SELECT * FROM orders;
-- TRUNCATE TABLE orders;

INSERT INTO orders(order_id,customer_id,trip_id,status,order_timestamp)
VALUES(727424,8472,100463,'completed successfully','06/05/2022 09:12:00'),
(242513,2341,100482,'completed incorrectly','06/05/2022 14:40:00'),
(141367,1314,100362,'completed incorrectly','06/07/2022 15:03:00'),
(582193,5421,100657,'never_received','07/07/2022 15:22:00'),
(253613,1314,100213,'completed successfully','06/12/2022 13:43:00');

SELECT * FROM trips;
INSERT INTO trips(dasher_id,trip_id,estimated_delivery_timestamp,actual_delivery_timestamp)
VALUES(101,100463,'06/05/2022 09:42:00','06/05/2022 09:38:00'),
(102,100482,'06/05/2022 15:10:00','06/05/2022 15:46:00'),
(101,100362,'06/07/2022 15:33:00','06/07/2022 16:45:00'),
(102,100657,'07/07/2022 15:52:00',NULL),
(103,100213,'06/12/2022 14:13:00','06/12/2022 14:10:00');


SELECT * FROM customers;
INSERT INTO customers(customer_id,signup_timestamp)
VALUES(8472,'05/30/2022 00:00:00'),
(2341,'06/01/2022 00:00:00'),
(1314,'06/03/2022 00:00:00'),
(1435,'06/05/2022 00:00:00'),
(5421,'06/07/2022 00:00:00');

CREATE OR REPLACE TABLE orders (
order_id INT,
customer_id INT,
trip_id INT,
status STRING,
order_timestamp timestamp
);

CREATE OR REPLACE TABLE trips(
dasher_id INT,
trip_id INT,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp
);
CREATE OR REPLACE TABLE customers (
customer_id INT,
signup_timestamp timestamp
);

/*
Write a query that calculates the bad experience rate for new users who signed up in June 2022 during their first 14 days on the
*/
WITH JUNE_22_CUSTOMERS AS (
select c.customer_id,
o.order_id,
o.trip_id,
o.status,
from customers as c
join orders as o on c.customer_id = o.customer_id

where date_part('month',signup_timestamp) = 6
AND date_part('YEAR',signup_timestamp) = 2022
AND o.order_timestamp between c.signup_timestamp AND c.signup_timestamp + INTERVAL '14 DAYS'
),
total_count_22_cte as  (
SELECT COUNT(order_id) AS TOTAL_COUNT FROM JUNE_22_CUSTOMERS,
)
SELECT ROUND( 100 * COUNT(O.order_id) / (SELECT COUNT(order_id) FROM JUNE_22_CUSTOMERS),2) AS bad_experience_pct FROM JUNE_22_CUSTOMERS AS O
JOIN trips AS T ON T.trip_id = O.trip_id
WHERE O.status IN ('completed incorrectly', 'never received');


/*
you are asked to compute the average delivery duration of each driver for each day, 
the rank of each driver's daily average delivery duration, 
and the overall average delivery duration per driver.

*/
CREATE OR REPLACE TABLE deliveries(
delivery_id INT,
driver_id INT,
delivery_start_time timestamp,
delivery_end_time timestamp
);

SELECT * FROM deliveries;

INSERT INTO deliveries(delivery_id,driver_id,delivery_start_time,delivery_end_time)
VALUES(1,123,'08/01/2022 14:00:00','08/01/2022 14:40:00'),
(2,123,'08/01/2022 15:15:00','08/01/2022 16:10:00'),
(3,265,'08/01/2022 14:00:00','08/01/2022 15:30:00'),
(4,265,'08/01/2022 16:00:00','08/01/2022 16:50:00'),
(5,123,'08/02/2022 11:00:00','08/02/2022 11:35:00');


WITH RECORDS AS (
SELECT DRIVER_ID,
DATE(delivery_start_time) AS START_DATE,
DATE_PART('DAY',DELIVERY_START_TIME) AS DAY1,
DATEDIFF('MINUTE',delivery_start_time,delivery_end_time) AS DURATION
FROM deliveries
),
 AVG_REC AS (
SELECT DRIVER_ID,DAY1,
AVG(DURATION) OVER (PARTITION BY DRIVER_ID,START_DATE) AS AVG_DURATION_EACH_DAY,
FROM RECORDS
)
SELECT DRIVER_ID,AVG_DURATION_EACH_DAY,DAY1,
DENSE_RANK() OVER (PARTITION BY DRIVER_ID ORDER BY AVG_DURATION_EACH_DAY) AS RNK
FROM AVG_REC

/*

Given the restaurants, users, and orders tables below, please write a query to identify the top 5 restaurants with the most orders in the last month.
*/

CREATE OR REPLACE TABLE restaurants(restaurant_id STRING,restaurant_name STRING);

INSERT INTO restaurants(restaurant_id,restaurant_name)
VALUES('001','Burger King'),
('002','KFC'),
('003','McDonald'),
('004','Pizza Hut'),
('005','Starbucks');

SELECT * FROM restaurants;

CREATE OR REPLACE TABLE users(user_id INT,user_name STRING);
INSERT INTO users(user_id,user_name)
VALUES(101,'John Doe'),
(102,'Jane Smith'),
(103,'Bob Johnson'),
(104,'Alice Anderson'),
(105,'Emma Wilson');

SELECT * FROM users;

CREATE OR REPLACE TABLE orders (order_id INT,user_id INT,restaurant_id STRING,order_date DATE);

INSERT INTO orders (order_id,user_id ,restaurant_id ,order_date)
values (2001,101,'001','2022-10-01'),
(2002,102,'002','2022-10-02'),
(2003,101,'003','2022-10-03'),
(2004,103,'002','2022-10-04'),
(2005,102,'001','2022-10-05'),
(2006,104,'004','2022-10-06'),
(2007,105,'005','2022-10-07'),
(2008,101,'001','2022-10-08'),
(2009,102,'002','2022-10-09'),
(2010,104,'005','2022-10-10');


/*SELECT *, order_date + INTERVAL '1 MONTH'
FROM orders*/

SELECT r.restaurant_name,MONTH(order_date) as month1,
COUNT(o.order_id) 
from orders as o
join restaurants as r on o.restaurant_id = r.restaurant_id
group by r.restaurant_name,MONTH(order_date)
order by COUNT(o.order_id)  desc
limit 5;




