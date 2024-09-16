WITH cte_pz1 AS (
    SELECT mn1.pizza_name, pz1.name AS pizzeria_name_1, price, pz1.id 
    FROM pizzeria AS pz1
    INNER JOIN menu AS mn1
    ON mn1.pizzeria_id = pz1.id
    ORDER BY pizzeria_name_1
),
cte_pz2 AS (
    SELECT mn2.pizza_name, pz2.name AS pizzeria_name_2, price, pz2.id 
    FROM pizzeria AS pz2
    INNER JOIN menu AS mn2
    ON mn2.pizzeria_id = pz2.id
    ORDER BY pizzeria_name_2
)
SELECT cte_pz1.pizza_name, cte_pz1.pizzeria_name_1, cte_pz2.pizzeria_name_2, cte_pz1.price 
FROM cte_pz1
INNER JOIN cte_pz2
ON (cte_pz1.pizza_name = cte_pz2.pizza_name)
    and (cte_pz1.price = cte_pz2.price)
    and (cte_pz1.id > cte_pz2.id)
ORDER BY cte_pz1.pizza_name;