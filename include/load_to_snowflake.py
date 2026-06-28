import snowflake.connector
import boto3
import os
import pandas as pd
from dotenv import load_dotenv
from io import StringIO

load_dotenv()

def load_to_snowflake():
    print("Connecting to Snowflake...")
    conn = snowflake.connector.connect(
        account=os.getenv('SNOWFLAKE_ACCOUNT'),
        user=os.getenv('SNOWFLAKE_USER'),
        password=os.getenv('SNOWFLAKE_PASSWORD'),
        warehouse=os.getenv('SNOWFLAKE_WAREHOUSE'),
        database=os.getenv('SNOWFLAKE_DATABASE'),
        schema=os.getenv('SNOWFLAKE_SCHEMA'),
        role=os.getenv('SNOWFLAKE_ROLE')
    )
    cursor = conn.cursor()
    print("Connected to Snowflake successfully!")

    print("Creating RAW table...")
    cursor.execute("""
        CREATE OR REPLACE TABLE HEALTHCARE_DQ.RAW.CMS_INPATIENT_RAW (
            RNDRNG_PRVDR_CCN        VARCHAR,
            RNDRNG_PRVDR_ORG_NAME   VARCHAR,
            RNDRNG_PRVDR_CITY       VARCHAR,
            RNDRNG_PRVDR_ST         VARCHAR,
            RNDRNG_PRVDR_STATE_FIPS VARCHAR,
            RNDRNG_PRVDR_ZIP5       VARCHAR,
            RNDRNG_PRVDR_STATE_ABRVTN VARCHAR,
            RNDRNG_PRVDR_RUCA       VARCHAR,
            RNDRNG_PRVDR_RUCA_DESC  VARCHAR,
            DRG_CD                  VARCHAR,
            DRG_DESC                VARCHAR,
            TOT_DSCHRGS             NUMBER,
            AVG_SUBMTD_CVRD_CHRG    FLOAT,
            AVG_TOT_PYMT_AMT        FLOAT,
            AVG_MDCR_PYMT_AMT       FLOAT,
            _LOADED_AT              TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
        )
    """)
    print("Table created!")

    print("Reading from S3...")
    s3 = boto3.client(
        's3',
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        region_name=os.getenv('AWS_REGION')
    )
    obj = s3.get_object(
        Bucket=os.getenv('S3_BUCKET_NAME'),
        Key='raw/cms_inpatient_2024.csv'
    )
    df = pd.read_csv(obj['Body'], dtype=str)
    print(f"Read {len(df)} records from S3")

    print("Loading into Snowflake RAW...")
    from snowflake.connector.pandas_tools import write_pandas
    df.columns = [c.upper() for c in df.columns]
    df['_LOADED_AT'] = pd.Timestamp.now()
    
    success, nchunks, nrows, _ = write_pandas(
        conn, df, 'CMS_INPATIENT_RAW',
        database='HEALTHCARE_DQ',
        schema='RAW'
    )
    print(f"Loaded {nrows} rows in {nchunks} chunks!")
    print("Done!")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    load_to_snowflake()
