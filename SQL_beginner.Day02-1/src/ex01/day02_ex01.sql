SELECT date::date AS missing_date 
FROM generate_series('2022-01-01'::date, '2022-01-10', '1 day') as date
FULL JOIN (select * FROM person_visits where (person_id = 1 or person_id = 2)) AS T
ON date = T.visit_date
where T.visit_date IS NULL
ORDER BY missing_date;