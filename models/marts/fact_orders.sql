with 
    dim_customers as (
        select *
        from {{ref('dim_customers')}}
    )
    , dim_products as (
        select *
        from {{ref('dim_products')}}
    )
    , dim_categories as (
        select *
        from {{ref('dim_categories')}}
    )
    , dim_suppliers as (
        select *
        from {{ref('dim_suppliers')}}
    )
    , orders as (
        select *
        from {{ref('stg_orders')}}
    )
    , order_details as (
        select *
        from {{ref('stg_order_details')}}
    )
    , juncao as (
        select
            dim_customers.sk_customer
            , dim_products.sk_products
            , dim_categories.sk_categories
            , dim_suppliers.sk_suppliers
            , dim_products.product_name
            , dim_categories.category_name
            , dim_suppliers.contact_name
            , orders.*
            , order_details.unit_price
            , order_details.quantity
            , order_details.discount
        from orders
        left join dim_customers on orders.customer_id = dim_customers.customer_id
        left join order_details on orders.order_id = order_details.order_id
        left join dim_products on order_details.product_id = dim_products.product_id
        left join dim_categories on dim_products.category_id = dim_categories.category_id
        left join dim_suppliers on dim_products.supplier_id = dim_suppliers.supplier_id
    )
    , creatingSK as (
        select 
            {{ dbt_utils.generate_surrogate_key(['order_id','product_name']) }} as sk_orders
            , *
        from juncao
    )
select *
from creatingSK
--dim_products, dim_supplies, dim_categories e order_details