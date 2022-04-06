select 
  date(created_at) as date,
  count(*) as count,
  sum(count(*)) over(order by date(created_at))::int as total
from posts
group by date
order by date asc;
  
