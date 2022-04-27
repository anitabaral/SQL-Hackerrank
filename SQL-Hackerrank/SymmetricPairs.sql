select x, y from functions f1
group by x, y having count(1)=2
union
select x, y from functions f1
where x < y and exists (select x, y from functions f2 where f1.x = f2.y and f2.x = f1.y)
order by x, y;