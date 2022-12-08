

SELECT 
    usr.user_name AS usuario,
    COUNT(plh.song_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(sng.duration_song / 60), 2) AS total_minutos
FROM
    user AS usr
        INNER JOIN
    playback_history AS plh ON usr.user_id = plh.user_id
        INNER JOIN
    song AS sng ON plh.song_id = sng.song_id
GROUP BY usr.user_id
ORDER BY usr.user_name;
