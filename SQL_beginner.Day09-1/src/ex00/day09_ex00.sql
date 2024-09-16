CREATE TABLE person_audit (
    created TIMESTAMP with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    row_id BIGINT not null,
    name VARCHAR,
    age INT,
    gender VARCHAR,
    address VARCHAR,
    constraint ch_type_event check ( type_event in ('I','D', 'U') )
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER
    AS
    $$
    BEGIN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        SELECT (
            NEW.*
        );
        RETURN NEW;
    END;
    $$
    LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;