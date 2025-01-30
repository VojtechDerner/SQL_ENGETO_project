/* Q5: Má výška HDP vliv na změny ve mzdách a cenách potravin? 
 	Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to
 	na cenách potravin či mzdách ve stejném nebo násdujícím roce 
 	výraznějším růstem?
*/

SELECT * FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf ;

CREATE OR REPLACE VIEW v4_vojtech_derner AS (
SELECT
`year`,
GDP,
round(((GDP - lag(GDP) OVER (PARTITION BY country ORDER BY year))/lag(GDP) OVER (PARTITION BY country ORDER BY year)),4)*100 diff_per_GDP
FROM t_vojtech_derner_project_sql_secondary_final AS tvdpssf
WHERE country = 'Czech Republic'
);

SELECT * FROM v4_vojtech_derner;

WITH w2 AS (
SELECT  
	salary_year,
	round(((ts.GDP - lag(ts.GDP) OVER (PARTITION BY ts.country ORDER BY ts.year))/lag(ts.GDP) OVER (PARTITION BY ts.country ORDER BY ts.year)),4)*100 diff_per_GDP,
	round(((avg(avg_price) - lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_per_price,
	round(((avg(avg_price) - lag(avg(avg_price),2) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price),2) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_per_price2,
	round(((avg(avg_salary) - lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year))/lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year)),4)*100 diff_per_salary,
	round(((avg(avg_salary) - lag(avg(avg_salary),2) OVER (PARTITION BY industry ORDER BY salary_year))/lag(avg(avg_salary),2) OVER (PARTITION BY industry ORDER BY salary_year)),4)*100 diff_per_salary2
FROM t_vojtech_derner_project_sql_primary_final AS tp
JOIN t_vojtech_derner_project_sql_secondary_final AS ts ON tp.salary_year = ts.YEAR
WHERE ts.country = 'Czech Republic'
GROUP BY tp.salary_year)
SELECT
*,
lead(diff_per_price2) OVER (ORDER BY salary_year)
FROM w2;
/*WHERE diff_per_price IS NOT NULL
	OR diff_per_salary IS NOT NULL
    OR diff_per_GDP IS NOT NULL 
*/
-- WHERE diff_per_price IS NOT NULL
	-- OR diff_per_salary IS NOT NULL
-- 	OR diff_per_GDP IS NOT NULL ;


