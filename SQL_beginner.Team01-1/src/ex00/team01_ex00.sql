WITH bnc AS (
    SELECT b.user_id, b.currency_id, b.type, SUM(money) AS volume 
    FROM balance AS b
    GROUP BY b.user_id, b.type, b.currency_id
), 
cur AS (
    SELECT c.id, c.name AS currency_name, (
        SELECT rate_to_usd 
        FROM currency 
        WHERE id = c.id 
        ORDER BY updated DESC 
        LIMIT 1
    ) AS last_rate_to_usd
    FROM currency AS c
)
SELECT DISTINCT COALESCE(usr.name, 'not defined') AS name, COALESCE(usr.lastname, 'not defined') AS lastname, bnc.type, bnc.volume,
COALESCE(cur.currency_name, 'not defined') AS currency_name, COALESCE(cur.last_rate_to_usd, 1) AS last_rate_to_usd, 
(bnc.volume * COALESCE(cur.last_rate_to_usd, 1)) AS total_volume_in_usd 
FROM "user" AS usr
FULL JOIN bnc 
ON bnc.user_id = usr.id
FULL JOIN cur
ON cur.id = bnc.currency_id
ORDER BY name DESC, lastname, bnc.type;