/* Q5: Má výška HDP vliv na změny ve mzdách a cenách potravin? 
 	Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to
 	na cenách potravin či mzdách ve stejném nebo násdujícím roce 
 	výraznějším růstem?
*/

CREATE OR REPLACE VIEW v4_vojtech_derner AS (
SELECT  
	salary_year,
	round(((ts.GDP - lag(ts.GDP) OVER (PARTITION BY ts.country ORDER BY ts.year))/lag(ts.GDP) OVER (PARTITION BY ts.country ORDER BY ts.year)),4)*100 diff_per_GDP,
	round(((avg(avg_price) - lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_per_price,
	round(((avg(avg_price) - lag(avg(avg_price),2) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price),2) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_per_price2,
	round(((avg(avg_salary) - lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year))/lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year)),4)*100 diff_per_salary,
	round(((avg(avg_salary) - lag(avg(avg_salary),2) OVER (PARTITION BY industry ORDER BY salary_year))/lag(avg(avg_salary),2) OVER (PARTITION BY industry ORDER BY salary_year)),4)*100 diff_per_salary2
FROM t_vojtech_derner_project_sql_primary_final AS tp
JOIN t_vojtech_derner_project_sql_secondary_final AS ts 
	ON tp.salary_year = ts.YEAR
WHERE ts.country = 'Czech Republic'
GROUP BY tp.salary_year
);

SELECT * FROM v4_vojtech_derner;

SELECT
	salary_year,
	diff_per_GDP,
	diff_per_price,
	lead(diff_per_price2) OVER (ORDER BY salary_year) diff_price_2y,
	diff_per_salary,
	lead(diff_per_salary2) OVER	(ORDER BY salary_year) diff_salary_2y
FROM v4_vojtech_derner
WHERE diff_per_price IS NOT NULL
	OR diff_per_salary IS NOT NULL
    OR diff_per_GDP IS NOT NULL;



