SELECT
    ID AS product_id,
    NAME AS product_name,
    CATEGORY AS category,
    PRICE AS price
FROM {{ source('raw', 'PRODUCTS') }}