

CREATE TABLE IF NOT EXISTS stock
(stock_date date, price number);

insert into stock(stock_date,price)
values('2020-01-07',1320),
('2020-01-08',1320),
('2020-01-09',1300),
('2020-01-10',1300),
('2020-01-11',1200),
('2020-01-12',1100),
('2020-01-13',1400),
('2020-01-14',1400),
('2020-01-15',1500);



-- rolling means/rolling averages/running averages,
--- THREE DAYS ROLLING AVERGARE :  2 PRECEDING + CURRENT ROW
--

SELECT STOCK_DATE,PRICE,
AVG(PRICE) OVER(ORDER BY STOCK_DATE ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MOVING_AVERAGE
FROM stock;

