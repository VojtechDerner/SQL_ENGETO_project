-- Q2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první 
-- a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
foodstuff,
salary_year,
round(avg(avg_price),2) price,
round(avg(avg_salary),2) salary,
FLOOR(avg(avg_salary)/avg(avg_price)) ratio 
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
WHERE salary_year IN (2006,2018)
AND foodstuff LIKE 'Mléko polotučné pasterované'
GROUP BY foodstuff, salary_year
UNION 
SELECT 
foodstuff,
salary_year,
round(avg(avg_price),2) price,
round(avg(avg_salary),2) salary,
FLOOR(avg(avg_salary)/avg(avg_price)) ratio 
FROM t_vojtech_derner_project_sql_primary_final AS tvdpspf 
WHERE salary_year IN (2006,2018)
AND foodstuff LIKE 'Chléb konzumní kmínový'
GROUP BY foodstuff, salary_year
;
