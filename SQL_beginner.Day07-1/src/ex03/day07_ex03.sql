with table_vis_ord AS ((SELECT pz.name, COUNT(*) as count FROM person_order
JOIN menu m
ON menu_id = m.id
JOIN pizzeria pz
ON pz.id = m.pizzeria_id 
GROUP BY pz.name
ORDER BY count DESC)
UNION ALL
(SELECT pz.name, COUNT(*) as count FROM person_visits pv
JOIN pizzeria pz
ON pz.id = pv.pizzeria_id 
GROUP BY pz.name
ORDER BY count DESC)
)
SELECT name, SUM(count) as count FROM table_vis_ord
GROUP BY name
ORDER BY count DESC, name asc;