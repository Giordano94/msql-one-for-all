  -- desafio 7

SELECT 
    art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(flat.user_id) AS seguidores
FROM
    artist AS art
        INNER JOIN
    album AS alb ON art.artist_id = alb.artist_id
        INNER JOIN
    following_artist AS flat ON flat.artist_id = art.artist_id
GROUP BY art.artist_name , alb.album_name
ORDER BY COUNT(flat.user_id) DESC , art.artist_name , alb.album_name;
