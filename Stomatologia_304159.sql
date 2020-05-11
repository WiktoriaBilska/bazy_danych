CREATE SCHEMA Stomatologia;

CREATE TABLE Stomatologia.Lekarze(
IDPracownika varchar(6)  unique not null PRIMARY KEY,
ImieLekarza varchar(30),
NazwiskoLekarza varchar(30)
);

INSERT INTO Stomatologia.Lekarze values
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1045','Anna','Jabłońska'),
('S1034','Marek','Potocki');

CREATE TABLE Stomatologia.Pacjenci(
IDPacjenta varchar(6)  unique not null PRIMARY KEY,
ImiePacjenta varchar(30),
NazwiskoPacjenta varchar(30)
);

INSERT INTO Stomatologia.Pacjenci values
('P100','Anna','Jeleń'),
('P105','Jarosław','Nicpoń'),
('P108','Joanna','Nosek'),
('P120','Jan','Kałuża'),
('P123','Jerzy','Lis'),
('P130','Olga','Nowacka');

CREATE TABLE Stomatologia.TypyZabiegow(
IDZabiegu varchar(6) unique not null PRIMARY KEY,
NazwaZabiegu varchar(50)
);

INSERT INTO Stomatologia.TypyZabiegow values
('Z496','Lakowanie'),
('Z500','Borowanie'),
('Z503','Usuwanie kamienia');

CREATE TABLE Stomatologia.Wizyty(
IDWizity varchar(6)  unique not null PRIMARY KEY,
Data Date,
IDPracownika varchar(6) not null references Stomatologia.Lekarze(IDPracownika),
IDPacjenta varchar(6) not null references Stomatologia.Pacjenci(IDPacjenta),
IDZabiegu varchar(6) not null references Stomatologia.TypyZabiegow(IDZabiegu)
);

INSERT INTO Stomatologia.Wizyty values
('1','2020-03-12','S1011','P100','Z500'),
('2','2020-03-12','S1011','P105','Z496'),
('3','2020-03-14','S1011','P108','Z500'),
('4','2020-03-16','S1024','P108','Z503'),
('5','2020-03-18','S1045','P120','Z500'),
('6','2020-03-20','S1034','P130','Z496'),
('7','2020-03-12','S1034','P123','Z503');