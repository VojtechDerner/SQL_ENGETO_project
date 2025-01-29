-- Q3: Která kategorie potravin zdražuje nejpomaleji 
-- (je u ní nejnižší percentuální meziroční nárůst)?

SELECT * FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf ;

SELECT 
foodstuff,
avg(avg_price) avg_price2,
salary_year, 
lag(avg(avg_price)) OVER (PARTITION BY foodstuff ORDER BY salary_year) AS ratio
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
GROUP BY foodstuff, salary_year;