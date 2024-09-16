WITH ex1 AS(
    (SELECT menu.id AS menu_id 
        FROM menu)
    EXCEPT
    (SELECT menu_id 
        FROM person_order)
)

SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
    INNER JOIN pizzeria
    ON pizzeria.id = pizzeria_id
    INNER JOIN ex1
    ON menu_id = menu.id

ORDER BY pizza_name, price;