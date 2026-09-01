{{config(materialized = 'view')}}


with source as (
    select * from {{ ref('stg_orders') }}
)


select o_id as order_id,cust_id as customer_id, status 
from source 