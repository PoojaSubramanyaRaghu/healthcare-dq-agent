# 🏥 Healthcare Data Quality Agent

> LLM-powered data quality monitoring for Medicare claims pipelines

## Overview
An end-to-end data quality agent that monitors Medicare claims data pipelines, automatically detects failures, and uses GPT-4o to generate plain-English incident reports — eliminating manual triage. Built with real CMS Medicare 2024 data across 2,906 US hospitals.

## Architecture
```
CMS Medicare Data (145,879 records)
        ↓
AWS S3 (raw landing zone)
        ↓
Apache Airflow (orchestration)
        ↓
Snowflake RAW → dbt Staging → dbt Marts
        ↓
Custom MCP Server (5 tools)
        ↓
GPT-4o Agent (incident report generation)
        ↓
Streamlit Dashboard (monitoring + chat)
        ↓
Tableau (analytics layer)
```

## Tech Stack
- **Orchestration:** Apache Airflow
- **Transformation:** dbt (bronze / silver / gold)
- **Warehouse:** Snowflake (RAW / STAGING / MARTS)
- **Raw Storage:** AWS S3
- **LLM:** GPT-4o via custom MCP server
- **Monitoring:** Streamlit
- **Analytics:** Tableau Public
- **Language:** Python

## Key Metrics
- 145,879 CMS Medicare 2024 claims records monitored
- 2,906 unique hospitals aggregated
- 9/9 dbt data quality tests passing
- GPT-4o incident reports generated automatically on pipeline runs
- 5 custom MCP tools enabling live Snowflake investigation

## Data Quality Tests
| Test | Model | Status |
|---|---|---|
| not_null_provider_ccn | stg_cms_inpatient | ✅ PASS |
| not_null_hospital_name | stg_cms_inpatient | ✅ PASS |
| not_null_drg_code | stg_cms_inpatient | ✅ PASS |
| not_null_total_discharges | stg_cms_inpatient | ✅ PASS |
| not_null_avg_submitted_charge | stg_cms_inpatient | ✅ PASS |
| not_null_avg_total_payment | stg_cms_inpatient | ✅ PASS |
| not_null_avg_medicare_payment | stg_cms_inpatient | ✅ PASS |
| not_null_state | stg_cms_inpatient | ✅ PASS |
| accepted_values_state | stg_cms_inpatient | ✅ PASS |

## 📊 Tableau Dashboard
[View Live Dashboard →](https://public.tableau.com/app/profile/pooja.subramanya.raghu/viz/HealthcareDataQualityAgent-MedicareClaims2024/Story1)

## Project Structure
```
healthcare-dq-agent/
├── dags/                    # Airflow DAGs
├── dbt/healthcare_dq/       # dbt models + tests
├── include/                 # Data loading scripts
├── mcp_server/              # Custom MCP server
├── streamlit/               # Streamlit dashboard
├── reports/                 # GPT-4o incident reports
```

## Author
Pooja Subramanya Raghu | [LinkedIn](https://www.linkedin.com/in/poojasraghu/) | [Tableau Public](https://public.tableau.com/profile/pooja.subramanya.raghu)