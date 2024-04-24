with 
    region as (
        select *
        from {{source('northwind', 'region')}}
        
    )
select *
from region