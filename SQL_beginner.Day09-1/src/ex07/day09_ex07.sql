CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
    RETURNS NUMERIC as $BODY$
    DECLARE
        minimum NUMERIC := arr[1];
        i INT := 2;
    BEGIN
        WHILE i <= array_length(arr, 1) LOOP
            IF arr[i] < minimum THEN
                minimum := arr[i];
            END IF;
            i := i + 1;
        END LOOP;
        RETURN minimum;
    END;
    $BODY$
    LANGUAGE PLPGSQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);