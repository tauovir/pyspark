import configparser
from pyspark import SparkConf
from pyspark.sql.functions import *

def get_spark_app_config():
    spark_conf = SparkConf()
    config = configparser.ConfigParser()
    config.read("spark.conf")
    for key, val in config.items("SPARK_APP_CONFIGS"):
        spark_conf.set(key, val)
    return spark_conf


def load_survey_df(spark, data_file):
    return spark.read. \
        option("header", "true"). \
        option("inferSchema", "true") \
        .csv(data_file)


def count_by_country(survey_df):
    return survey_df.where("Age < 40"). \
        select("Age", "Gender", "Country", "State"). \
        groupBy("Country").count()


def to_date_df(data_frame, format, field):
    return data_frame.withColumn(field, to_date(field, format))
