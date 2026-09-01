{{
    config(
        materialized='table'
    )
}}


with cte as (
    select  * from {{ source('raw', 'customers') }}
)


select 
   city,
   country,
   created_at,
   first_name as f_name,
   last_name as l_name,
   email,
   phone
from cte 