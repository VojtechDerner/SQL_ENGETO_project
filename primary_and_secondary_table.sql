-- discord: deri_cze (Vojtěch D.)
-- primary table
CREATE OR REPLACE TABLE t_vojtech_derner_project_SQL_primary_final AS 
SELECT 
	cpib.name industry,
	avg(cpay.value) avg_salary,
	cpay.payroll_year salary_year,
	cpc.name foodstuff,
	avg(cp.value) avg_price
FROM czechia_payroll AS cpay 
JOIN czechia_payroll_industry_branch AS cpib 
	ON cpay.industry_branch_code = cpib.code 
JOIN czechia_price AS cp
	ON YEAR(cp.date_from) = cpay.payroll_year
JOIN czechia_price_category AS cpc 
	ON cpc.code = cp.category_code
WHERE 
	cpay.payroll_year BETWEEN 2006 AND 2018
	AND cpay.value_type_code = 5958
	AND cpay.calculation_code = 100
	AND cpay.industry_branch_code IS NOT NULL
	AND cp.region_code IS NULL 
GROUP BY industry, salary_year, foodstuff;

SELECT * FROM t_vojtech_derner_project_SQL_primary_final;

-- secondary table
CREATE OR REPLACE TABLE t_vojtech_derner_project_SQL_secondary_final AS
SELECT	
	c.country,
	e.`year` ,
	e.GDP,
	e.gini,
	e.population
FROM economies AS e
JOIN countries AS c 
	ON e.country = c.country
WHERE 
	c.continent = 'Europe'
	AND e.`year` BETWEEN 2006 AND 2018;

SELECT * FROM t_vojtech_derner_project_SQL_secondary_final;