alter table person_discounts add constraint ch_nn_person_id check ( person_id is NOT NULL );
alter table person_discounts add constraint ch_nn_pizzeria_id check ( pizzeria_id is NOT NULL );
alter table person_discounts add constraint ch_nn_discount check ( discount is NOT NULL );
ALTER TABLE person_discounts ALTER COLUMN discount SET DEFAULT 0;
alter table person_discounts add constraint ch_range_discount check ( discount BETWEEN 0 and 100);