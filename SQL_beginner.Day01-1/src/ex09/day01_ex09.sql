SELECT name FROM pizzeria
WHERE name NOT IN (
SELECT DISTINCT name FROM pizzeria
INNER JOIN person_visits
ON pizzeria_id = pizzeria.id);

SELECT name FROM pizzeria
WHERE not EXISTS (
SELECT DISTINCT pizzeria.name FROM person_visits 
WHERE pizzeria_id = pizzeria.id);