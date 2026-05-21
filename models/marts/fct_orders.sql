SELECT

    order_id,
    customer_id,
    customer_name,

    SUM(price * quantity) AS total_sales

FROM {{ ref('stg_orders') }}

GROUP BY 1,2,3