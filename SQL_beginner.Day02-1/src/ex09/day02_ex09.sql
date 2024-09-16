WITH cheese_order AS (
    SELECT name FROM person AS p
        JOIN person_order
        ON p.id = person_id
        JOIN menu
        ON menu_id = menu.id 
    WHERE (gender = 'female')
    and menu.pizza_name = 'cheese pizza'
),
    pepperoni_order AS (
    SELECT name FROM person AS p
        JOIN person_order
        ON p.id = person_id
        JOIN menu
        ON menu_id = menu.id 
    WHERE (gender = 'female')
    and menu.pizza_name = 'pepperoni pizza'
)
SELECT name FROM cheese_order
INTERSECT
SELECT name FROM pepperoni_order
ORDER BY name;