-- Q1: Rostou v průběhu let mzdy ve všech odvětvích, 
-- nebo v některých klesají?

CREATE OR REPLACE VIEW v1_vojtech_derner AS (
SELECT 
	industry,
	avg(avg_salary) sal_avg,
	lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year) AS prev,
	salary_year,
CASE 
	WHEN avg(avg_salary) > lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year) THEN 1
	WHEN avg(avg_salary) = lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year) THEN 5
	WHEN avg(avg_salary) < lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year) THEN 0
	ELSE NULL 
END AS diff
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
GROUP BY industry, salary_year
);

SELECT * FROM v1_vojtech_derner;

-- 0 = payroll decline, 1 = payroll growth, 5 = payroll stable

-- payroll growth industry only 
WITH w1 AS (
SELECT
	DISTINCT industry
FROM v1_vojtech_derner
WHERE 
	diff IN (0,5)
)
SELECT
	DISTINCT industry
FROM v1_vojtech_derner
WHERE 
	industry NOT IN (SELECT * FROM w1);

-- overview of each payroll decline
SELECT
	industry,
	salary_year,
	diff
FROM v1_vojtech_derner
WHERE 
	diff IN (0,5)
ORDER BY industry, salary_year;



