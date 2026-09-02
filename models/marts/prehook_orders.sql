{{
    config(
        materialized='table',
        pre_hook = [
    "CREATE OR REPLACE TEMPORARY TABLE DB.DBT_SCH.TEMP_ORDERS AS SELECT * FROM DB.RAW_SCHEMA.ORDERS"
]
    )
}}


with cte as (
    select * from db.dbt_sch.temp_orders
)


select * from cte 