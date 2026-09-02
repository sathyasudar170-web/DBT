{{
    config(
        materialized='table'
    )
}}




with cte as (
    select * from {{ source('raw', 'orders') }}
)



select order_id, customer_id, unit_price, {{cents_to_dollars ('unit_price')}} as unit_price_dollars, status from cte