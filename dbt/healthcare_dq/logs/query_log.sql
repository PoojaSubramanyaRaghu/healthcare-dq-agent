-- created_at: 2026-06-29T03:17:23.883037+00:00
-- finished_at: 2026-06-29T03:17:24.252916+00:00
-- elapsed: 369ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_drg_code.aed91c6d3f
-- query_id: 01c55d65-3204-2a5d-0008-056a0007b00e
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
-- created_at: 2026-06-29T03:17:23.971367+00:00
-- finished_at: 2026-06-29T03:17:24.252916+00:00
-- elapsed: 281ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_submitted_charge.d72af28b0f
-- query_id: 01c55d65-3204-2a5d-0008-056a0007b012
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
-- created_at: 2026-06-29T03:17:23.959572+00:00
-- finished_at: 2026-06-29T03:17:24.403844+00:00
-- elapsed: 444ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_total_payment.52c5fdde42
-- query_id: 01c55d65-3204-2b4c-0008-056a0007c016
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
-- created_at: 2026-06-29T03:17:23.968305+00:00
-- finished_at: 2026-06-29T03:17:24.404353+00:00
-- elapsed: 436ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_avg_medicare_payment.6adf292b65
-- query_id: 01c55d65-3204-2b4c-0008-056a0007c01a
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
-- created_at: 2026-06-29T03:17:24.325595+00:00
-- finished_at: 2026-06-29T03:17:24.466180+00:00
-- elapsed: 140ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_state.65388403cb
-- query_id: 01c55d65-3204-2a5d-0008-056a0007b016
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
-- created_at: 2026-06-29T03:17:24.346454+00:00
-- finished_at: 2026-06-29T03:17:24.474810+00:00
-- elapsed: 128ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_hospital_name.7c7cc7efda
-- query_id: 01c55d65-3204-2a5d-0008-056a0007b01a
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
-- created_at: 2026-06-29T03:17:24.337652+00:00
-- finished_at: 2026-06-29T03:17:24.495695+00:00
-- elapsed: 158ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_total_discharges.d68455db71
-- query_id: 01c55d65-3204-2a69-0008-056a000741ba
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
-- created_at: 2026-06-29T03:17:24.338849+00:00
-- finished_at: 2026-06-29T03:17:24.497252+00:00
-- elapsed: 158ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.not_null_stg_cms_inpatient_provider_ccn.9b10c7ad4f
-- query_id: 01c55d65-3204-2a69-0008-056a000741be
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
-- created_at: 2026-06-29T03:17:24.352173+00:00
-- finished_at: 2026-06-29T03:17:24.532246+00:00
-- elapsed: 180ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.healthcare_dq.accepted_values_stg_cms_inpatient_state__AL__AK__AZ__AR__CA__CO__CT__DE__FL__GA__HI__ID__IL__IN__IA__KS__KY__LA__ME__MD__MA__MI__MN__MS__MO__MT__NE__NV__NH__NJ__NM__NY__NC__ND__OH__OK__OR__PA__RI__SC__SD__TN__TX__UT__VT__VA__WA__WV__WI__WY__DC__PR__VI__GU__MP__AS.a270fd732c
-- query_id: 01c55d65-3204-2a69-0008-056a000741c2
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
