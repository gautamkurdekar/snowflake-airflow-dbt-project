{{ config(
    materialized='table'
) }}

select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    current_timestamp as load_ts
from {{ ref('stg_raw_orders') }}
group by customer_id
