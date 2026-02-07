{% snapshot scd_customers %}

{{
    config(
      target_schema = 'SNAPSHOTS',
      unique_key = 'customer_id',
      strategy = 'check',
      check_cols = ['customer_name', 'nation_id', 'account_balance', 'market_segment']
    )
}}

select
    customer_id,
    customer_name,
    nation_id,
    account_balance,
    market_segment
from {{ ref('stg_customers') }}

{% endsnapshot %}
