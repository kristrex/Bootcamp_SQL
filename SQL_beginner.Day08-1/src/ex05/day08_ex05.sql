--Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

--Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO pizzeria
VALUES (10, 'Kazan Pizza', 5);
COMMIT;
SELECT SUM(rating) FROM pizzeria;