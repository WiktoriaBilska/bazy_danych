CREATE SCHEMA Dostawy;
CREATE TABLE Dostawy.Miejscowosci(
	KodMiejscowosci varchar(6) unique not null PRIMARY KEY,
	Miejscowosc varchar(20)
);
INSERT INTO Dostawy.Miejscowosci values 
('31-435','Kraków'),
('31-342','Kraków'),
('04-242','Lublin'),
('30-243','Tarnów'),
('35-434','Nowy Targ');

CREATE TABLE Dostawy.Dostawcy(
	IDDostawcy varchar(9) unique not null PRIMARY KEY,
	NazwaDostawcy varchar(20),
	Ulica_Budynek varchar(30),
	KodMiejscowosci varchar(6) not null REFERENCES Dostawy.Miejscowosci(KodMiejscowosci)	
);
INSERT INTO Dostawy.Dostawcy values 
('1','Makarony Polskie','Turystyczna 40','31-435'),
('2','Lubelski Makaron','Piłsudskiego 332a','04-242'),
('3','Polskie przetwory','Wojska Polskiego 44a','31-342'),
('4','Przetwory pomidorowe','Rolnicza 22/4','30-243'),
('5','Małopolskie Smaki','Mickiewicza 223/77','35-434');

CREATE TABLE Dostawy.Produkty(
	IDProduktu varchar(6) not null unique PRIMARY KEY,
	NazwaProduktu varchar(30),
	Cena_Brutto float,
	Cena_Netto float
);
INSERT INTO Dostawy.Produkty values 
('1','Makaron Nitki',150,130),
('2','Keczup pikantny',220,200),
('3','Sos pomidorowy',110,89);