with 
    territories as (
        select *
        from {{source('northwind', 'territories')}}
        
    )
select *
from territories