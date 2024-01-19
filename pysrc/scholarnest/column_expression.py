from pyspark.sql import *
from pyspark.sql.functions import *

"""
Select Column:
Column String
Column object
Column Expression:
String expression or SQL expression
Column object Expression
"""
if __name__ == "__main__":
    spark = SparkSession.builder.master("local[3]").appName("RowDemo").getOrCreate()
    data_frame = spark.read. \
        option("header", "true"). \
        option("inferSchema", "true") .csv("data/sample.csv")
    print(data_frame.select("Age",column("Gender"),col("Country"),data_frame.state).limit(2).show())

