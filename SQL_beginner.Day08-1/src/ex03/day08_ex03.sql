--Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';