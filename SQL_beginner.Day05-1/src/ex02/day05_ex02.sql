CREATE INDEX idx_person_name ON person (UPPER(name));

SET ENABLE_SEQSCAN TO off;

EXPLAIN ANALYZE 
    SELECT name FROM person
    WHERE UPPER(name) = UPPER('Kate');