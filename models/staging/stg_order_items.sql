SELECT
    ID AS order_item_id,
    ORDER_ID AS order_id,
    PRODUCT_ID AS product_id,
    QUANTITY AS quantity,
    UNIT_PRICE AS unit_price,
    QUANTITY * UNIT_PRICE AS item_total
FROM {{ source('raw', 'ORDER_ITEMS') }}