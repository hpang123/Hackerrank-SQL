1. https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem

select count(*) from city where population >100000;

2. https://www.hackerrank.com/challenges/revising-aggregations-sum/problem

select sum(population) from city group by district having district='California';

3. https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem

select avg(population) from city group by district having district='California';

4. https://www.hackerrank.com/challenges/average-population/problem

select round(avg(population)) from city;

5. https://www.hackerrank.com/challenges/japan-population/problem

select sum(population) from city group by countrycode having countrycode='JPN';

6. https://www.hackerrank.com/challenges/population-density-difference/problem

select max(population) - min(population) from city;

7. https://www.hackerrank.com/challenges/the-blunder/problem

select ceil(avg(salary) -avg(replace(to_char(salary), '0', ''))) from EMPLOYEES;

8. https://www.hackerrank.com/challenges/earnings-of-employees/problem

select salary*months, count(*) from employee where salary*months = (select  max(salary*months) from employee) group by salary*months;

9. https://www.hackerrank.com/challenges/weather-observation-station-2/problem

select round(sum(lat_n),2), round(sum(long_w),2) from station

10. https://www.hackerrank.com/challenges/weather-observation-station-13/problem

select round(sum(lat_n),4) from station where lat_n>38.788 and lat_n<137.2345;

11. https://www.hackerrank.com/challenges/weather-observation-station-14/problem

select round(max(lat_n),4) from station where lat_n <137.2345;

12. https://www.hackerrank.com/challenges/weather-observation-station-15/problem

select round(long_w,4) from station, (select max(lat_n) m from station where lat_n<137.2345) where lat_n = m;

13. https://www.hackerrank.com/challenges/weather-observation-station-16/problem

select round(min(lat_n),4) from station where lat_n>38.778;

14. https://www.hackerrank.com/challenges/weather-observation-station-17/problem

select round(long_w,4) from station, (select min(lat_n) m from station where lat_n>38.778) where lat_n= m;

15. https://www.hackerrank.com/challenges/weather-observation-station-18/problem

select round(max(long_w) - min(long_w) + max(lat_n) - min(lat_n), 4) from station;

16. https://www.hackerrank.com/challenges/weather-observation-station-19/problem

select round(sqrt(power(max(long_w) - min(long_w),2) + power(max(lat_n) - min(lat_n),2)), 4) from station;

17. https://www.hackerrank.com/challenges/weather-observation-station-20/problem

select round(lat_n,4) from (select lat_n, rownum r from (select lat_n from station order by lat_n asc)), (select count(*) c from station) where r = ceil(c/2) ;
 
 
