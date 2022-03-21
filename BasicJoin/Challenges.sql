select h.hacker_id, h.name, count(c.challenge_id) as total_number_of_challenges
from hackers h join challenges c 
on h.hacker_id = c.hacker_id 
group by h.hacker_id, h.name
having 
total_number_of_challenges = (select max(number_of_challenges) from 
                              (select count(*) as number_of_challenges 
                               from challenges 
                               group by hacker_id) tmp1)
or
total_number_of_challenges in (select distinct number_of_challenges 
                               from (select count(challenge_id) as number_of_challenges
                                    from challenges c join hackers h on c.hacker_id = h.hacker_id                                                    group by h.hacker_id, h.name
                                    ) tmp2
                              group by number_of_challenges
                              having count(number_of_challenges) = 1)
order by total_number_of_challenges desc, h.hacker_id;
