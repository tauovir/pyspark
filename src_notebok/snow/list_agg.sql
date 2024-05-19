create table emp_lang(emp_id string, full_name string, lang string);
insert into emp_lang(emp_id,full_name,lang)
select '101','virat Kohli','English'
union
select '101','virat Kohli','Hindi'
union
select '101','virat Kohli','Marathi'
union
select '102','Mahesh Babu','English'
union
select '102','Mahesh Babu','Telgu'
union
select '102','Mahesh Babu','Tamil'
union
select '102','Mahesh Babu','Hindi'
union
select '103','Janardhan','Telgu'
union
select '103','Janardhan','English'


select * from emp_lang

-- select emp_id,full_name, listagg(Distinct lang,',')
-- from emp_lang group by emp_id,full_name
