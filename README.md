# Healthcare Data Quality Agent

LLM-powered data quality monitoring for Medicare claims pipelines

## Overview
An end-to-end data quality agent that monitors Medicare claims data pipelines, automatically detects failures, and uses GPT-4o to generate plain-English incident reports — eliminating manual triage.

## Architecture

## Tech Stack
- **Orchestration:** Apache Airflow (Astro CLI)
- **Transformation:** dbt (Snowflake)
- **Warehouse:** Snowflake (bronze / silver / gold)
- **Raw Storage:** AWS S3
- **LLM:** GPT-4o via MCP server
- **Dashboard:** Streamlit + Tableau
- **Language:** Python

## Status
Under active development

## Author
Pooja Subramanya Raghu | [LinkedIn](https://www.linkedin.com/in/poojasraghu/)