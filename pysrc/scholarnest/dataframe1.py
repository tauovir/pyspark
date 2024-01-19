from pyspark.sql import SparkSession
from pyspark.sql.functions import broadcast


spark = SparkSession.builder.master("local[3]").appName("DataFrame").getOrCreate()
from pyspark.sql.types import StructType, StructField, StringType, IntegerType,ArrayType

data = [
    {"fname": "Rahul", "lname": "Kumar", "gender": "M", "salary": 10000, "bonus": 1000, "deduction": 500,
     "country": "INDIA","lang":["Python","SQL"]},
    {"fname": "Taukir", "lname": "Khan", "gender": "M", "salary": 12000, "bonus": 2000,
     "country": "INDIA","lang":["Java","SQL"]},
    {"fname": "Pooja", "lname": "Sharma", "gender": "F", "salary": 15000, "bonus": 3000, "deduction": 2000,
     "country": "US","lang":["Go","Pyspark"]},
    {"fname": "Sab", "lname": "nam", "gender": "F", "salary": 14000, "bonus": 3000, "deduction": 2000,
     "country": "INDIA","lang":["PHP","Javascript"]},
    {"fname": "TAnbir", "lname": "Khan", "gender": "F", "salary": 23000, "bonus": 7000, "deduction": 2000,
     "country": "US","lang":["Node","Pgadmin"]}
]
schema = StructType([ \
    StructField("fname", StringType(), True),
    StructField("lname", StringType(), True),
    StructField("gender", StringType(), True),
    StructField("salary", IntegerType(), True),
    StructField("bonus", IntegerType(), True),
    StructField("deduction", IntegerType(), True),
    StructField("country", StringType(), True),
    StructField("lang", ArrayType(), True)
])

dataframe = spark.createDataFrame(data=data, schema=schema)

print(dataframe.show())
print("============")
print(dataframe.rdd.getNumPartitions())
# print("Repartition")
# re_dataframe = dataframe.repartition(4)
# print(re_dataframe.rdd.getNumPartitions())
#
# # DataFrame coalesce
# print("=======coalesce===")
# col_dataframe = dataframe.coalesce(2)
# print(col_dataframe.rdd.getNumPartitions())


print("=======GroupBy===")
grp_dataframe = dataframe.groupBy("country").count()
print(grp_dataframe.show())
# print(grp_dataframe.rdd.getNumPartitions())

# BroadCast Variable
print("Broadcast variable")
brd_df = broadcast(dataframe)
# print(brd_df)
rdd = dataframe.rdd.collect()
print("RDDD")
print(rdd)