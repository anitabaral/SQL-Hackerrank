select h.hacker_id, h.name, sum(tmp.nscore) as total_score
from (select s.hacker_id, max(s.score) as nscore 
      from submissions s join hackers h 
      on h.hacker_id = s.hacker_id 
      group by s.challenge_id, s.hacker_id ) tmp 
join hackers h
on h.hacker_id = tmp.hacker_id
group by h.hacker_id, h.name
having total_score != 0
order by total_score desc, hacker_id asc 
