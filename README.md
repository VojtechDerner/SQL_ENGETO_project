# SQL_ENGETO_project
Tento projekt je závìrem SQL èásti kurzu Datová akademie od spoleènosti ENGETO.
Na základì pøiloženého zadání jsou vypracovány dvì tabulky z dat od Engeta, která však vycházejí z otevøených dat ÈR: https://data.gov.cz/datov%C3%A9-sady 
Níže je odpovìzeno na pìt pøedem zadaných výzkumných otázek.
## Primární a sekundární tabulka
Nejprve jsem vytvoøil tabulku t_vojtech_derner_project_SQL_primary_final, která obsahuje sloupce industry, avg_salary, foodstuff a avg_price, pøièemž obsahují pouze data pro shodné roky, které jsou od roku 2006 do roku 2018.
Druhá tabulka t_vojtech_derner_project_SQL_secondary_final obsahuje sloupce country, year, GDP, gini a population. Taktéž jsou vybraná data pouze pro shodné roky 2006 až 2018 a lokace je omezena na Evropu.
## Q1: Rostou v prùbìhu let mzdy ve všech odvìtvích, nebo v nìkterých klesají?
Ve sledovaných letech rostou mzdy každý rok pouze v odvìtví Administrativní a podpùrné èinnosti, Doprava a skladování, Ostatní èinnosti, Zdravotnictví a sociální péèe a Zpracovatelský prùmysl. 
Ve všech ostatních odvìtvích alespoò jeden rok klesaly. Nejvíce krát, celkovì ètyøikrát, klesaly mzdy v odvìtví Tìžba a dobývání. Z pohledu rokù byl nejhorším rok 2013, pøi kterém klesly mzdy v 10 odvìtvích. 
## Q2: Kolik je možné si koupit litrù mléka a kilogramù chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roce 2006 šlo koupit za celou prùmìrnou hrubou mzdu 1 261 kg chleba, pøièemž v roce 2018 už to bylo 1 319 kg. Podobnì to vypadalo i u mléka. V roce 2006 šlo koupit za celou prùmìrnou hrubou mzdu 1 408 litrù mléka. V roce 2018 to bylo 1 613 litrù. U obou dvou potravin došlo ke zvýšení, tedy kupní síla obyvatel se, dle tìchto dvou položek, zvýšila.
## Q3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroèní nárùst?
Nejnižší procentuální meziroèní nárùst, v tomto pøípadì pokles, cen byl u položky Rajská jablka èervená kulatá v roce 2007 a to o -30,28 %.
Za celé sledovaném období však mìla nejnižší nárùst (pokles) položka Cukr krystalový, u které se prùmìrnì roènì snižovala cena o -1,92 %.
## Q4: Existuje rok, ve kterém byl meziroèní nárùst cen potravin výraznì vyšší než rùst mezd (vìtší než 10 %)?
Ne. V žádném roce nebyl procentuální meziroèní rùst cen potravin vyšší než rùst mezd o více než 10 %. Nejblíže k tomu mìl rok 2013, kde rozdíl rùstu cen potravin a rùstu mezd èinil 6,66 %.
## Q5: Má výška HDP vliv na zmìny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výraznìji v jednom roce, projeví se to na cenách potravin èi mzdách ve stejném nebo následujícím roce výraznìjším rùstem?
Vliv zmìny HDP na zmìny v cenách potravin a mzdách není jasnì prokazatelný. Napøíklad v roce 2012 byla meziroèní zmìna HDP -0,79 %, ale ceny ve stejném období rostly o 6,73 % a v porovnání s následujícím rokem od zmìny dokonce o 12,17 %. Naopak v roce 2017 byla zmìna HPD 5,17 %, mzdy rostly o 6,4 % a následující rok od zmìny o 14,43 %. Není tedy na první pohled zøejmé, zda se mùže hypotéza potvrdit èi vyvrátit. 
Výsledky by bylo vhodné podrobit statistickému testu, který by to jasnì urèil.
