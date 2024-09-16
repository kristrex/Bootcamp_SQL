SELECT p.name, m.pizza_name, m.price, (price - price * (discount/100)) as discount_price, pz.name AS pizzeria_name
FROM person p
JOIN person_order po
ON p.id = po.person_id
JOIN menu m
ON m.id = po.menu_id
JOIN pizzeria pz
ON pz.id = m.pizzeria_id
JOIN person_discounts pd
ON pd.person_id = po.person_id and pd.pizzeria_id = m.pizzeria_id
ORDER BY name, pizza_name