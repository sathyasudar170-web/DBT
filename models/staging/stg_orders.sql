
{{ config(materialized='table') }}
with source as (
    select * from {{ source('raw', 'orders') }}
),
renamed as(
    select
        order_id as o_id,
        product_id as p_id,
        customer_id as cust_id,
        unit_price,
        status,
        shipped_date
    from source 
    where shipped_date is not null
)
select * from renamed
