SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.status,
    SUM(oi.quantity) AS total_quantity,
    COUNT(oi.order_item_id) AS total_items
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.status
    