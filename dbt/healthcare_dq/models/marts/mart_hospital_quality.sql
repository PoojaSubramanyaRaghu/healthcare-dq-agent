{{ config(materialized='table', schema='MARTS') }}

SELECT
    provider_ccn,
    hospital_name,
    city,
    state,
    zip_code,
    COUNT(DISTINCT drg_code)                        AS unique_drg_codes,
    SUM(total_discharges)                           AS total_discharges,
    ROUND(AVG(total_discharges), 2)                 AS avg_discharges_per_drg,
    ROUND(AVG(avg_submitted_charge), 2)             AS avg_submitted_charge,
    ROUND(AVG(avg_total_payment), 2)                AS avg_total_payment,
    ROUND(AVG(avg_medicare_payment), 2)             AS avg_medicare_payment,
    ROUND(AVG(medicare_coverage_pct), 2)            AS avg_medicare_coverage_pct,
    ROUND(AVG(avg_charge_payment_gap), 2)           AS avg_charge_payment_gap,
    SUM(CASE WHEN total_discharges <= 10 THEN 1 ELSE 0 END) AS low_discharge_count,
    SUM(CASE WHEN avg_submitted_charge < avg_total_payment THEN 1 ELSE 0 END) AS charge_less_than_payment_count,
    CURRENT_TIMESTAMP()                             AS _updated_at
FROM {{ ref('stg_cms_inpatient') }}
GROUP BY 1, 2, 3, 4, 5
