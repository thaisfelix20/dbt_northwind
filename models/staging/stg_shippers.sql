with 
    shippers as (
        select *
        from {{source('northwind', 'shippers')}}
        
    )
select *
from shippers