DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender TEXT default 'female')
    RETURNS SETOF person AS $BODY$
    BEGIN
        RETURN QUERY
        SELECT *
        FROM person
        WHERE gender = pgender;
    END;
    $BODY$
    LANGUAGE PLPGSQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();