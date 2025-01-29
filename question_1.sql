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

SELECT
	industry,
	salary_year,
	diff
FROM v1_vojtech_derner
WHERE 
	1=1
	AND diff IN (0,5)
	-- AND diff = 1
ORDER BY industry, salary_year;


