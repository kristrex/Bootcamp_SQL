CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
pprice INT DEFAULT 500, pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE (
        pizzeria_name VARCHAR
    ) AS $BODY$
    BEGIN
        RETURN QUERY
        SELECT pz.name
        FROM person AS p
        JOIN person_visits AS pv
        ON p.id = pv.person_id
        JOIN pizzeria pz
        ON pz.id = pv.pizzeria_id
        JOIN menu m
        ON pz.id = m.pizzeria_id  
        WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
    END;
    $BODY$
    LANGUAGE PLPGSQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');