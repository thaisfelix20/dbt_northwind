--receita não seja abaixo de zero
with
receitas as (
    select 
        order_date, 
        sum(unit_price*quantity) as receita
    from {{ref('fact_orders')}}
    group by order_date
    order by order_date 
)
select 1
from receitas
where receita<0