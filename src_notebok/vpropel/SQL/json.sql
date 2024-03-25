
CREATE OR REPLACE TABLE JSON_DATA(ID INT autoincrement start 1 increment 1,
DATA VARIANT);
INSERT INTO  JSON_DATA(DATA) 
select parse_json($$
[{
  "first_name": "Taukir",
  "last_name": "Khna",
  "color": ["red","green"],
  "address": 
  [{
    "country": "INDIA",
    "city": "meerut"
  },{
    "country": "CANADA",
    "city": "vancouver"
  }]
  
},
{
  "first_name": "John",
  "last_name": "Corner",
 "color": ["black","green"],
  "address": 
  [{
    "country": "US",
    "city": "Florida"
  },{
    "country": "CANADA",
    "city": "Toronto"
  }]
}
]
$$)
union 
select parse_json($$
[{
  "first_name": "Zeenat",
  "last_name": "Khan",
  "color": ["red","green"],
  "address": 
  [{
    "country": "INDIA",
    "city": "kanpur"
  }]
}
]$$)

select * from JSON_DATA

CREATE OR REPLACE TABLE JSON_DATA_PARSE (ID INT,DATA VARIANT);

INSERT INTO JSON_DATA_PARSE(ID,DATA)
SELECT ID as "ID",
   f.value AS "DATA",
 FROM JSON_DATA p,
   lateral flatten(input => p.DATA) f;

SELECT * FROM JSON_DATA_PARSE;
SELECT ID, 
DATA:first_name::string as first_name,
DATA:color  as color,
DATA:address as address,
DATA:address[0].country as COUNTRY
FROM JSON_DATA_PARSE;