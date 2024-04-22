with 
    employees as (
        select *
        from {{source('northwind', 'employees')}}
        
    )
select *
from employees