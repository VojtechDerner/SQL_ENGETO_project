# SQL_ENGETO_project
Tento projekt je z�v�rem SQL ��sti kurzu Datov� akademie od spole�nosti ENGETO.
Na z�klad� p�ilo�en�ho zad�n� jsou vypracov�ny dv� tabulky z dat od Engeta, kter� v�ak vych�zej� z�otev�en�ch dat �R: https://data.gov.cz/datov%C3%A9-sady 
N�e je odpov�zeno na p�t p�edem zadan�ch v�zkumn�ch ot�zek.
## Prim�rn� a sekund�rn� tabulka
Nejprve jsem vytvo�il tabulku t_vojtech_derner_project_SQL_primary_final, kter� obsahuje sloupce industry, avg_salary, foodstuff a avg_price, p�i�em� obsahuj� pouze data pro shodn� roky, kter� jsou od roku 2006 do roku 2018.
Druh� tabulka t_vojtech_derner_project_SQL_secondary_final obsahuje sloupce country, year, GDP, gini a population. Takt� jsou vybran� data pouze pro shodn� roky 2006 a� 2018 a lokace je omezena na Evropu.
## Q1: Rostou v pr�b�hu let mzdy ve v�ech odv�tv�ch, nebo v n�kter�ch klesaj�?
Ve sledovan�ch letech rostou mzdy ka�d� rok pouze v�odv�tv� Administrativn� a podp�rn� �innosti, Doprava a skladov�n�, Ostatn� �innosti, Zdravotnictv� a soci�ln� p��e a Zpracovatelsk� pr�mysl. 
Ve v�ech ostatn�ch odv�tv�ch alespo� jeden rok klesaly. Nejv�ce kr�t, celkov� �ty�ikr�t, klesaly mzdy v�odv�tv� T�ba a dob�v�n�. Z�pohledu rok� byl nejhor��m rok 2013, p�i kter�m klesly mzdy v�10 odv�tv�ch. 
## Q2: Kolik je mo�n� si koupit litr� ml�ka a kilogram� chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?
V�roce 2006 �lo koupit za celou pr�m�rnou hrubou mzdu 1�261 kg chleba, p�i�em� v�roce 2018 u� to bylo 1�319 kg. Podobn� to vypadalo i u ml�ka. V�roce 2006 �lo koupit za celou pr�m�rnou hrubou mzdu 1�408 litr� ml�ka. V�roce 2018 to bylo 1�613 litr�. U obou dvou potravin do�lo ke zv��en�, tedy kupn� s�la obyvatel se, dle t�chto dvou polo�ek, zv��ila.
## Q3: Kter� kategorie potravin zdra�uje nejpomaleji (je u n� nejni��� percentu�ln� meziro�n� n�r�st?
Nejni��� procentu�ln� meziro�n� n�r�st, v�tomto p��pad� pokles, cen byl u polo�ky Rajsk� jablka �erven� kulat� v�roce 2007 a to o -30,28 %.
Za cel� sledovan�m obdob� v�ak m�la nejni��� n�r�st (pokles) polo�ka Cukr krystalov�, u kter� se pr�m�rn� ro�n� sni�ovala cena o -1,92 %.
## Q4: Existuje rok, ve kter�m byl meziro�n� n�r�st cen potravin v�razn� vy��� ne� r�st mezd (v�t�� ne� 10 %)?
Ne. V���dn�m roce nebyl procentu�ln� meziro�n� r�st cen potravin vy��� ne� r�st mezd o v�ce ne� 10 %. Nejbl�e k�tomu m�l rok 2013, kde rozd�l r�stu cen potravin a r�stu mezd �inil 6,66 %.
## Q5: M� v��ka HDP vliv na zm�ny ve mzd�ch a cen�ch potravin? Neboli, pokud HDP vzroste v�razn�ji v jednom roce, projev� se to na cen�ch potravin �i mzd�ch ve stejn�m nebo n�sleduj�c�m roce v�razn�j��m r�stem?
Vliv zm�ny HDP na zm�ny v�cen�ch potravin a mzd�ch nen� jasn� prokazateln�. Nap��klad v�roce 2012 byla meziro�n� zm�na HDP -0,79 %, ale ceny ve stejn�m obdob� rostly o 6,73 % a v�porovn�n� s�n�sleduj�c�m rokem od zm�ny dokonce o 12,17 %. Naopak v�roce 2017 byla zm�na HPD 5,17 %, mzdy rostly o 6,4 % a n�sleduj�c� rok od zm�ny o 14,43 %. Nen� tedy na prvn� pohled z�ejm�, zda se m��e hypot�za potvrdit �i vyvr�tit. 
V�sledky by bylo vhodn� podrobit statistick�mu testu, kter� by to jasn� ur�il.
