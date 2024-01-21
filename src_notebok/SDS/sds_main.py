from lib import utils
import sys
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Argument {local,qa,prod},{load_date} are missing")
        sys.exit(-1)
    job_run_env = sys.argv[1].upper()
    load_date = sys.argv[2]
    spark = utils.get_spark_session(job_run_env)
    print("finished creating spark session")

