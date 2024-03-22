You are given a table flats with the following structure:
create table flats (
id integer primary key,
city varchar(40) not null,
price integer not null
);

INSERT INTO flats(ID,CITY,PRICE)
VALUES(1,'meerut',200),
(2,'meerut',150),
(3,'meerut',100),
(7,'meerut',100),
(4,'kanpur',99),
(5,'kanpur',99),
(6,'Delhi',100);

select ID, CITY, PRICE,
FROM flats 
QUALIFY ROW_NUMBER() OVER( PARTITION BY CITY ORDER BY PRICE) < 4


-- Each row of table flats represents a flat located in city available for sale
-- for a given price.
-- Write an SQL query that, for each city finds the three cheapest flats located in
-- that city. In case of a tie, the query may return any three flats with the
-- cheapest prices.
-- The result table should contain three columns: id, city and price and
-- should be sorted by id column. If the city has less than three flats for sale,
-- the result table should contain all of them.
-- Please use an OVER clause to simplify your solution.