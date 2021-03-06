{{ config(materialized='table') }}


SELECT 
    c.c_custkey as CustomerKey,
    c.c_name as Name,
    c.c_nationkey as Nation,
    SUM(o.o_totalprice) as totalOrderPrice
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
ON c.c_custkey = o.o_custkey
GROUP BY
    c.c_custkey,
    c.c_name,
    c.c_nationkey