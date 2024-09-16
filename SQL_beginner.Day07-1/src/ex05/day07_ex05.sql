SELECT DISTINCT p.name FROM person_visits AS pv
JOIN person AS p
ON p.id = pv.person_id
ORDER BY name