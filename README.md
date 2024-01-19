## Spark:

Apache Spark is an open source analytics engine used for big data workloads. It can handle both batches as well as real-time analytics and data processing workloads.
Spark provides native bindings for the Java, Scala, Python, and R programming languages. In addition, it includes several libraries to support build applications for machine learning [MLlib], stream processing [Spark Streaming], and graph processing [GraphX]

![alt text](https://github.com/tauovir/pyspark/blob/master/base-image.jpg)

### Apache Spark:
* Performance 10 to 100 times faster than Hadoop M/R.
* Ease of development Spark SQL, High-performance SQL engine, API.
* Language Support, Java, Scala, Python, R.
* Storage: HDFS, Cloud Storage
* Resource Management: YARN, Mesos, Kubernetes.
### Run in Two Setup
** With Hadoop (Data lake)
** Without Hadoop (Lakehouse: cloud)

### Working with Spark
* Spark DataFrame and API
* Spark Database and SQL

```
>> show dbs
```


* Create python3.9 virtual environment and activate it
 ```
virtualenv -p C:\Users\<path_to_python39>\Python39\python.exe venv
OR
python -m venv venv
OR
C:\Users<path>\Python39\python -m venv venv
 venv\Script\activate
  ```
* Install requirement.txt
 ```
pip install -r requirement.txt
 ```
* Run Setup.py
 ```
python setup.py develop
```
