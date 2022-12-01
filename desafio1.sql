  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  USE SpotifyClone;
  
CREATE TABLE user (
    user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(250) NOT NULL,
    user_age INT NOT NULL,
    plan_id INT,
    signature_date DATE NOT NULL,
    FOREIGN KEY (plan_id)
        REFERENCES user_plan (plan_id)
)  engine = InnoDB;

CREATE TABLE user_plan (
    plan_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plan_type VARCHAR(250) NOT NULL,
    plan_value DOUBLE NOT NULL
)  engine = InnoDB;

CREATE TABLE artist (
    artist_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artist_name VARCHAR(250) NOT NULL
) engine = InnoDB;

CREATE TABLE album (
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(250) NOT NULL,
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
)  engine = InnoDB;

CREATE TABLE song (
    song_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(250) NOT NULL,
    duration_song INT,
    album_id INT,
    artist_id INT,
    FOREIGN KEY (album_id)
        REFERENCES album (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
) engine = InnoDB;

CREATE TABLE following_artist (
    user_id INT,
    artist_id INT,
    CONSTRAINT PRIMARY KEY (user_id , artist_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
)  engine = InnoDB;

CREATE TABLE playback_history (
    user_id INTEGER,
    song_id INTEGER,
    reproduction_date DATETIME,
    CONSTRAINT PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id)
) engine = InnoDB;

	INSERT INTO user(user_name, plan_id, user_age, signature_date )
VALUES
  ('Barbara Liskov', 1,	82, '2019-10-20'),
  ('Robert Cecil Martin', 1, 58, '2017-01-06'),
  ('Ada Lovelace',  2, 37, '2017-12-30'),
  ('Martin Fowler', 2, 46, '2017-01-17'),
  ('Sandi Metz', 2, 58, '2018-04-29'),
  ('Paulo Freire', 3, 19,	'2018-02-14'),
  ('Bell Hooks', 3, 26, '2018-01-05'),
  ('Christopher Alexander',	4, 85, '2019-06-05'),
  ('Judith Butler', 4, 45,	'2020-05-13'),
  ('Jorge Amado', 4, 58, '2017-02-17');

    INSERT INTO user_plan(plan_type, plan_value)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

  INSERT INTO artist(artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');


  INSERT INTO album(album_name, release_year, artist_id)
VALUES
	('Renaissance', 2022,	1),
	('Jazz', 1978, 2),
	('Hot Space', 1982, 2),
	('Falso Brilhante', 1998,	3),
	('Vento de Maio', 2001, 3),
	('QVVJFA?', 2003,	4),
	('Somewhere Far Beyond',2007, 5),
	('I Put A Spell On You', 2012, 6);


	INSERT INTO song(song_name, duration_song, album_id, artist_id)
VALUES
	('BREAK MY SOUL', 279, 1, 1),
	('VIRGO’S GROOVE', 369, 1, 1),
	('ALIEN SUPERSTAR', 116, 1, 1),
	('Don’t Stop Me Now', 203, 2, 2),
	('Under Pressure', 152, 3, 2),
	('Como Nossos Pais', 105, 4, 3),
	('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
	('Samba em Paris', 267, 6, 4),
	('The Bard’s Song', 244, 7, 5),
	('Feeling Good', 100, 8, 6);

	INSERT INTO following_artist( user_id , artist_id)
  VALUES
  (1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);

	INSERT INTO playback_history(user_id, song_id, reproduction_date)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
  

