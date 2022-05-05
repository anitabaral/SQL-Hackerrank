with max_sub_each_day as (
    select submission_date,
           hacker_id,
           rank() over(partition by submission_date order by sub_count desc, hacker_id) as rn
    from
    (select submission_date, hacker_id, count(1) as sub_count 
     from submissions
     group by submission_date, hacker_id
     ) a
),
day_wise_rank as (
    select submission_date,
           hacker_id,
           dense_rank() over(order by submission_date) as day_rn
    from submissions
),
hacker_cnt_till_date as (
select outtr.submission_date,
       outtr.hacker_id,
       case when outtr.submission_date='2016-03-01' then 1
            else 1+(select count(distinct a.submission_date)
                    from submissions a
                    where a.hacker_id = outtr.hacker_id and                           
                    a.submission_date<outtr.submission_date)
        end as prev_cnt,
        outtr.day_rn
from day_wise_rank outtr
),
hackers_sub_each_day as (
    select submission_date, count(distinct hacker_id) hacker_cnt
    from hacker_cnt_till_date
  where prev_cnt = day_rn
group by submission_date
)
select hackers_sub_each_day.submission_date,
       hackers_sub_each_day.hacker_cnt,
       max_sub_each_day.hacker_id,
       hackers.name
from hackers_sub_each_day
inner join max_sub_each_day
on hackers_sub_each_day.submission_date = max_sub_each_day.submission_date
inner join hackers
on hackers.hacker_id = max_sub_each_day.hacker_id
where max_sub_each_day.rn=1;
