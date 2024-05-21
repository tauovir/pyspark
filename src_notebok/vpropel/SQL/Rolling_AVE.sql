SELECT
   date_time,
   stock_price,
   TRUNC(AVG(stock_price)
         OVER(ORDER BY date_time ROWS BETWEEN 3 PRECEDING AND CURRENT ROW), 2)
         AS moving_average
FROM stock_values;