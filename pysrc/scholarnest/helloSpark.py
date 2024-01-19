from pyspark.sql import *
from lib import utils
import sys

#python .\helloSpark.py .\data\sample.csv
if __name__ == "__main__":
    conf = utils.get_spark_app_config()
    spark = SparkSession.builder.config(conf=conf).getOrCreate()
    if len(sys.argv) != 2:
        print("Error Occure")
        sys.exit(-1)

    survey_df = utils.load_survey_df(spark, sys.argv[1])
    partitioned_survey_df = survey_df.repartition(2)
    count_df = utils.count_by_country(partitioned_survey_df)
    print(count_df.collect())
    input("Press Enter")
    # conf_info = spark.sparkContext.getConf()
    # print("conf_info:", conf_info.toDebugString())
