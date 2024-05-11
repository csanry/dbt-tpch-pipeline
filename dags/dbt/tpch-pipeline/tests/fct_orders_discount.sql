/*
This test is used to validate that discount amounts within the `fct_orders` table
are non-positive
*/
select
    *
from
    {{ ref('fct_orders') }}
where
    item_discount_amount > 0
