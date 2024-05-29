/*
Consider a table/dataframe that contains all deliveries at DoorDash, with the following schema:
 
Table name: delivery_orders
delivery_id int --id of delivery
order_place_time timestamp -- time order was placed
delivery_rating int --delivery rating, scale from 0 to 5
dasher_id int --id of dasher / deliverer
restaurant_id int --id of restaurant
customer_id int --id of customer
 
Q: Pull the avg time between a customer’s first and second transaction.

*/



CREATE OR REPLACE TABLE zomato(
delivery_id INTEGER,
delivery_rating INTEGER,
order_place_time TIMESTAMP,
dasher_id INTEGER,
restaurant_id INTEGER,
customer_id INTEGER
);

INSERT OVERWRITE INTO zomato(delivery_id,delivery_rating,order_place_time,dasher_id,restaurant_id,customer_id)
VALUES(101,5,'2024-01-01 3:30:30',1001,10001,1),
(102,5,'2024-01-02 03:30:30',1001,10001,2),
(103,5,'2024-01-01 04:30:30',1001,10001,1),
(104,5,'2024-01-04 04:30:30',1001,10001,2),
(103,5,'2024-01-03 05:30:30',1001,10001,1),
(103,5,'2024-01-05 05:30:30',1001,10001,3),
(103,5,'2024-01-10 05:30:30',1001,10001,3),
(103,5,'2024-01-16 05:30:30',1001,10001,3);


WITH RECORDS AS (
SELECT customer_id,order_place_time,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_place_time) AS ROW_NUM
FROM zomato
),
MAX_MIN_TIME AS (
SELECT customer_id,
MAX(CASE WHEN ROW_NUM =1 THEN order_place_time END) FIRST_TRANS,
MAX(CASE WHEN ROW_NUM =2 THEN order_place_time END) SEOND_TRANS
FROM RECORDS WHERE ROW_NUM < 3
GROUP BY customer_id
)
SELECT customer_id,avg((DATEDIFF('day',FIRST_TRANS,SEOND_TRANS))) avg_time,
FROM MAX_MIN_TIME
where FIRST_TRANS is not null and SEOND_TRANS is not null
group by customer_id


WITH RECORDS AS (
SELECT customer_id,order_place_time,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_place_time) AS ROW_NUM
FROM zomato
)

SELECT customer_id,avg(customer_id)
FROM RECORDS WHERE ROW_NUM < 3
GROUP BY customer_id



    



