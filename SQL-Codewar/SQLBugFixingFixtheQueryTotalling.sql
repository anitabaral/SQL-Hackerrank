SELECT 
  s.transaction_date::date as day,
  d.name::varchar as department,
  COUNT(s.id) as sale_count
  FROM department d
    JOIN sale s 
	on d.id = s.department_id
  group by department, day
  order by day asc
