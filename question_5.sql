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