WITH visit_kate AS (
    SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date 
    FROM person_visits
        INNER JOIN person
        ON person_id = person.id
        INNER JOIN pizzeria
        ON person_visits.pizzeria_id = pizzeria.id
        INNER JOIN menu
        ON menu.pizzeria_id = pizzeria.id
    WHERE (person.name = 'Kate') 
        AND (price BETWEEN 800 and 1000)
)

SELECT * FROM visit_kate
ORDER BY pizza_name, price, pizzeria_name;