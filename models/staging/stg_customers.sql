SELECT
    ID AS customer_id,
    NAME AS customer_name,
    EMAIL AS email,
    COUNTRY AS country
FROM {{ source('raw', 'CUSTOMERS') }}