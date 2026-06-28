{{ config(materialized='view', schema='STAGING') }}

SELECT
    LPAD(RNDRNG_PRVDR_CCN::VARCHAR, 6, '0')        AS provider_ccn,
    RNDRNG_PRVDR_ORG_NAME                           AS hospital_name,
    RNDRNG_PRVDR_CITY                               AS city,
    RNDRNG_PRVDR_STATE_ABRVTN                       AS state,
    LPAD(RNDRNG_PRVDR_ZIP5::VARCHAR, 5, '0')        AS zip_code,
    RNDRNG_PRVDR_STATE_FIPS::VARCHAR                AS state_fips,
    RNDRNG_PRVDR_RUCA::FLOAT                        AS ruca_code,
    RNDRNG_PRVDR_RUCA_DESC                          AS ruca_description,
    LPAD(DRG_CD::VARCHAR, 3, '0')                   AS drg_code,
    DRG_DESC                                        AS drg_description,
    TOT_DSCHRGS::INTEGER                            AS total_discharges,
    AVG_SUBMTD_CVRD_CHRG::FLOAT                     AS avg_submitted_charge,
    AVG_TOT_PYMT_AMT::FLOAT                         AS avg_total_payment,
    AVG_MDCR_PYMT_AMT::FLOAT                        AS avg_medicare_payment,
    ROUND(AVG_MDCR_PYMT_AMT / NULLIF(AVG_TOT_PYMT_AMT, 0) * 100, 2) AS medicare_coverage_pct,
    ROUND(AVG_SUBMTD_CVRD_CHRG - AVG_TOT_PYMT_AMT, 2) AS avg_charge_payment_gap,
    CURRENT_TIMESTAMP()                             AS _loaded_at,
    '2024'                                          AS data_year
FROM {{ source('raw', 'CMS_INPATIENT_RAW') }}
