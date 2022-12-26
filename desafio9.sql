-- desafio 9

SELECT 
    COUNT(song_id) AS quantidade_musicas_no_historico
FROM
    playback_history AS plh
        INNER JOIN
    user AS usr ON plh.user_id = usr.user_id
WHERE
    usr.user_name = 'Barbara Liskov';
