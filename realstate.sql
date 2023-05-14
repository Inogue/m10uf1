DROP DATABASE realstate;
CREATE DATABASE realstate;
USE realstate;
DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS planets;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS streets_num;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users_addresses;

CREATE TABLE planets (id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, planet VARCHAR(64) NOT NULL);

CREATE TABLE countries (id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, country VARCHAR(64) NOT NULL, id_planet INT UNSIGNED NOT NULL, FOREIGN KEY(id_planet) REFERENCES planets(id_planet));

CREATE TABLE cities (id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, city VARCHAR(64) NOT NULL, id_country INT UNSIGNED NOT NULL, FOREIGN KEY(id_country) REFERENCES countries(id_country));

CREATE TABLE streets (id_street BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, street VARCHAR(32) NOT NULL, id_city INT UNSIGNED NOT NULL, FOREIGN KEY(id_city) REFERENCES cities(id_city));

CREATE TABLE streets_num (id_street_num INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, street_num VARCHAR(16));

CREATE TABLE staircases (id_staircase INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, staircase VARCHAR(8));

CREATE TABLE floors (id_floor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, `floor` VARCHAR(8));

CREATE TABLE doors (id_door INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, door VARCHAR(8));

CREATE TABLE zipcodes (id_zipcode INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, zipcode VARCHAR(16) NOT NULL);

CREATE TABLE addresses (id_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, id_street INT UNSIGNED NOT NULL, id_street_num INT UNSIGNED NOT NULL, id_staircase INT UNSIGNED NOT NULL, id_floor INT UNSIGNED NOT NULL, id_door INT UNSIGNED NOT NULL, id_zipcode INT UNSIGNED NOT NULL, FOREIGN KEY(id_street) REFERENCES streets(id_street), FOREIGN KEY(id_street_num) REFERENCES streets_num(id_street_num), FOREIGN KEY(id_staircase) REFERENCES staircases(id_staircase), FOREIGN KEY(id_floor) REFERENCES floors(id_floor), FOREIGN KEY(id_door) REFERENCES doors(id_door), FOREIGN KEY(id_zipcode) REFERENCES zipcodes(id_zipcode));

CREATE TABLE users (id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, `user` VARCHAR(16) NOT NULL);

CREATE TABLE users_addresses (id_user_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, id_user BIGINT UNSIGNED NOT NULL, id_address BIGINT UNSIGNED NOT NULL, FOREIGN KEY(id_user) REFERENCES users(id_user), FOREIGN KEY (id_address) REFERENCES addresses(id_address));

INSERT INTO planets(planet) VALUES ("Mercurio"),("Venus"), ("Tierra"), ("Marte");

INSERT INTO countries(country, id_planet) VALUES ("Sudan del Sur", 3), ("Zambia", 3), ("Lumele", 1), ("Titutul", 2), ("Ju", 4), ("So", 4), ("Z012", 1), ("Vietnam", 3);

INSERT INTO cities(city, id_country) VALUES ("A", 1), ("B", 2), ("C", 3), ("D", 4), ("E", 5), ("F", 6), ("G", 7), ("H", 8);

INSERT INTO streets(street, id_city) VALUES ("Calle S", 1), ("Calle I", 2), ("Calle D", 3), ("Calle O", 4), ("Calle S", 5), ("Calle O", 6), ("Calle S", 7), ("Calle :)", 8), ("Calle A", 1), ("Calle L", 2), ("Calle E", 3), ("Calle G", 4), ("Calle R", 5), ("Calle I", 6), ("Calle A", 7);

INSERT INTO streets_num (street_num) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO staircases (staircase) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO floors (`floor`) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15); 

INSERT INTO doors (door) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO zipcodes (zipcode) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO addresses (id_street, id_street_num, id_staircase, id_floor, id_door, id_zipcode) VALUES (1,1,1,1,1,1), (2,2,2,2,2,2), (3,3,3,3,3,3), (4,4,4,4,4,4), (5,5,5,5,5,5), (6,6,6,6,6,6), (7,7,7,7,7,7), (8,8,8,8,8,8), (9,9,9,9,9,9), (10,10,10,10,10,10), (11,11,11,11,11,11), (12,12,12,12,12,12), (13,13,13,13,13,13), (14,14,14,14,14,14),(15,15,15,15,15,15);

INSERT INTO users (`user`) VALUES (1),(2),(3),(4),(5),(6),(7),(8);

INSERT INTO users_addresses(id_user, id_address) VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(1,9),(2,10),(3,11),(4,12),(5,13),(6, 14),(7,15);

CREATE VIEW AS planet_addresses SELECT planets.planet, COUNT(addresses.id_address) planet_addresses FROM planets;
