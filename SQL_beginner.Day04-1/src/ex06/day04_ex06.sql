CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
SELECT pizzeria.name AS pizzeria_name 
FROM pizzeria JOIN person_visits AS pv
ON pv.pizzeria_id = pizzeria.id
JOIN person
ON person_id = person.id
JOIN menu
ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy'
    AND visit_date = '2022-01-08'
    AND price < 800