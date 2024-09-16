SELECT p.name, COUNT(*) as count_of_visits FROM person_visits AS pv
JOIN person AS p
ON p.id = pv.person_id
GROUP BY name
HAVING COUNT(*) > 3