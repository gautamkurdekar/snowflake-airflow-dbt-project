 
{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    o.order_id,
    c.customer_sk,
    o.order_date,
    o.status order_status,
    o.total_amount as total_price,
    current_timestamp as load_ts
from {{ ref('stg_raw_orders') }} o
join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id

{% if is_incremental() %}
  where o.order_date > (select max(order_date) from {{ this }})
{% endif %}


