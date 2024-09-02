SELECT t.action_date, name
FROM (
SELECT order_date AS action_date, person_id FROM person_order
INTERSECT
SELECT visit_date AS action_date, person_id FROM person_visits
) AS t
INNER JOIN person
ON t.person_id = person.id
ORDER BY action_date ASC, name DESC