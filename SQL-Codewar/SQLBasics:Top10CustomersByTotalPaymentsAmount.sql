select 
      c.customer_id::int4, 
      c.email::varchar,
      payments_count::int,
      total_amount::float
from (select customer_id, 
      count(payment_id) as payments_count, 
      sum(amount) as total_amount 
      from payment 
      group by customer_id
     ) tmp 
join customer c
  on c.customer_id = tmp.customer_id
order by total_amount desc
limit 10;
