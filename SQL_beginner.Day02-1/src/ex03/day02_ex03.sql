WITH date_series AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day') as date
)
SELECT date::date AS missing_date 
FROM date_series
FULL JOIN (select * FROM person_visits where (person_id = 1 or person_id = 2)) AS T
ON date = T.visit_date
where T.visit_date IS NULL
ORDER BY missing_date;