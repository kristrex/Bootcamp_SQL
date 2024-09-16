WITH cte_andrey_visited AS (
    SELECT pizzeria.name AS pizzeria_name 
    FROM pizzeria
    INNER JOIN person_visits
    ON pizzeria_id = pizzeria.id
    INNER JOIN person
    ON person.id = person_id
    WHERE person.name = 'Andrey'
),
cte_andrey_ordered AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    INNER JOIN menu
    ON pizzeria.id = pizzeria_id
    INNER JOIN person_order
    ON menu_id = menu.id
    INNER JOIN person
    ON person_id = person.id
    WHERE person.name = 'Andrey'
)
SELECT * FROM cte_andrey_visited
EXCEPT
SELECT * FROM cte_andrey_ordered
ORDER BY pizzeria_name;

  WITH cte AS (SELECT pizzeria_id
                 FROM person_visits pv
                          JOIN person p
                          ON p.id = pv.person_id
                WHERE name = 'Andrey'
               EXCEPT
               SELECT pizzeria_id
                 FROM person_order po
                          JOIN person p
                          ON p.id = po.person_id
                          JOIN menu m
                          ON m.id = po.menu_id
                WHERE name = 'Andrey')
SELECT name AS pizzeria_name
  FROM pizzeria
           JOIN cte
           ON pizzeria.id = pizzeria_id
 ORDER BY pizzeria_name