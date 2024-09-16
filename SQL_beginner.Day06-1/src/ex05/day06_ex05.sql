COMMENT ON TABLE person_discounts IS 'Данная таблица необходима для расчета и хранения персональной скидки каждого клиента';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ для однозначной идентификации записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ для связи с таблицей person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ для связи с таблицей pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Поле в котором хранятся скидки для каждого заказа человека';