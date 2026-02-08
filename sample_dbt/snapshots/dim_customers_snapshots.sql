{% snapshot dim_customers_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['customer_id']
    )
}}

select
    customer_id,
    first_order_date,
    last_order_date
from {{ ref('dim_customers') }}

{% endsnapshot %}
