{% snapshot order_snapshot %}

{{
    config(
        target_schema='DBT_SCH',
        unique_key='order_id',
        strategy='check',
        check_cols=['status', 'shipped_date']
    )
}}

select
    order_id,
    customer_id,
    product_id,
    quantity,
    unit_price,
    status,
    order_date,
    shipped_date

from {{ source('raw', 'orders') }}

{% endsnapshot %}   