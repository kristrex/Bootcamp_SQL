WITH gender_visits AS (
    SELECT 
        pv.pizzeria_id,
        p.gender,
        COUNT(*) AS visit_count
    FROM 
        person_visits pv
    JOIN 
        person p ON pv.person_id = p.id
    GROUP BY 
        pv.pizzeria_id, p.gender
),
cte_women_visits AS (
    SELECT pizzeria.name AS pizzeria_name, gender_visits.visit_count
        FROM gender_visits
        INNER JOIN pizzeria
        ON pizzeria.id = gender_visits.pizzeria_id
    WHERE gender = 'female'
),
cte_men_visits AS (
    SELECT pizzeria.name AS pizzeria_name, gender_visits.visit_count
        FROM gender_visits
        INNER JOIN pizzeria
        ON pizzeria.id = gender_visits.pizzeria_id
    WHERE gender = 'male'
),
more_gender_visits AS (
    SELECT DISTINCT mv.pizzeria_name
    FROM cte_men_visits mv
        JOIN cte_women_visits wv
        ON wv.pizzeria_name = mv.pizzeria_name
    WHERE mv.visit_count != wv.visit_count
)
SELECT pizzeria_name
FROM more_gender_visits
ORDER BY pizzeria_name;