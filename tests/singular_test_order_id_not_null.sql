select order_id from {{ ref('fact_orders') }}
where order_id is null