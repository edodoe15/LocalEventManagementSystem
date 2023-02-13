CREATE DATABASE projekat;

USE projekat;

CREATE TABLE Lokacija (
	id int not null auto_increment,
	naziv varchar(50) not null,
	opis varchar(255) not null,
	lokacijaURL varchar(255) not null,
	primary key (id)
);

CREATE TABLE Kategorija(
	id int not null auto_increment,
	nazivKategorije varchar(50) not null,
	ikonica varchar(255) not null,
	primary key (id)
);

CREATE TABLE Dogadaj(
	id int not null auto_increment,
	nazivDogadaja varchar(50) not null,
	datum varchar(50) not null,
	opis varchar(50) not null,
	slikaURL varchar(255) not null,
	lokacijaId int not null,
	kategorijaId int not null,
	primary key(id),
	foreign key(lokacijaId) references Lokacija(id),
	foreign key(kategorijaId) references Kategorija(id)
);

CREATE TABLE Role(
	id int not null auto_increment,
    name varchar(50) not null,
    primary key(id)
);

CREATE TABLE User(
	id int not null auto_increment,
    firstName varchar(50) not null,
    lastName varchar(50) not null,
    email varchar(50) not null,
    password varchar(255) not null,
    roleId int not null,
    suspended boolean,
    foreign key (roleId) references Role(id),
    primary key(id)
);

CREATE TABLE Komentar(
	id int not null auto_increment,
    tekst varchar(255) not null,
    userId int not null,
    primary key(id),
    datum date not null,
    foreign key (userId) references User(id)
)

ALTER TABLE Komentar ADD COLUMN dogadajId int not null
ALTER TABLE Komentar
ADD FOREIGN KEY (dogadajId) REFERENCES Dogadaj(id);

INSERT INTO Role (name) VALUES ('ROLE_ADMIN');
INSERT INTO Role (name) VALUES ('ROLE_USER');

ALTER TABLE User MODIFY password varchar(255)
ALTER TABLE Dogadaj MODIFY slikaURL varchar(255)
ALTER TABLE Kategorija MODIFY ikonica varchar(255)
ALTER TABLE Lokacija MODIFY lokacijaURL varchar(255)

SELECT * FROM Lokacija
SELECT * FROM Kategorija
SELECT * FROM Komentar where dogadajId = 1
SELECT * FROM Role
SELECT * FROM User


SELECT * From Dogadaj;
Update Dogadaj Set datum = '2022-12-20' where id = 3

ALTER TABLE Dogadaj MODIFY datum date

DELETE FROM `Role` WHERE `id` = 4;
UPDATE Role
ALTER TABLE User MODIFY password varchar(255)

INSERT INTO `User`(`firstName`, `lastName`, `email`, `password`, `roleId`, `suspended`)
VALUES ('Admin','Admin','admin@test.com','$2a$10$L93khQqOPI5DegW3HnSxUOysYxwnxvSNauX7NS.DJkzps0ER4r96W',5,false);


INSERT INTO Komentar(tekst, userId, datum, dogadajId) values('test',2,'2022-11-23',1)