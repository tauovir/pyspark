
CREATE OR REPLACE TABLE EMP_MANAGER (title VARCHAR, employee_ID INTEGER, manager_ID INTEGER);

INSERT INTO EMP_MANAGER (title, employee_ID, manager_ID) VALUES
    ('President', 1, NULL),  -- The President has no manager.
        ('Vice President Engineering', 10, 1),
            ('Programmer', 100, 10),
            ('QA Engineer', 101, 10),
        ('Vice President HR', 20, 1),
            ('Health Insurance Analyst', 200, 20);


SELECT * FROM EMP_MANAGER
SELECT SYS_CONNECT_BY_PATH(title, ' -> '),EMPLOYEE_ID,MANAGER_ID,TITLE FROM EMP_MANAGER
START WITH TITLE = 'President'
 CONNECT BY
 MANAGER_ID = PRIOR EMPLOYEE_ID
ORDER BY employee_ID;