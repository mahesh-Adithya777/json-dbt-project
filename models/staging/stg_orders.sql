with src as (
    select *
    from {{source('raw','raw_orders')}}
)
select
f.value:customer.name::string as customer_name,
f.value:order_id::string as order_id,
f.value:customer.customer_id::int as customer_id,
f.value:customer.loyalty.tier::string as loyaty_tier,
i.value:item_id::string as item_id,
i.value:product.product_id::STRING AS product_id,
i.value:product.product_name::STRING AS product_name,
i.value:product.category.main::STRING AS category_main,
i.value:price::NUMBER AS price,
i.value:quantity::INT AS quantity
from src,
lateral flatten(input => raw_data)f,
lateral flatten(input =>f.value:items)i
 