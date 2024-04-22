with 
    dim_customers as (
        select *
        from {{ref('dim_customers')}}
    )
    , orders as (
        select *
        from {{ref('stg_orders')}}
    )
    , juncao as (
        select
            dim_customers.sk_customer
            , orders.*
        from orders
        left join dim_customers on orders.customer_id = dim_customers.customer_id
    )
select *
from juncao