/*
This test is used to validate that dates within the `fct_orders` table
falls within an accepted range (less than the execution date and more than 1990)
*/
select
    *
from
    {{ ref('fct_orders') }}
where
    date(order_date) > CURRENT_DATE()
    or date(order_date) < date('1990-01-01')
