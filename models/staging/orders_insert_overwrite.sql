{{
    config(
        materialized='incremental',
        incremental_strategy = 'overwrite',
        partition_by = {
            "field" : "shipped_date",
            "data_type" : "date"
        }
    )
}}


with cte as (
    select * from {{ source('raw', 'orders') }}
)

select 
   order_id,
   customer_id,
   status,
   shipped_date,
   current_timestamp() as ds 
from cte 
{%if is_incremental() %}
where shipped_date > (select max(shipped_date) from {{this}})
{% endif %}