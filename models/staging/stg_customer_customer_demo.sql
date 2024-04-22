with 
    customer_customer_demo as (
        select *
        from {{source('northwind', 'customer_customer_demo')}}
        
    )
select *
from customer_customer_demo