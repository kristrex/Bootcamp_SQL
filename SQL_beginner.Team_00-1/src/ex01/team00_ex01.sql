WITH RECURSIVE
    paths AS (
        SELECT
            point1,
            point2,
            point1 || ',' || point2 AS tour,
            cost AS total_cost
        FROM
            graph
        WHERE
            point1 = 'A'
        UNION ALL
        SELECT
            g.point1,
            g.point2,
            p.tour || ',' || g.point2 AS tour,
            p.total_cost + g.cost AS total_cost
        FROM
            paths AS p
        JOIN
            graph AS g ON p.point1 <> g.point2 AND p.point2 = g.point1
        WHERE
            LENGTH(p.tour) < (SELECT COUNT(DISTINCT point1) * 2 FROM graph)
)

SELECT
    total_cost,
    '{' || p.tour || '}' AS tour
FROM
    paths AS p
WHERE
    LENGTH(p.tour) = 9
    AND p.point2 = 'A'
ORDER BY total_cost, tour;