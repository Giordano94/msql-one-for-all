-- desafio 5

SELECT 
    sng.song_name AS cancao, COUNT(plh.song_id) AS reproducoes
FROM
    song AS sng
        INNER JOIN
    playback_history AS plh ON sng.song_id = plh.song_id
GROUP BY sng.song_name
ORDER BY reproducoes DESC , sng.song_name
LIMIT 2;
