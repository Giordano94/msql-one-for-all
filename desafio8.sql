  -- desafio 8

SELECT 
    art.artist_name AS artista, alb.album_name AS album
FROM
    artist AS art
        INNER JOIN
    album AS alb ON art.artist_id = alb.artist_id
WHERE
    art.artist_name = 'Elis Regina';
