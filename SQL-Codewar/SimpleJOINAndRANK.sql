select 
  p.id as id,
  name,
  count(sale) as sale_count,
  rank() over(order by count(sale)) as sale_rank
from people p
join sales s
  on p.id = s.people_id
group by p.id, name;
