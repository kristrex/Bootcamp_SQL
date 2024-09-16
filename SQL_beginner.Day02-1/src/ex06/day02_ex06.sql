WITH need_order AS (
    SELECT * FROM person_order
    INNER JOIN person
    ON (person_id = person.id) AND (person.name IN ('Denis', 'Anna'))
)

SELECT pizza_name, pizzeria.name AS pizzeria_name FROM need_order
INNER JOIN menu
ON menu_id = menu.id
INNER JOIN pizzeria
ON pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria.name;