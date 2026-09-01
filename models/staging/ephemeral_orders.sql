{{
    config(
        materialized='ephemeral'
    )
}}


with cte as (
    select * from {{ source('raw', 'orders') }}
)


select order_id,customer_id,status,shipped_date from cte
where shipped_date is null 