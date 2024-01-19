from datetime import date
from unittest import TestCase
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from lib.utils import *


# pytest row_test.py
class RowTestCase(TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.spark = SparkSession.builder. \
            master("local[3]"). \
            appName("RowTest").getOrCreate()

        cls.schema = StructType([
            StructField("ID", StringType()),
            StructField("EventDate", StringType())])
        table_rows = [Row("123", "04/05/2020"),
                      Row("124", "4/5/2020"),
                      Row("125", "04/5/2020"),
                      Row("126", "4/05/2020")]
        row_rdd = cls.spark.sparkContext.parallelize(table_rows, 2)
        cls.data_frame = cls.spark.createDataFrame(row_rdd, cls.schema)

    def test_data_type(self):
        rows = to_date_df(self.data_frame, "M/d/y", "EventDate").collect()
        for row in rows:
            self.assertIsInstance(row['EventDate'], date)

    def test_date_value(self):
        rows = to_date_df(self.data_frame, "M/d/y", "EventDate").collect()
        for row in rows:
            self.assertEqual(row['EventDate'], date(2020, 4, 5))
