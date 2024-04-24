with 
    employee_territories as (
        select *
        from {{source('northwind', 'employee_territories')}}
        
    )
select *
from employee_territories