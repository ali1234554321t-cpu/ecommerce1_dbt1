SELECT
    customer_id,
    customer_name,
    email,
    country
FROM {{ ref('stg_customers') }}