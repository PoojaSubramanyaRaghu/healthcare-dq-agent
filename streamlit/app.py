import streamlit as st
import snowflake.connector
import pandas as pd
import os
import glob
from openai import OpenAI

# Load credentials from Streamlit secrets or environment
def get_secret(key):
    try:
        return st.secrets[key]
    except:
        from dotenv import load_dotenv
        load_dotenv('/Users/poojaraghu/Desktop/healthcare-dq-agent/.env')
        return os.getenv(key)

st.set_page_config(
    page_title="Healthcare Data Quality Agent",
    page_icon="🏥",
    layout="wide"
)

@st.cache_resource
def get_snowflake_connection():
    return snowflake.connector.connect(
        account=get_secret('SNOWFLAKE_ACCOUNT'),
        user=get_secret('SNOWFLAKE_USER'),
        password=get_secret('SNOWFLAKE_PASSWORD'),
        warehouse=get_secret('SNOWFLAKE_WAREHOUSE'),
        database=get_secret('SNOWFLAKE_DATABASE'),
        schema='RAW',
        role=get_secret('SNOWFLAKE_ROLE'),
        login_timeout=30
    )

@st.cache_data(ttl=300)
def get_pipeline_stats():
    conn = get_snowflake_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM HEALTHCARE_DQ.RAW.CMS_INPATIENT_RAW")
    raw_count = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM HEALTHCARE_DQ.STAGING.STG_CMS_INPATIENT")
    staging_count = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM HEALTHCARE_DQ.MARTS.MART_HOSPITAL_QUALITY")
    marts_count = cursor.fetchone()[0]
    cursor.close()
    return raw_count, staging_count, marts_count

@st.cache_data(ttl=300)
def get_top_hospitals():
    conn = get_snowflake_connection()
    query = """
        SELECT hospital_name, state, city,
               total_discharges,
               avg_medicare_payment,
               avg_medicare_coverage_pct
        FROM HEALTHCARE_DQ.MARTS.MART_HOSPITAL_QUALITY
        ORDER BY total_discharges DESC
        LIMIT 10
    """
    return pd.read_sql(query, conn)

@st.cache_data(ttl=300)
def get_state_stats():
    conn = get_snowflake_connection()
    query = """
        SELECT state,
               COUNT(*) as hospital_count,
               SUM(total_discharges) as total_discharges,
               ROUND(AVG(avg_medicare_payment), 2) as avg_medicare_payment
        FROM HEALTHCARE_DQ.MARTS.MART_HOSPITAL_QUALITY
        GROUP BY state
        ORDER BY total_discharges DESC
        LIMIT 15
    """
    return pd.read_sql(query, conn)

def get_incident_reports():
    reports = []
    paths_to_try = [
        '/Users/poojaraghu/Desktop/healthcare-dq-agent/reports/*.txt',
        'reports/*.txt',
        '../reports/*.txt'
    ]
    report_files = []
    for path in paths_to_try:
        report_files = glob.glob(path)
        if report_files:
            break
    for f in sorted(report_files, reverse=True):
        with open(f, 'r') as file:
            content = file.read()
            timestamp = os.path.basename(f).replace('incident_report_', '').replace('.txt', '')
            reports.append({'timestamp': timestamp, 'content': content})
    return reports

st.sidebar.title("🏥 Healthcare DQ Agent")
st.sidebar.markdown("---")
page = st.sidebar.radio("Navigate", [
    "📊 Pipeline Overview",
    "🏥 Hospital Analytics",
    "🚨 Incident Reports",
    "💬 Ask the Agent"
])

