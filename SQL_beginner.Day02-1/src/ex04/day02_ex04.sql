SELECT pizza_name, name AS pizzeria_name, price 
FROM (select * FROM menu WHERE pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza')
INNER JOIN pizzeria
ON pizzeria.id = pizzeria_id
ORDER BY pizza_name, name;