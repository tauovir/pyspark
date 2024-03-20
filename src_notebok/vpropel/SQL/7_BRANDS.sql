
CREATE OR REPLACE TABLE BRANDS(
BRAND1 STRING,BRAND2 STRING,
YEARS INT,
CUSTOM1 INT,CUSTOM2 INT,CUSTOM3 INT,CUSTOM4 INT
)

INSERT INTO BRANDS(BRAND1,BRAND2,YEARS,CUSTOM1,CUSTOM2,CUSTOM3,CUSTOM4)
VALUES('apple', 'samsung', 2020, 1, 2, 1, 2),
    ('samsung', 'apple', 2020, 1, 2, 1, 2),
    ('apple', 'samsung', 2021, 1, 2, 5, 3),
    ('samsung', 'apple', 2021, 5, 3, 1, 2),
    ('google', NULL, 2020, 5, 9, NULL, NULL),
    ('oneplus', 'nothing', 2020, 5, 9, 6, 3);

SELECT * FROM BRANDS;

{# For pairs of brands in the same year<br>
(e.g. apple/samsung/2020 and sample/apple/2020)<br>
IF custom1=custom3 and custom2 = custom4
then keep only one pair.<br>
For pairs of brands in the same year<br>
IF custom1 !=custom3 OR custom2 != custom4 then keep both<br>
For pairs of brands that do not have pairs in the same year<br>
Keep those rows as well #}
+-------+-------+----+-------+-------+-------+-------+
| brand1| brand2|year|custom1|custom2|custom3|custom4|
+-------+-------+----+-------+-------+-------+-------+
|  apple|samsung|2020|      1|      2|      1|      2|
|samsung|  apple|2020|      1|      2|      1|      2|
|  apple|samsung|2021|      1|      2|      5|      3|
|samsung|  apple|2021|      5|      3|      1|      2|
| google|   NULL|2020|      5|      9|   NULL|   NULL|
|oneplus|nothing|2020|      5|      9|      6|      3|
+-------+-------+----+-------+-------+-------+-------+

-- Output:

+-------+-------+----+-------+-------+-------+-------+
| brand1| brand2|year|custom1|custom2|custom3|custom4|
+-------+-------+----+-------+-------+-------+-------+
| google|   NULL|2020|      5|      9|   NULL|   NULL|
|oneplus|nothing|2020|      5|      9|      6|      3|
|  apple|samsung|2020|      1|      2|      1|      2|
|  apple|samsung|2021|      1|      2|      5|      3|
|samsung|  apple|2021|      5|      3|      1|      2|
+-------+-------+----+-------+-------+-------+-------+


WITH DATA AS
(
SELECT BRAND1,BRAND2,YEARS,CUSTOM1,CUSTOM2,CUSTOM3,CUSTOM4,
CASE
WHEN LEN(BRAND1) > LEN(BRAND2) THEN CONCAT(BRAND1,BRAND2,YEARS)
ELSE
CONCAT(BRAND2,BRAND1,YEARS)
END AS PAIRS
FROM BRANDS
)
SELECT BRAND1,BRAND2,YEARS,CUSTOM1,CUSTOM2,CUSTOM3,CUSTOM4,
ROW_NUMBER() OVER(PARTITION BY PAIRS ORDER BY  YEARS) as RW1
FROM DATA
qualify RW1 =1 OR (CUSTOM1 != CUSTOM3 AND CUSTOM2 !=CUSTOM4)