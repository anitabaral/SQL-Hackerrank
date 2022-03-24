select senshi_name as sailor_senshi, real_name_jpn as real_name, 
c.name as cat, s.school as school 
from sailorsenshi sa
left join cats c
on sa.cat_id = c.id
left join schools s
on sa.school_id = s.id;
