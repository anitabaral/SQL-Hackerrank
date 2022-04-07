---using exists
select 
    id as id,
    name as name
from sales
where  exists (
  select * 
  from departments 
  join sales 
  on departments.id = sales.department_id 
  where price > 98.00)
  
  
---without using exists
select 
    d.id as id,
    d.name as name
from departments d
join (select department_id from sales where price > 98.00) tmp
on tmp.department_id = d.id
