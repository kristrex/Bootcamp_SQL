SELECT pz.name, COUNT(*) AS count_of_orders, ROUND(AVG(price)::numeric, 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price 
FROM person_order po
JOIN menu AS m
ON po.menu_id = m.id
JOIN pizzeria AS pz
ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY pz.name
