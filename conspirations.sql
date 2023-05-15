CREATE DATABASE IF NOT EXISTS conspirations;

DROP VIEW IF EXISTS ilumi_show;

DROP TABLE IF EXISTS iluminatis;

DROP TABLE IF EXISTS users_conspirations;

DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS conspirations;

DROP PROCEDURE  IF EXISTS add_conspiration;

CREATE TABLE users (id_user BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT UNSIGNED, `user` VARCHAR(32) NOT NULL);

CREATE TABLE conspirations (id_conspiration INT NOT NULL UNSIGNED PRIMARY KEY AUTO_INCREMENT, conspiration VARCHAR(32) NOT NULL, description TEXT NOT NULL);

CREATE TABLE iluminatis (id_iluminati INT NOT NULL UNSIGNED PRIMARY KEY AUTO_INCREMENT, id_user BIGINT NOT NULL UNSIGNED, FOREIGN KEY(id_user) REFERENCES users(id_user));

CREATE TABLE users_conspirations (id_user_conspiration BIGINT NOT NULL UNSIGNED PRIMARY KEY AUTO_INCREMENT, id_user BIGINT UNSIGNED NOT NULL, id_conspiration INT NOT NULL UNSIGNED, FOREIGN KEY(id_user) REFERENCES users (id_user), FOREIGN KEY(id_conspiration) REFERENCES conspirations(id_conspiration));

DELIMITER $$

CREATE PROCEDURE add_conspiration( IN id_users BIGINT, IN id_conspirations, IN opinion BOOLEAN)
BEGIN

START TRANSACTION;

INSERT INTO users_conspirations(id_user, id_conspiration) VALUES (id_users, id_conspirations);

IF opinion THEN
COMMIT;
ELSE
ROLLBACK;
END IF;

END $$

DELIMITER ;

INSERT INTO users (`user`) VALUES (1), (2), (3), (4), (5);

INSERT INTO conspirations (conspiration, description) VALUES ("No Holo", "Los muy nazis"), ("Terraplanistas", "Cosas de planos"), ("Conspiracion", "No covid");

INSERT INTO iluminatis (id_user) VALUES (1), (3);

CREATE VIEW ilumi_show AS SELECT users.id_user, users.`user` FROM users JOIN LEFT iluminatis ON users.id_user = iluminatis.id_user;

CREATE VIEW ilumi_count AS SELECT COUNT(users.id_user) users FROM ilumi_show;
