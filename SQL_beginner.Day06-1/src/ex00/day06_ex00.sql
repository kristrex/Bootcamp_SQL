CREATE TABLE person_discounts (
    id BIGINT primary key,
    person_id BIGINT,
    pizzeria_id BIGINT,
    discount NUMERIC,
    constraint fk_person_discount_person_id foreign key (person_id) references person(id),
    constraint fk_person_discount_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
);