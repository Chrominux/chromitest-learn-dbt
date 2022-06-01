{{ config(materialized='incremental', unique_key = 'd_date' ) }}
-- unique_key makes sure that a records with the same id wont get loaded twice

SELECT *
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
WHERE d_date <= current_date 


{% if is_incremental() %}
and d_date > (SELECT max(d_date) FROM {{ this }})
{% endif %}
-- tells dbt which record we want to include in incremental runs(the materialization needs to be incremental and it isnt the 1st time that the model has been run)
