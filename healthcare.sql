create database if not exists Healthcare;
drop table if exists treatments;
drop table if exists diagnoses;
drop table if exists `users`;
drop table if exists diseases;
drop table if exists medicines;
drop table if exists doctors;


create table `users`(id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, username VARCHAR(32) NOT NULL, name VARCHAR(64) NOT NULL, surname VARCHAR(64), birthday DATE NOT NULL, email VARCHAR(32) NOT NULL, phone VARCHAR(15) NOT NULL, country VARCHAR(64) NOT NULL, direction VARCHAR(64), password VARCHAR(32), date DATETIME NOT NULL DEFAULT now());

create table diseases (id_disease INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, disease VARCHAR(64) NOT NULL, symptoms TEXT NOT NULL, description TEXT NOT NULL, deadly BOOLEAN NOT NULL);

create table medicines (id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, medicine VARCHAR(192) NOT NULL, cost_production DECIMAL(9, 2) UNSIGNED NOT NULL, cost_sell DECIMAL(9, 2) UNSIGNED NOT NULL);

create table doctors (id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, doctor VARCHAR(32));

create table diagnoses (id_diagnosis BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, diagnosis TEXT NOT NULL, id_doctor INT UNSIGNED NOT NULL, id_user BIGINT UNSIGNED NOT NULL, id_disease INT UNSIGNED NOT NULL, FOREIGN KEY(id_doctor) REFERENCES doctors(id_doctor), FOREIGN KEY(id_user) REFERENCES users(id_user), FOREIGN KEY(id_disease) REFERENCES diseases(id_disease));

create table treatments (id_treatment BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, id_diagnosis BIGINT UNSIGNED NOT NULL, id_medicine INT UNSIGNED NOT NULL, FOREIGN KEY(id_diagnosis) REFERENCES diagnoses(id_diagnosis), FOREIGN KEY(id_medicine) REFERENCES medicines(id_medicine));

insert into `users`(username, name, surname, birthday, email, phone, country, direction, password) values ("root", "Hilon", "Musgo", "1971-06-28", "hilonmusgo@gmail.com", "2766666666","South Africa","EvilCorp666","e1e71757deb07460abff6678e3cd468f"), ("user", "Paco", "Gonsalez", "1997-06-28", "pacopaquito@gmail.com", "43123234456","Venezuela","YupiLand","paco97"), ("user", "Luisa", "Garmendia", "2000-06-28", "luisagarmenda@gmail.com", "24512354434","Turkmenistan","Lezzet","e1e71757deb07460abff6678e3cd468f");

insert into doctors(doctor) values ("Belcebu"), ("Satanas");

insert into medicines(medicine, cost_production, cost_sell) values ("Simvastatina", 921323.23, 9999999.99), ("Aspirina", 5000.99, 999999.99), ("Omeprazol", 7000.00, 999999.99), ("Ramipril", 96543.00, 9999999.22);

insert into diseases(disease, symptoms, description, deadly) values ("Bronquitis aguda", "Tos, Mucosidad", "Te pones mu malo de los bronquio",true), ("Resfriado comun", "Estornudos, moqueos, congestion nasal, tos, dolor de garganta", "Te pones malo por haber pillado frio", true), ("Infeccion de oido", "Dolor de oido, fiebre", "No oyes na", true), ("Gripe", "Fiebre, tos, dolor de gargatna, moqueo, dolor corporal", "Excusa perfecta para faltar a todos los sitios", true), ("Sinusitis", "Dolor de cabeza, congestion, moqueo, presion en la cara", "Te revienta la cabeza", true), ("Infeccion de piel", "Erojecimiento de la piel, inflamacion", "El popper", true), ("Dolor de garganta", "Dolor de garganta, ronquera", "Algo que el pablo no tendra", true);

insert into diagnoses(diagnosis, id_doctor, id_user, id_disease) values("Esta mu malo", 1, 2, 3), ("Esta mas malo aun", 2, 3, 1), ("Esta malo", 1, 2, 1), ("Esta malo maloso", 1, 1, 7);

insert into treatments(id_diagnosis, id_medicine) values(1,1),(1,2),(2,3),(4,3),(3, 4);


