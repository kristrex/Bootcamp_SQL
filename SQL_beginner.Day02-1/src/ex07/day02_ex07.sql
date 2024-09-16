WITH need_visits AS (
    SELECT pizzeria_id FROM person_visits
    INNER JOIN person
    ON (person_id = person.id) AND (person.name = 'Dmitriy') and (visit_date = '2022-01-08')
)

SELECT DISTINCT pizzeria.name AS pizzeria_name FROM need_visits
INNER JOIN pizzeria
ON need_visits.pizzeria_id = pizzeria.id
INNER JOIN menu
ON price < 800; 