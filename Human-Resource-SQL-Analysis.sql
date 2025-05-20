
-- 1). Total staff hired between 2010 and 2015 --
SELECT *
FROM [Human Resources]
WHERE hire_date BETWEEN '2010-01-01' AND '2015-12-31'

SELECT COUNT(emp_id) Total_hires
FROM [Human Resources]
WHERE hire_date BETWEEN '2010-01-01' AND '2015-12-31'


-- 2). Total terminated staff in 2010 - 2015 --
SELECT *
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'

SELECT COUNT(emp_id) Total_terminated_staff
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'


-- 3). Staff terminated by location state between 2010 -2015 --
SELECT location_state, COUNT(emp_id) total_terminated_staff
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY location_state


-- 4). Department with hisghest termination rate --
SELECT TOP (5) department, COUNT(emp_id) total_terminated_staff
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY department
ORDER BY total_terminated_staff DESC


-- 5). Department with lowest termination rate --
SELECT TOP (5) department, COUNT(emp_id) total_terminated_staff
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY department
ORDER BY total_terminated_staff ASC


-- 6). Terminated staff by race --
SELECT race, COUNT(emp_id) total_terminated_staff
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY race
ORDER BY total_terminated_staff 



-- PART TWO --
-- 7). 
-- a. i) Churn rate of employees by job title with hire date between 2010 and 2015 --
 SELECT jobtitle, 
	(COUNT(CASE WHEN termdate IS NOT NULL THEN 1 END) * 100 / COUNT(emp_id)) AS churn_rate
FROM [Human Resources]
WHERE hire_date BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY jobtitle


	-- a. ii) Churn rate of employees by job title with termdate between 2010 and 2015 --
SELECT 
    COUNT(CASE WHEN termdate IS NOT NULL THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM [Human Resources] WHERE hire_date <= '2010-01-01') AS churn_rate
FROM [Human Resources]
WHERE termdate BETWEEN '2010-01-01' AND '2015-12-31';


-- b. Retention rate by department --
SELECT department, 
	(COUNT(CASE WHEN termdate IS NULL THEN 1 END) * 100 / COUNT(emp_id)) AS retension_rate
FROM [Human Resources]
GROUP BY department


 -- c. i) Average tenure by department --
 SELECT department, DATEDIFF(YY, CONVERT(DATETIME, hire_date), GETDATE()) AS Avg_tenure
 FROM [Human Resources]
 GROUP BY department, hire_date


  -- c. ii) Average tenure by job title --
 SELECT jobtitle, DATEDIFF(YY, CONVERT(DATETIME, hire_date), GETDATE()) AS Avg_tenure
 FROM [Human Resources]
 GROUP BY jobtitle, hire_date


 -- 8). 
 -- a. i) Race divercity by department --
 SELECT DISTINCT(department), 
 COUNT(CASE WHEN race = 'Hispanic or Latino' THEN 1 END) AS Hispanic_or_Latino, 
 COUNT(CASE WHEN race = 'WHITE' THEN 1 END) AS White,
 COUNT(CASE WHEN race = 'Black or African American' THEN 1 END) AS Black_or_African_American,
 COUNT(CASE WHEN race = 'Two or More Races' THEN 1 END) AS Two_or_More_Races,
 COUNT(CASE WHEN race = 'Asian' THEN 1 END) AS Asian,
 COUNT(CASE WHEN race = 'American Indian or Alaska Native' THEN 1 END) AS American_Indian_or_Alaska_Native,
 COUNT(CASE WHEN race = 'Native Hawaiian or Other Pacific Islander' THEN 1 END) AS Native_Hawaiian_or_Other_Pacific_Islander
 FROM [Human Resources]
 GROUP BY department


 -- b. ii) gender divercity by department --
 SELECT department, 
 COUNT(CASE WHEN gender = 'male' THEN 1 END) AS Male,
 COUNT(CASE WHEN gender = 'female' THEN 1 END) AS Female,
 COUNT(CASE WHEN gender = 'non-conforming' THEN 1 END) AS Non_Conforming
 FROM [Human Resources]
 GROUP BY department



  -- 10). Location distribution --
 SELECT location, COUNT(location) Distribution
 FROM [Human Resources]
 GROUP BY location