create database portfolio;

use portfolio;

create table Korisnik(id int not null auto_increment
, ime varchar(50) not null
, prezime varchar(100) not null
, email varchar(150) not null
, adresa varchar(200) not null
, telefon varchar(15)
, zanimanje varchar(50) not null
, opis varchar(5000)
, primary key (id));
insert into Korisnik(ime, prezime, email, adresa, telefon, zanimanje, opis) values("Dino", "Mehić", "dino.mehic@gmail.com", "Zmaja od Bosne 88", "", "Web dizajner", "");

create table Vjestine(id int not null auto_increment
, naziv varchar(500) not null
, procenatZnanja decimal(5, 2) not null
, primary key(id));

create table Iskustva(id int not null auto_increment
, naslov varchar(500) not null
, nazivOrfanizacije varchar(500) not null
, datumOd varchar(15) not null
, datumDo varchar(15) not null
, primary key(id));

create table Obrazovanje(id int not null auto_increment
, naslov varchar(500) not null
, nazivInstitucije varchar(700) not null
, godina int not null
, primary key (id));

create table Usluge(id int not null auto_increment
, naslov varchar(500) not null
, opis varchar(5000)
, primary key(id));

create table Projekti(id int not null auto_increment
, naslov varchar(500) not null
, opis varchar(5000)
, primary key(id));

create table Svjedocanstva(id int not null auto_increment
, osoba varchar(100) not null
, titlua varchar(200)
, poruka varchar(5000) not null
, primary key(id));

create table Kontakti(id int not null auto_increment
, ime varchar(150) not null
, email varchar(150) not null
, poruka varchar(5000) not null
, primary key(id));
