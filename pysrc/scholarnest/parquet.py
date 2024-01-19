from pyspark.sql import *
from lib import utils
import sys

if __name__ == "__main__":
    spark = SparkSession.builder.master("local[3]").appName("Spark-Parquet").enableHiveSupport().getOrCreate()
    flightTimeParquetDF = spark.read.format("parquet").load("data/flight-time.parquet")
    spark.sql("CREATE DATABASE IF NOT EXISTS AIRLINE_DB")
    spark.catalog.setCurrentDatabase("AIRLINE_DB")

    # flightTimeParquetDF.write.mode("overwrite"). \
    #     partitionBy("ORIGIN", "OP_CARRIER"). \
    #     saveAsTable("flight_data_tbl")
    flightTimeParquetDF.write. \
        format("csv"). \
        mode("overwrite"). \
        bucketBy(5, "OP_CARRIER", "ORIGIN"). \
        sortBy("OP_CARRIER", "ORIGIN"). \
        saveAsTable("flight_data_tbl")

    print(spark.catalog.listTables("AIRLINE_DB"))
    input("Press Enter")
    # conf_info = spark.sparkContext.getConf()
    # print("conf_info:", conf_info.toDebugString())
