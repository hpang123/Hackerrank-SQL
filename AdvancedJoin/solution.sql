1. https://www.hackerrank.com/challenges/projects/problem

select Start_Date, MIN(End_Date)
from 
    (select Start_Date from Projects where Start_Date not in 
    (select End_Date from Projects)) a,
    (select End_Date from Projects where End_Date 
    not in (select Start_Date from Projects)) b 
where Start_Date < End_Date
group by Start_Date  order by min(end_date)- start_date asc, Start_Date;


2. https://www.hackerrank.com/challenges/placements/problem

select s.name from Friends f, Packages p, Packages pf, Students s
where f.id=p.id and f.friend_id=pf.id and pf.salary>p.salary and f.id=s.id
order by pf.salary;


3. https://www.hackerrank.com/challenges/symmetric-pairs/problem

select distinct f1.x, f1.y from 
(select x, y, rownum r from functions) f1, 
(select x, y, rownum r from functions) f2
where f1.y=f2.x and f2.y=f1.x  and f1.r <> f2.r and f1.x<=f1.y order by f1.x;


4. https://www.hackerrank.com/challenges/interviews/problem

select c.contest_id, c.hacker_id, c.name, t1.s1, t1.s2, t2.s3, t2.s4 from Contests c left outer join
(select co.contest_id, sum(s.total_submissions) s1, sum(s.total_accepted_submissions) s2
from Colleges co inner join Challenges ch on co.college_id=ch.college_id left outer join Submission_Stats s on ch.challenge_id=s.challenge_id 
group by co.contest_id) t1 on c.contest_id=t1.contest_id
left outer join 
(select co.contest_id, sum(v.total_views) s3, sum(v.total_unique_views) s4
from Colleges co inner join Challenges ch on co.college_id=ch.college_id left outer join View_Stats v on ch.challenge_id=v.challenge_id
group by co.contest_id) t2 on c.contest_id=t2.contest_id
where t1.s1 is not null and t1.s2 is not null and t2.s3 is not null and t2.s4 is not null
order by c.contest_id;


5. https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

select s_min_id_1.submission_date, s_unique_num.unique_count, h.hacker_id, h.name from
(select submission_date, min(s_min_id.hacker_id) min_hacker_id, submit_count from
(select s_c.submission_date, s_c.hacker_id, s_c.submit_count from
(select submission_date, hacker_id, count(*) submit_count from Submissions 
group by submission_date, hacker_id) s_c,
(select c.submission_date, max(submit_count) max_submit_count from
(select submission_date, hacker_id, count(*) submit_count from Submissions 
group by submission_date, hacker_id) c
group by c.submission_date) s_max
where s_c.submission_date=s_max.submission_date and s_c.submit_count=s_max.max_submit_count) s_min_id
group by s_min_id.submission_date, s_min_id.submit_count) s_min_id_1, 
(select * from (select submission_date, count(DISTINCT hacker_id) unique_count from (select a.submission_date, v.hacker_id, count(DISTINCT v.submission_date) cnt from ( select DISTINCT submission_date from Submissions order by 1 ) a, submissions v where v.submission_date <= a.submission_date group by a.submission_date, v.hacker_id ) where TO_CHAR(submission_date,'DD') = cnt group by submission_date)) s_unique_num,
Hackers h
where s_min_id_1.min_hacker_id = h.hacker_id and s_min_id_1.submission_date=s_unique_num.submission_date
order by s_min_id_1.submission_date;

