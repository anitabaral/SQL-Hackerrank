-- Create your VIEW statement here
create view members_approved_for_voucher as
select 
  m.id, 
  m.name, 
  m.email,
  sum(p.price) as total_spending
  
  from sales s
    join products p
    on p.id = s.product_id
    join members m
    on m.id = s.member_id
    join departments d 
    on s.department_id in (select 
                          s.department_id 
                          from sales s, products p 
                          where p.id = s.product_id  
                          group by s.department_id 
                          having sum(p.price) > 10000)
  group by m.id, m.name, m.email
  having sum(price) > 1000
  order by m.id;

select * from members_approved_for_voucher;
