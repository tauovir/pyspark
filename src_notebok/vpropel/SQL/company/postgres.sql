/*
dates : 2020-01-10
*/

select dates, date_part('day',dates::date) as day1,
CAST(dates AS DATE),
extract(month from dates::date)
from COVID_REPORT
