CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE 
SELECT pizzeria_id, pizza_name FROM menu
WHERE pizzeria_id = 3 and pizza_name = 'cheese pizza'