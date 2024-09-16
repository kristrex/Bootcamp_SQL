SELECT name, COUNT(*) as count_of_visits FROM person_visits
JOIN person
ON person_id = person.id
GROUP BY name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;