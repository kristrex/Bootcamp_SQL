CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci_number INTEGER) AS $BODY$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    temp INTEGER := 0;
BEGIN
    IF pstop <= 0 THEN
        RETURN;
    END IF;

    IF a < pstop THEN
        RETURN QUERY SELECT a;
    END IF;

    WHILE b < pstop LOOP
        RETURN QUERY SELECT b;
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;

    RETURN;
END;
$BODY$ 
LANGUAGE plpgsql;

select * from fnc_fibonacci(20);
select * from fnc_fibonacci();