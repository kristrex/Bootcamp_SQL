INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
    (SELECT MAX(id)+1 FROM menu),
    (SELECT DISTINCT pizzeria_id FROM menu
        JOIN pizzeria
        ON pizzeria_id = pizzeria.id
    WHERE pizzeria.name = 'Dominos'),
    'sicilian pizza',
    900
);
