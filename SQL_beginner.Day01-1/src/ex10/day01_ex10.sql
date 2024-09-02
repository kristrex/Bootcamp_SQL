select person.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name FROM person_order
INNER JOIN person
ON person.id = person_id
INNER JOIN menu
ON menu_id = menu.id
INNER JOIN pizzeria
ON pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name