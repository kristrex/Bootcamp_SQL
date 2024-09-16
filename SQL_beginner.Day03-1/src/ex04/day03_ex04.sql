WITH cte_women_order AS (
    SELECT pizzeria.name AS pizzeria_name, person.name
        FROM person_order
        INNER JOIN menu
        ON menu.id = person_order.menu_id
        INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
        INNER JOIN person
        ON person.id = person_id
    WHERE gender = 'female'
),
cte_men_order AS (
    SELECT pizzeria.name AS pizzeria_name, person.name
        FROM person_order
        INNER JOIN menu
        ON menu.id = person_order.menu_id
        INNER JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
        INNER JOIN person
        ON person.id = person_id
    WHERE gender = 'male'
)
SELECT pizzeria_name FROM cte_women_order
EXCEPT
SELECT pizzeria_name FROM cte_men_order
UNION
(SELECT pizzeria_name FROM cte_men_order
EXCEPT
SELECT pizzeria_name FROM cte_women_order)
ORDER BY pizzeria_name;