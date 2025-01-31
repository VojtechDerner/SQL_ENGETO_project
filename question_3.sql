-- Q3: Která kategorie potravin zdražuje nejpomaleji 
-- (je u ní nejnižší percentuální meziroční nárůst)?

CREATE OR REPLACE VIEW v2_vojtech_derner AS (
SELECT 
	foodstuff,
	salary_year, 
	round(avg(avg_price),2) avg_price2,
	round(lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year),2) AS prev,
	round(((avg(avg_price) - lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year))/lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year)),4)*100 diff_percentage
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
GROUP BY foodstuff, salary_year
);

SELECT * FROM v2_vojtech_derner;

SELECT
	foodstuff,
	salary_year,
	min(diff_percentage) minimum
FROM v2_vojtech_derner
GROUP BY foodstuff, salary_year
HAVING min(diff_percentage) IS NOT NULL 
ORDER BY minimum
LIMIT 10;

SELECT
	foodstuff,
	round (avg(diff_percentage),2) diff_avg_per
FROM v2_vojtech_derner
GROUP BY foodstuff
ORDER BY diff_avg_per;