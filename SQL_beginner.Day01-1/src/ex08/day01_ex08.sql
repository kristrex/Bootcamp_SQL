SELECT order_date, (name || ' (age:' || age || ')') AS person_information 
FROM person_order
NATURAL JOIN (select id as person_id, name, age from person)
ORDER BY order_date, person_information