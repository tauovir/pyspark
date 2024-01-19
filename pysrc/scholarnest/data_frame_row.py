from pyspark.sql import *
from pyspark.sql.types import *
from lib.utils import *

import sys


def to_date_df(data_frame, format, field):
    return data_frame.withColumn(field, to_date(field, format))


if __name__ == "__main__":
    spark = SparkSession.builder.master("local[3]").appName("RowDemo").getOrCreate()

    schema = StructType([
        StructField("ID", StringType()),
        StructField("EventDate", StringType())])
    table_rows = [Row("123", "04/05/2020"),
                  Row("124", "4/5/2020"),
                  Row("125", "04/5/2020"),
                  Row("126", "4/05/2020")]
    row_rdd = spark.sparkContext.parallelize(table_rows, 2)
    data_frame = spark.createDataFrame(row_rdd, schema)
    print("=========Data Frame Schema==========")
    print(data_frame.printSchema())
    print("=========Data Frame==========")
    print(data_frame.show())
    new_df = to_date_df(data_frame, "M/d/y", "EventDate")
    print("============New DataFrame==========")
    print(new_df.printSchema())
    print(new_df.show())