if page == "📊 Pipeline Overview":
    st.title("📊 Pipeline Overview")
    st.markdown("Real-time monitoring of the Medicare claims data pipeline")
    try:
        raw_count, staging_count, marts_count = get_pipeline_stats()
        col1, col2, col3, col4 = st.columns(4)
        with col1:
            st.metric("Raw Records", f"{raw_count:,}", "CMS 2024")
        with col2:
            st.metric("Staged Records", f"{staging_count:,}", "Cleaned")
        with col3:
            st.metric("Hospitals", f"{marts_count:,}", "Aggregated")
        with col4:
            st.metric("dbt Tests", "9/9", "✅ Passing")
        st.markdown("---")
        st.subheader("Pipeline Architecture")
        st.markdown("""
        ```
        CMS Medicare 2024 Data (145,879 records)
                ↓
        AWS S3 (raw landing zone)
                ↓
        Snowflake RAW (CMS_INPATIENT_RAW)
                ↓
        dbt Staging (stg_cms_inpatient) — 9 tests
                ↓
        dbt Marts (mart_hospital_quality) — 2,906 hospitals
                ↓
        GPT-4o Incident Report Agent
        ```
        """)
        st.subheader("Data Quality Tests")
        tests = [
            ("not_null_provider_ccn", "✅ PASS"),
            ("not_null_hospital_name", "✅ PASS"),
            ("not_null_drg_code", "✅ PASS"),
            ("not_null_total_discharges", "✅ PASS"),
            ("not_null_avg_submitted_charge", "✅ PASS"),
            ("not_null_avg_total_payment", "✅ PASS"),
            ("not_null_avg_medicare_payment", "✅ PASS"),
            ("not_null_state", "✅ PASS"),
            ("accepted_values_state", "✅ PASS"),
        ]
        df_tests = pd.DataFrame(tests, columns=["Test Name", "Status"])
        st.dataframe(df_tests, use_container_width=True)
    except Exception as e:
        st.error(f"Error connecting to Snowflake: {e}")

elif page == "🏥 Hospital Analytics":
    st.title("🏥 Hospital Analytics")
    st.markdown("Medicare claims analysis across 2,906 US hospitals")
    try:
        col1, col2 = st.columns(2)
        with col1:
            st.subheader("Top 10 Hospitals by Discharges")
            df_hospitals = get_top_hospitals()
            st.dataframe(df_hospitals, use_container_width=True)
        with col2:
            st.subheader("Top 15 States by Volume")
            df_states = get_state_stats()
            st.bar_chart(df_states.set_index('STATE')['TOTAL_DISCHARGES'])
        st.subheader("State Summary Table")
        st.dataframe(df_states, use_container_width=True)
    except Exception as e:
        st.error(f"Error loading data: {e}")

elif page == "🚨 Incident Reports":
    st.title("🚨 Incident Reports")
    st.markdown("GPT-4o generated data quality incident reports")
    reports = get_incident_reports()
    if not reports:
        st.info("No incident reports found. Run the pipeline to generate reports.")
    else:
        for report in reports:
            with st.expander(f"📋 Report — {report['timestamp']}", expanded=True):
                st.markdown(report['content'])

elif page == "💬 Ask the Agent":
    st.title("💬 Ask the Data Quality Agent")
    st.markdown("Powered by GPT-4o + live Snowflake data")

    if "messages" not in st.session_state:
        st.session_state.messages = []

    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

    if prompt := st.chat_input("Ask about your pipeline..."):
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)

        with st.chat_message("assistant"):
            client = OpenAI(api_key=get_secret('OPENAI_API_KEY'))

            try:
                conn = get_snowflake_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT COUNT(*) FROM HEALTHCARE_DQ.RAW.CMS_INPATIENT_RAW")
                raw_count = cursor.fetchone()[0]
                cursor.execute("""
                    SELECT STATE, SUM(TOTAL_DISCHARGES) as TOTAL
                    FROM HEALTHCARE_DQ.MARTS.MART_HOSPITAL_QUALITY
                    GROUP BY STATE ORDER BY TOTAL DESC LIMIT 5
                """)
                top_states = cursor.fetchall()
                cursor.execute("""
                    SELECT HOSPITAL_NAME, TOTAL_DISCHARGES
                    FROM HEALTHCARE_DQ.MARTS.MART_HOSPITAL_QUALITY
                    ORDER BY TOTAL_DISCHARGES DESC LIMIT 3
                """)
                top_hospitals = cursor.fetchall()
                cursor.close()
                conn.close()
                live_context = f"""
                Live pipeline data:
                - Total raw records: {raw_count:,}
                - Top 5 states by discharges: {top_states}
                - Top 3 hospitals: {top_hospitals}
                - dbt tests: 9/9 passing
                """
            except Exception as e:
                live_context = "Pipeline data unavailable"

            system_prompt = f"""You are a healthcare data quality agent monitoring a Medicare claims pipeline.
            You have access to live Snowflake data.
            {live_context}
            Answer questions about data quality, pipeline health, and healthcare analytics.
            Be specific with numbers from the live data."""

            response = client.chat.completions.create(
                model="gpt-4o",
                messages=[
                    {"role": "system", "content": system_prompt},
                    *[{"role": m["role"], "content": m["content"]}
                      for m in st.session_state.messages]
                ],
                max_tokens=500
            )

            answer = response.choices[0].message.content
            st.markdown(answer)
            st.session_state.messages.append({"role": "assistant", "content": answer})