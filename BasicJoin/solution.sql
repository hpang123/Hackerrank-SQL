1. https://www.hackerrank.com/challenges/asian-population/problem

select sum(ci.population) from city ci, country co where ci.countrycode= co.code and co.continent ='Asia';

2. https://www.hackerrank.com/challenges/african-cities/problem

select ci.name from city ci, country co where ci.countrycode = co.code and co.CONTINENT ='Africa';

3. https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

select co.continent, floor(avg(ci.population)) from city ci, country co where ci.countrycode = co.code group by co.CONTINENT;

4. https://www.hackerrank.com/challenges/the-report/problem

select Case  When g.grade<8 then 'NULL' else s.name End, g.grade, s.marks 
from students s, grades g where s.marks >= g.min_mark and s.marks <= g.max_mark 
order by g.grade desc, s.name asc, s.marks asc;


5. https://www.hackerrank.com/challenges/full-score/problem

select s.hacker_id, h.name 
from Submissions s, Hackers h, Challenges c, Difficulty d 
where s.hacker_id=h.hacker_id and s.challenge_id=c.challenge_id 
and c.difficulty_level=d.difficulty_level and s.score=d.score 
group by s.hacker_id, h.name having count(*) >1 
order by count(*) desc, s.hacker_id asc;


6. https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

select w.id, p.age, w.coins_needed, w.power 
from Wands w, Wands_Property p, 
(select  p1.age, min(w1.coins_needed) m, w1.power 
from Wands w1, Wands_Property p1 where w1.code=p1.code and p1.is_evil=0 
group by w1.power, p1.age) t 
where w.code=p.code and p.is_evil=0 and p.age=t.age 
and w.power=t.power and w.coins_needed = t.m  
order by w.power desc, p.age desc;


7. https://www.hackerrank.com/challenges/challenges/problem

select h.hacker_id, h.name, count(*) n from Hackers h, Challenges c 
where h.hacker_id=c.hacker_id  group by h.hacker_id, h.name 
having count(*) not in  
(select clg_n from (select count(*) m, clg_n 
from (select count(*) clg_n, hacker_id from Challenges group by hacker_id) 
group by clg_n having count(*)>1), 
(select max(count(*)) max_clg_n from Challenges group by hacker_id) 
where clg_n != max_clg_n) 
order by n desc, h.hacker_id;


8. https://www.hackerrank.com/challenges/contest-leaderboard/problem

select t.hacker_id, t.name, sum(clg_score) total  from 
(select h.hacker_id, h.name,  max(score) clg_score 
from Hackers h, Submissions s where h.hacker_id=s.hacker_id 
group by h.hacker_id, h.name, s.challenge_id) t 
group by t.hacker_id, t.name having sum(clg_score)>0 
order by total desc, t.hacker_id;



