-- Given a table VPROPLE with columns id, FLAG, and log_date (in 'dd-mm-yyyy' format),
-- identify consecutive periods (groups) for each id where FLAG is not 'N',
-- such that each group contains more than one record.
-- For each group, return the id, the group's start and end dates.

CREATE OR REPLACE TABLE VPROPLE (
	id integer,
	log_date VARCHAR,
	flag VARCHAR
    );

    INSERT INTO VPROPLE(id,log_date,flag)
    VALUES (101,'02-01-2024','N'),
(101,'03-01-2024','Y'),
(101,'04-01-2024','N'),
(101,'07-01-2024','Y'),
(102,'01-01-2024','N'),
(102,'02-01-2024','Y'),
(102,'03-01-2024','Y'),
(102,'04-01-2024','N'),
(102,'05-01-2024','Y'),
(102,'06-01-2024','Y'),
(102,'07-01-2024','Y'),
(103,'01-01-2024','N'),
(103,'04-01-2024','N'),
(103,'05-01-2024','Y'),
(103,'06-01-2024','Y'),
(103,'07-01-2024','N');

WITH PRE_DATA AS
(
SELECT id,FLAG, TO_DATE(log_date,'dd-mm-yyyy') AS LOG_DATE,
ROW_NUMBER() OVER (PARTITION BY id ORDER BY LOG_DATE ) AS RN
FROM  VPROPLE WHERE FLAG <> 'N'
),
FILTER_DATA AS (
select id,FLAG, LOG_DATE,RN,DAY(LOG_DATE) AS _DAY,
(DAY(LOG_DATE) - RN) AS GRP
from PRE_DATA
),
RES AS (
SELECT ID,GRP,MIN(LOG_DATE) AS START_DATE,MAX(LOG_DATE) AS END_DATE FROM FILTER_DATA 
GROUP BY ID,GRP HAVING COUNT(*) > 1
)
SELECT * FROM RES ORDER BY id;











