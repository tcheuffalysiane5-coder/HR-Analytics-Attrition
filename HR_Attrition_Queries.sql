Total des employés
SELECT COUNT(*) AS Total_employes 
FROM "HR_ employee attrition";

-- 2. Total des départs
SELECT COUNT(*) AS Total_departs 
FROM "HR_ employee attrition"
WHERE Attrition = 'Yes';

-- 3. Attrition par département
SELECT Department, 
COUNT(*) AS Total_employes,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Departs,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 1) AS Taux_attrition
FROM "HR_ employee attrition"
GROUP BY Department;

-- 4. Attrition par genre
SELECT gender,
COUNT(*) AS Total_employes,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Departs,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 1) AS Taux_attrition
FROM "HR_ employee attrition"
GROUP BY gender;

-- 5. Attrition selon les heures supplémentaires
SELECT overtime,
COUNT(*) AS Total_employes,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Departs,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 1) AS Taux_attrition
FROM "HR_ employee attrition"
GROUP BY overtime;

-- 6. Salaire moyen : départs vs restants
SELECT Attrition,
ROUND(AVG(monthly_income), 0) AS Salaire_moyen
FROM "HR_ employee attrition"
GROUP BY Attrition;

-- 7. Attrition selon la satisfaction au travail
SELECT Job_satisfaction,
COUNT(*) AS Total_employes,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Departs,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 1) AS Taux_attrition
FROM "HR_ employee attrition"
GROUP BY Job_satisfaction
ORDER BY Job_satisfaction
