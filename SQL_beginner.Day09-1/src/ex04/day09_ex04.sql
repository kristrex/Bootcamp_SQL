CREATE FUNCTION fnc_persons_female()
    RETURNS SETOF person AS $BODY$
    BEGIN
        RETURN QUERY
        SELECT *
        FROM person
        WHERE gender = 'female';
    END;
    $BODY$
    LANGUAGE PLPGSQL;

CREATE FUNCTION fnc_persons_male()
    RETURNS SETOF person AS $BODY$
    BEGIN
        RETURN QUERY
        SELECT *
        FROM person
        WHERE gender = 'male';
    END;
    $BODY$
    LANGUAGE PLPGSQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();