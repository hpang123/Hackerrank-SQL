1. https://www.hackerrank.com/challenges/what-type-of-triangle/problem

SELECT
CASE
  WHEN a + b <=c or a+c<=b or b+c<=a THEN 'Not A Triangle'
  WHEN (a = b and a != c) or (a=c and a!=b) or (b=c and b!=a) THEN 'Isosceles'
  WHEN a = b and a = c THEN 'Equilateral'
  WHEN a != b and a != c and b !=c THEN 'Scalene'
END
FROM TRIANGLES;


2. https://www.hackerrank.com/challenges/the-pads/problem

select name || '(' || SUBSTR(occupation, 1, 1)||')' from OCCUPATIONS order by name;

select 'There are total ' || count(*) || ' ' || lower(occupation) || 's.' from OCCUPATIONS group by occupation order by count(*), occupation;


3.https://www.hackerrank.com/challenges/occupations/problem

/*
select Doctor, rownum from (select name as Doctor from OCCUPATIONS where occupation ='Doctor' order by name);
select Professor, rownum from (select name as Professor from OCCUPATIONS where occupation ='Professor' order by name);
select Singer, rownum from (select name as Singer from OCCUPATIONS where occupation ='Singer' order by name);
select Actor, rownum from (select name as Actor from OCCUPATIONS where occupation ='Actor' order by name);*/

select d.name as Doctor, p.name as Professor, s.name as Singer, a.name as Actor from (select Doctor as name, rownum as r from (select name as Doctor from OCCUPATIONS where occupation ='Doctor' order by name)) d FULL OUTER JOIN 
(select Professor as name, rownum as r from (select name as Professor from OCCUPATIONS where occupation ='Professor' order by name)) p on d.r=p.r FULL OUTER JOIN
(select Singer as name, rownum as r from (select name as Singer from OCCUPATIONS where occupation ='Singer' order by name)) s on p.r=s.r  FULL OUTER JOIN
(select Actor as name, rownum as r from (select name as Actor from OCCUPATIONS where occupation ='Actor' order by name)) a on s.r=a.r;


4. https://www.hackerrank.com/challenges/binary-search-tree-1/problem

select n,
case
    when p is null then 'Root'
    when n in (select p from BST) then 'Inner'
    else 'Leaf'
end
from BST order by n;


5. https://www.hackerrank.com/challenges/the-company/problem

/*
select c.company_code, c.founder, 
    count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), 
    count(distinct m.manager_code),count(distinct e.employee_code) 
from Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e 
where c.company_code = l.company_code 
    and l.lead_manager_code=s.lead_manager_code 
    and s.senior_manager_code=m.senior_manager_code 
    and m.manager_code=e.manager_code 
group by c.company_code,  c.founder order by c.company_code;
to_number(substr(c.company_code,2)) asc;
*/

select c.company_code, c.founder, l.lead_manager_num, s.senior_manager_num, m.manager_num, e.employee_num
from (select distinct company_code, founder from Company) c, 
(select company_code, count(distinct Lead_Manager_code) lead_manager_num from Lead_Manager group by company_code) l,
(select company_code, count(distinct senior_manager_code) senior_manager_num from Senior_Manager  group by company_code) s,
(select company_code, count(distinct manager_code) manager_num from Manager  group by company_code) m,
(select company_code, count(distinct employee_code) employee_num from Employee  group by company_code) e
where c.company_code=l.company_code and c.company_code=s.company_code and c.company_code=m.company_code
and c.company_code=e.company_code
order by c.company_code;

