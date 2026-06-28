import boto3
import os
from dotenv import load_dotenv

load_dotenv()

def upload_to_s3():
    s3 = boto3.client(
        's3',
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        region_name=os.getenv('AWS_REGION')
    )
    
    bucket = os.getenv('S3_BUCKET_NAME')
    local_file = '/Users/poojaraghu/Desktop/healthcare-dq-agent/include/data/cms_inpatient_2024.csv'
    s3_key = 'raw/cms_inpatient_2024.csv'
    
    print(f"Uploading to s3://{bucket}/{s3_key}...")
    s3.upload_file(local_file, bucket, s3_key)
    print(f"Successfully uploaded {local_file} to s3://{bucket}/{s3_key}")
    print(f"Records: 145,879 | Size: ~38MB")

if __name__ == "__main__":
    upload_to_s3()
