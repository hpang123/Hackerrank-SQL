1. https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

select   RPAD ('* ', (21-LEVEL)*2, '* ') from DUAL
CONNECT by LEVEL <= 20;


2. https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

select     RPAD ('* ', LEVEL*2, '* ') from DUAL
CONNECT by LEVEL <= 20;

3. https://www.hackerrank.com/challenges/print-prime-numbers/problem

select LISTAGG(l,'&') WITHIN GROUP (ORDER by l) from 
(select l from (select level l from dual connect by level <= 1000), 
(select level m from dual connect by level <= 1000) 
where m<=l group by l having count(case l/m when trunc(l/m) then 'Y' end) = 2 
order by l);