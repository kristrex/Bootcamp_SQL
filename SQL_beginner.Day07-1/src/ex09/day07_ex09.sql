SELECT address, ROUND(MAX(age) - (MIN(age)::numeric/MAX(AGE)), 2) AS formula, ROUND(AVG(age), 2) AS average,
ROUND(MAX(age) - (MIN(age)/MAX(AGE)), 2) > ROUND(AVG(age), 2) as comparison
 FROM person
 GROUP BY address
 ORDER BY address