select
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
from {{ source('raw', 'RAW_ORDERS') }}

