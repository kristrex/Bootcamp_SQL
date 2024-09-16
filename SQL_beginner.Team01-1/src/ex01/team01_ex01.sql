WITH temp AS (
    SELECT 
        b.user_id,
        c.name AS currency_name, 
        (SELECT rate_to_usd 
         FROM currency AS cur
         WHERE cur.id = b.currency_id AND cur.updated <= b.updated
         ORDER BY cur.updated DESC
         LIMIT 1) AS past_cur,
        (SELECT rate_to_usd 
         FROM currency AS cur
         WHERE cur.id = b.currency_id AND cur.updated >= b.updated
         ORDER BY cur.updated ASC
         LIMIT 1) AS fut_cur,
        b.money
    FROM balance AS b
    JOIN currency AS c ON b.currency_id = c.id
)

SELECT DISTINCT
    COALESCE(u.name, 'not defined') AS name, 
    COALESCE(u.lastname, 'not defined') AS lastname,
    currency_name, 
    COALESCE(past_cur, fut_cur) * temp.money AS currency_in_usd 
FROM temp
LEFT JOIN "user" AS u ON temp.user_id = u.id
ORDER BY 
    name DESC, 
    lastname, 
    currency_name;