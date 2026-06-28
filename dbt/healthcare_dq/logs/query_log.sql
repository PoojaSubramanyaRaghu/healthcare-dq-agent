-- created_at: 2026-06-28T18:18:31.270421+00:00
-- finished_at: 2026-06-28T18:18:31.463507+00:00
-- elapsed: 193ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_provider_ccn.9b10c7ad4f
-- query_id: 01c55b4a-3204-2b4c-0008-056a0007708e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select provider_ccn
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where provider_ccn is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_provider_ccn.9b10c7ad4f", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.270421+00:00
-- finished_at: 2026-06-28T18:18:31.463505+00:00
-- elapsed: 193ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_drg_code.aed91c6d3f
-- query_id: 01c55b4a-3204-2b4c-0008-056a00077092
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select drg_code
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where drg_code is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_drg_code.aed91c6d3f", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.368955+00:00
-- finished_at: 2026-06-28T18:18:31.592534+00:00
-- elapsed: 223ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_submitted_charge.d72af28b0f
-- query_id: 01c55b4a-3204-2a69-0008-056a0007411e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_submitted_charge
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where avg_submitted_charge is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_avg_submitted_charge.d72af28b0f", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.682592+00:00
-- finished_at: 2026-06-28T18:18:31.901679+00:00
-- elapsed: 219ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_hospital_name.7c7cc7efda
-- query_id: 01c55b4a-3204-2b4c-0008-056a00077096
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select hospital_name
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where hospital_name is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_hospital_name.7c7cc7efda", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.699439+00:00
-- finished_at: 2026-06-28T18:18:31.901833+00:00
-- elapsed: 202ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_medicare_payment.6adf292b65
-- query_id: 01c55b4a-3204-2a69-0008-056a00074122
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_medicare_payment
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where avg_medicare_payment is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_avg_medicare_payment.6adf292b65", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.711484+00:00
-- finished_at: 2026-06-28T18:18:31.903664+00:00
-- elapsed: 192ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_state.65388403cb
-- query_id: 01c55b4a-3204-2b4c-0008-056a0007709e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select state
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where state is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_state.65388403cb", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.715102+00:00
-- finished_at: 2026-06-28T18:18:31.904933+00:00
-- elapsed: 189ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_total_payment.52c5fdde42
-- query_id: 01c55b4a-3204-2b4c-0008-056a000770a2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_total_payment
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where avg_total_payment is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_avg_total_payment.52c5fdde42", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.715304+00:00
-- finished_at: 2026-06-28T18:18:31.904954+00:00
-- elapsed: 189ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.accepted_values_stg_cms_inpatient_state__AL__AK__AZ__AR__CA__CO__CT__DE__FL__GA__HI__ID__IL__IN__IA__KS__KY__LA__ME__MD__MA__MI__MN__MS__MO__MT__NE__NV__NH__NJ__NM__NY__NC__ND__OH__OK__OR__PA__RI__SC__SD__TN__TX__UT__VT__VA__WA__WV__WI__WY__DC__PR__VI__GU__MP__AS.a270fd732c
-- query_id: 01c55b4a-3204-2b4c-0008-056a0007709a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        state as value_field,
        count(*) as n_records

    from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
    group by state

)

select *
from all_values
where value_field not in (
    'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY','DC','PR','VI','GU','MP','AS'
)



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.accepted_values_stg_cms_inpatient_state__AL__AK__AZ__AR__CA__CO__CT__DE__FL__GA__HI__ID__IL__IN__IA__KS__KY__LA__ME__MD__MA__MI__MN__MS__MO__MT__NE__NV__NH__NJ__NM__NY__NC__ND__OH__OK__OR__PA__RI__SC__SD__TN__TX__UT__VT__VA__WA__WV__WI__WY__DC__PR__VI__GU__MP__AS.a270fd732c", "profile_name": "healthcare_dq", "target_name": "dev"} */;
-- created_at: 2026-06-28T18:18:31.700718+00:00
-- finished_at: 2026-06-28T18:18:31.904933+00:00
-- elapsed: 204ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_total_discharges.d68455db71
-- query_id: 01c55b4a-3204-2b43-0008-056a00078072
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_discharges
from HEALTHCARE_DQ.STAGING.stg_cms_inpatient
where total_discharges is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.healthcare_dq.not_null_stg_cms_inpatient_total_discharges.d68455db71", "profile_name": "healthcare_dq", "target_name": "dev"} */;
