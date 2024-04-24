with 
    customer_demographics as (
        select *
        from {{source('northwind', 'customer_demographics')}}
        
    )
select *
from customer_demographics