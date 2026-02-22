--- Cyber Security Salaries Data Analysis
-- Dataset: 1247 records
-- Tool Used: MySQL
-- Objective: Analyze salary trends by experience,
--            role, company size, and remote work. 
 
 CREATE DATABASE cyber_salaries_db;
USE cyber_salaries_db;
CREATE TABLE cyber_salaries (
    work_year INT,
    experience_level VARCHAR(20),
    employment_type VARCHAR(20),
    job_title VARCHAR(255),
    salary DECIMAL(12,2),
    salary_currency VARCHAR(10),
    salary_in_usd DECIMAL(12,2),
    employee_residence VARCHAR(50),
    remote_ratio INT,
    company_location VARCHAR(50),
    company_size VARCHAR(20)
);
select * from cyber_salaries; 
SELECT COUNT(*) FROM cyber_salaries;   -- Should return 1247
SELECT * FROM cyber_salaries LIMIT 10; -- Preview first 10 rows

SELECT experience_level, 
       ROUND(AVG(salary_in_usd),2) AS avg_salary
FROM cyber_salaries
GROUP BY experience_level;
SELECT job_title, 
       ROUND(AVG(salary_in_usd),2) AS avg_salary
FROM cyber_salaries
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 5;
SELECT job_title, salary_in_usd
FROM cyber_salaries
ORDER BY salary_in_usd DESC
LIMIT 1;
SELECT COUNT(*) 
FROM cyber_salaries
WHERE salary_in_usd IS NULL;
SELECT 
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    ROUND(AVG(salary_in_usd),2) AS avg_salary
FROM cyber_salaries;
SELECT COUNT(*) 
FROM cyber_salaries
WHERE salary_in_usd > 300000;
SELECT 
    ROUND(AVG(salary_in_usd),2) AS avg_salary_under_300k
FROM cyber_salaries
WHERE salary_in_usd <= 300000;
SELECT company_size,
       ROUND(AVG(salary_in_usd),2) AS avg_salary
FROM cyber_salaries
GROUP BY company_size
ORDER BY avg_salary DESC;
SELECT remote_ratio,
       ROUND(AVG(salary_in_usd),2) AS avg_salary
FROM cyber_salaries
GROUP BY remote_ratio
ORDER BY avg_salary DESC;
SELECT job_title,
       COUNT(*) AS total_roles
FROM cyber_salaries
GROUP BY job_title
ORDER BY total_roles DESC
LIMIT 5;
SELECT experience_level,
       COUNT(*) AS total_roles
FROM cyber_salaries
GROUP BY experience_level
ORDER BY total_roles DESC; 
