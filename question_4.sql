-- Q4: Existuje rok, ve kterém byl meziroční nárůst cen potravin 
-- výrazně vyšší než růst mezd (větší než 10 %)?

CREATE OR REPLACE VIEW v3_vojtech_derner AS (
SELECT 
	salary_year,
	round(((avg(avg_price) - lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_per_price,
	round(((avg(avg_salary) - lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year))/lag(avg(avg_salary)) OVER (PARTITION BY industry ORDER BY salary_year)),4)*100 diff_per_salary 
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
GROUP BY salary_year
)

SELECT 
	*,
	diff_per_price - diff_per_salary diff_diff
FROM v3_vojtech_derner
WHERE 
	diff_per_price IS NOT NULL
	OR diff_per_salary IS NOT NULL
	-- HAVING abs(diff_diff) > 10
;



