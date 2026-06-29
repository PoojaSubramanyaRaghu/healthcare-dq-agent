from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import subprocess
import sys

default_args = {
    'owner': 'pooja',
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

def upload_to_s3():
    exec(open('/Users/poojaraghu/Desktop/healthcare-dq-agent/include/upload_to_s3.py').read())

def load_to_snowflake():
    exec(open('/Users/poojaraghu/Desktop/healthcare-dq-agent/include/load_to_snowflake.py').read())

def run_dbt():
    result = subprocess.run(
        ['/opt/anaconda3/bin/dbt', 'run', '--project-dir', 
         '/Users/poojaraghu/Desktop/healthcare-dq-agent/dbt/healthcare_dq',
         '--profiles-dir', '/Users/poojaraghu/.dbt'],
        capture_output=True, text=True
    )
    print(result.stdout)
    if result.returncode != 0:
        raise Exception(f"dbt run failed: {result.stderr}")

def run_dbt_tests():
    result = subprocess.run(
        ['/opt/anaconda3/bin/dbt', 'test', '--project-dir',
         '/Users/poojaraghu/Desktop/healthcare-dq-agent/dbt/healthcare_dq',
         '--profiles-dir', '/Users/poojaraghu/.dbt'],
        capture_output=True, text=True
    )
    print(result.stdout)
    if result.returncode != 0:
        raise Exception(f"dbt tests failed: {result.stderr}")

def generate_incident_report(**context):
    import json
    import os
    from openai import OpenAI
    from dotenv import load_dotenv
    from datetime import datetime
    
    load_dotenv('/Users/poojaraghu/Desktop/healthcare-dq-agent/.env')
    
    client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))
    
    # Simulate test results for now
    test_summary = {
        "run_date": datetime.now().isoformat(),
        "total_tests": 9,
        "passed": 9,
        "failed": 0,
        "models_tested": ["stg_cms_inpatient"],
        "status": "ALL PASSED"
    }
    
    prompt = f"""You are a healthcare data quality analyst. 
    Generate a concise incident report based on these dbt test results:
    
    {json.dumps(test_summary, indent=2)}
    
    Format the report with:
    - SEVERITY (Low/Medium/High/Critical)
    - SUMMARY
    - MODELS AFFECTED
    - TEST RESULTS
    - RECOMMENDED ACTION
    - IMPACT ON ANALYTICS
    
    Keep it professional and actionable."""
    
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}],
        max_tokens=500
    )
    
    report = response.choices[0].message.content
    
    # Save report
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    report_path = f'/Users/poojaraghu/Desktop/healthcare-dq-agent/reports/incident_report_{timestamp}.txt'
    
    with open(report_path, 'w') as f:
        f.write(report)
    
    print(f"Incident report saved to {report_path}")
    print(report)

with DAG(
    'healthcare_dq_pipeline',
    default_args=default_args,
    description='Healthcare Data Quality Pipeline',
    schedule='@daily',
    start_date=datetime(2024, 1, 1),
    catchup=False,
    tags=['healthcare', 'dq', 'cms'],
) as dag:

    t1 = PythonOperator(
        task_id='upload_to_s3',
        python_callable=upload_to_s3,
    )

    t2 = PythonOperator(
        task_id='load_to_snowflake',
        python_callable=load_to_snowflake,
    )

    t3 = PythonOperator(
        task_id='run_dbt_models',
        python_callable=run_dbt,
    )

    t4 = PythonOperator(
        task_id='run_dbt_tests',
        python_callable=run_dbt_tests,
    )

    t5 = PythonOperator(
        task_id='generate_incident_report',
        python_callable=generate_incident_report,
        provide_context=True,
    )

    t1 >> t2 >> t3 >> t4 >> t5
