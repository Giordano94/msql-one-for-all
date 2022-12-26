-- desafio 6

SELECT 
    FORMAT(MIN(upln.plan_value), 2) AS faturamento_minimo,
    FORMAT(MAX(upln.plan_value), 2) AS faturamento_maximo,
    FORMAT(AVG(upln.plan_value), 2) AS faturamento_medio,
    FORMAT(SUM(upln.plan_value), 2) AS faturamento_total
FROM
    user_plan AS upln
        INNER JOIN
    user AS usr ON upln.plan_id = usr.plan_id;
