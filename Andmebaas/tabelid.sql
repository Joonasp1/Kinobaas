CREATE TABLE Toidud(
ID integer not null default autoincrement primary key,
Nimi varchar(100) not null,
Hind float not null);

CREATE TABLE Saalid(
ID integer not null default autoincrement primary key,
Number integer not null,
Istmete_arv integer not null);

CREATE TABLE Filmid(
ID integer not null default autoincrement primary key,
Nimi varchar(200) not null,
Aasta integer not null,
Re�is��r varchar(100),
Pileti_baashind float not null);

CREATE TABLE K�lastajad(
ID integer not null default autoincrement primary key,
Seanss integer not null);

CREATE TABLE Tellimused(
ID integer not null default autoincrement primary key,
Toit integer not null,
Tellija integer not null);

CREATE TABLE Kinosaalid(
ID integer not null default autoincrement primary key,
Kino integer not null,
Saal integer not null);

CREATE TABLE Kinod(
ID integer not null default autoincrement primary key,
Nimi varchar(150) not null);

CREATE TABLE Seansid(
ID integer not null default autoincrement primary key,
Hind float not null,
Aeg datetime not null,
KolmD BIT not null, //1 - on 3D 2 - ei ole 3D
Saal integer not null,
Film integer not null,
K�lastajate_arv integer not null);

CREATE TABLE Kinoseansid(
ID integer not null default autoincrement primary key,
Kino integer not null,
Seanss integer not null);

CREATE TABLE Sissetulekud(
ID integer not null default autoincrement primary key,
Kino integer not null,
P�ev date not null,
Sissetulek float);

DROP TABLE toidud;
DROP TABLE Saalid;
DROP TABLE Filmid;
DROP TABLE K�lastajad;
DROP TABLE Tellimused;
DROP TABLE Kinosaalid;
DROP TABLE Kinod;
DROP TABLE Seansid;
DROP TABLE Kinoseansid;
DROP TABLE Sissetulekud;