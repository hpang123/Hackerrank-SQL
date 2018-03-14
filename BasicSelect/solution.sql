
1. https://www.hackerrank.com/challenges/revising-the-select-query/problem

select * from city where countrycode='USA' and population>100000;

2. https://www.hackerrank.com/challenges/revising-the-select-query-2/problem

select name from city where countrycode='USA' and population>120000;

3. https://www.hackerrank.com/challenges/select-all-sql/problem

select * from city;

4. https://www.hackerrank.com/challenges/select-by-id/problem

select * from city where id=1661;

5. https://www.hackerrank.com/challenges/japanese-cities-attributes/problem

select * from city where countrycode='JPN';

6. https://www.hackerrank.com/challenges/weather-observation-station-1/problem

select city, state from station;

7. https://www.hackerrank.com/challenges/weather-observation-station-3/problem

select distinct city from station where mod(id,2)=0;

8. https://www.hackerrank.com/challenges/weather-observation-station-4/problem

select count(*) - count(distinct(city)) from station;

9. https://www.hackerrank.com/challenges/weather-observation-station-5/problem

select * from (select city, length(city) l from station order by l asc, city asc) where rownum=1;
select * from (select city, length(city) l from station order by l desc, city asc) where rownum=1;

10. https://www.hackerrank.com/challenges/weather-observation-station-6/problem

select distinct city from station where substr(lower(city),1,1) in ('a', 'e', 'i', 'o', 'u');

11. https://www.hackerrank.com/challenges/weather-observation-station-7/problem

SELECT DISTINCT city 
FROM station 
WHERE SUBSTR(lower(CITY),-1) IN ('a','e','i','o','u');

12. https://www.hackerrank.com/challenges/weather-observation-station-8/problem

SELECT DISTINCT city 
FROM station 
WHERE SUBSTR(lower(CITY),-1) IN ('a','e','i','o','u') and SUBSTR(lower(CITY),1,1) IN ('a','e','i','o','u');

13. https://www.hackerrank.com/challenges/weather-observation-station-9/problem

select distinct city from station where SUBSTR(lower(CITY),1,1) not IN ('a','e','i','o','u');

14. https://www.hackerrank.com/challenges/weather-observation-station-10/problem

select distinct city from station where SUBSTR(lower(CITY),-1) not IN ('a','e','i','o','u');

15. https://www.hackerrank.com/challenges/weather-observation-station-11/problem

select distinct city from station where SUBSTR(lower(CITY),1,1) not IN ('a','e','i','o','u') or SUBSTR(lower(CITY),-1) not IN ('a','e','i','o','u');

16. https://www.hackerrank.com/challenges/weather-observation-station-12/problem

select distinct city from station where SUBSTR(lower(CITY),1,1) not IN ('a','e','i','o','u') and SUBSTR(lower(CITY),-1) not IN ('a','e','i','o','u');

17. https://www.hackerrank.com/challenges/more-than-75-marks/problem

select name from students where marks>75 order by SUBSTR(lower(name),-3), id;

18. https://www.hackerrank.com/challenges/name-of-employees/problem

select name from employee order by name;

19. https://www.hackerrank.com/challenges/salary-of-employees/problem

select name from employee where salary>2000 and months<10 order by employee_id asc;








