{{
    config(
        materialized='incremental',
        incremental_strategy = 'append'
    )
}}


with cte as (
    select * from {{ source('raw', 'orders') }}
)

select 
   order_id,
   customer_id,
   status,
   shipped_date
from cte 
{%if is_incremental() %}
where shipped_date > (select max(shipped_date) from {{this}})
{% endif %}