CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER
    AS
    $BODY$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES (
                'I',
                NEW.id,
                NEW.name,
                NEW.age,
                NEW.gender,
                NEW.address
            );
        END IF;
        IF TG_OP = 'UPDATE' THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES (
                'U',
                OLD.id,
                OLD.name,
                OLD.age,
                OLD.gender,
                OLD.address
            );
        END IF;
        IF TG_OP = 'DELETE' THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES (
                'D',
                OLD.id,
                OLD.name,
                OLD.age,
                OLD.gender,
                OLD.address
            );
        END IF;
        IF TG_OP = 'DELETE' OR TG_OP = 'UPDATE' THEN
            RETURN OLD;
        ELSE
            RETURN NEW;
        END IF;
    END;
    $BODY$
    LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_audit
    AFTER DELETE OR UPDATE OR INSERT on person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_audit();

DROP TRIGGER trg_person_delete_audit on person;
DROP TRIGGER trg_person_update_audit on person;
DROP TRIGGER trg_person_insert_audit on person;

DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_insert_audit();

DELETE FROM person_audit;

INSERT INTO person(id, name, age, gender, address) 
    VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person 
    SET name = 'Bulat' WHERE id = 10; 
UPDATE person 
    SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;