with 
    us_states as (
        select *
        from {{source('northwind', 'us_states')}}
        
    )
select *
from us_states