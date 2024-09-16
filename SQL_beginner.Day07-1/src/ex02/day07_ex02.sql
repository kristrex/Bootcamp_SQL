(SELECT pz.name, COUNT(*) as count, 'order' as action_type FROM person_order
JOIN menu m
ON menu_id = m.id
JOIN pizzeria pz
ON pz.id = m.pizzeria_id 
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT pz.name, COUNT(*) as count, 'visit' as action_type FROM person_visits pv
JOIN pizzeria pz
ON pz.id = pv.pizzeria_id 
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC