-- desafio 4
SELECT 
    usr.user_name AS usuario,
    IF(MAX(YEAR(plh.reproduction_date)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    user AS usr
        INNER JOIN
    playback_history AS plh ON usr.user_id = plh.user_id
GROUP BY usr.user_name
ORDER BY usr.user_name;

