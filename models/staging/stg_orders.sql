SELECT
    ID AS order_id,
    CUSTOMER_ID AS customer_id,
    ORDER_DATE AS order_date,
    TOTAL_AMOUNT AS total_amount,
    STATUS AS status
FROM {{ source('raw', 'ORDERS') }}