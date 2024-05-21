
--- Need to explore
SELECT
   date_time,
   stock_price,
   TRUNC(AVG(stock_price)
         OVER(ORDER BY date_time ROWS BETWEEN 3 PRECEDING AND CURRENT ROW), 2)
         AS moving_average
FROM stock_values;

{# 
To calculate the 3-month rolling average of total revenue from purchases
and output the results with the year-month (YYYY-MM) and the rolling average, you can use the following SQL query in Snowflake: #}


WITH Purchases AS (
    SELECT 
        TO_CHAR(DATE_TRUNC('month', date_purchased), 'YYYY-MM') AS year_month,
        purchase_amount
    FROM your_table_name
),
MonthlyRevenue AS (
    SELECT 
        year_month,
        SUM(purchase_amount) AS total_revenue
    FROM Purchases
    GROUP BY year_month
),
RollingAvg AS (
    SELECT
        year_month,
        total_revenue,
        AVG(total_revenue) OVER (
            ORDER BY year_month 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_revenue
    FROM MonthlyRevenue
)
SELECT 
    year_month,
    rolling_avg_revenue
FROM RollingAvg
ORDER BY year_month;