CREATE VIEW v_price_with_discount AS
SELECT person.name, pizza_name, price, (price - price * 0.1)::int AS discount_price
FROM menu JOIN person_order
ON menu.id = menu_id
JOIN person
ON person_id = person.id
ORDER BY person.name, menu.pizza_name