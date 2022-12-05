USE SpotifyClone;

SELECT 
    COUNT(DISTINCT sng.song_id) AS cancoes,
    COUNT(DISTINCT art.artist_id) AS artistas,
    COUNT(DISTINCT alb.album_id) AS albuns
FROM
    song AS sng
        INNER JOIN
    artist AS art ON sng.artist_id = art.artist_id
        INNER JOIN
    album AS alb ON sng.album_id = alb.album_id;
  