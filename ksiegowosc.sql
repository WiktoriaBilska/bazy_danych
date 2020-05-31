CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika SERIAL PRIMARY KEY,
	imie VARCHAR(40) NOT NULL, 
	nazwisko VARCHAR(40) NOT NULL,
	adres CHAR(100) NOT NULL, 
	telefon CHAR(9) NOT NULL
);
	
CREATE TABLE ksiegowosc.godziny (
	id_godziny SERIAL PRIMARY KEY,
	data DATE,
	liczba_godzin int NOT NULL,
	id_pracownika SERIAL, 
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);	

CREATE TABLE ksiegowosc.pensja (
	id_pensji SERIAL PRIMARY KEY,
	stanowsko char(50) NOT NULL,
	kwota int NOT NULL
);

CREATE TABLE ksiegowosc.premia (
	id_premii SERIAL PRIMARY KEY,
	rodzaj char(50),
	kwota int NOT NULL
);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia SERIAL PRIMARY KEY, 
	data date, 
	id_pracownika SERIAL, 
	id_godziny SERIAL, 
	id_pensji SERIAL, 
	id_premii SERIAL,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
	FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii)
);

INSERT INTO ksiegowosc.pracownicy 
VALUES (DEFAULT, 'Adam', 'Nowak', 'Warszawa ul. Dobra 5/15', '654786432'),
(DEFAULT, 'Karol', 'Kowalski', 'Krakow ul. Barska 6/134', '567987345'),
(DEFAULT, 'Marek', 'Dreda', 'Lublin ul. 3 Maja 11/11', '789679567'),
(DEFAULT, 'Karolina', 'Tarka', 'Gdynia ul. Kwiatowa 13/8', '897456345'),
(DEFAULT, 'Bartosz', 'Stary', 'Sandomierz ul. Forteczna 6/8', '899009765'),
(DEFAULT, 'Milena', 'Kara', 'Wierzbiny 100', '508678432'),
(DEFAULT, 'Dariusz', 'Kreda', 'Starachowice 34', '567345234'),
(DEFAULT, 'Marta', 'Kreda', 'Starachowice 34', '565765410'),
(DEFAULT, 'Dorota', 'Korona', 'Warszawa 34', '566780934'),
(DEFAULT, 'Marek', 'Korona', 'Warszawa 34', '567100043');

INSERT INTO ksiegowosc.godziny
VALUES (DEFAULT, '2019-06-14', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Milena' AND nazwisko='Kara')),
(DEFAULT,'2019-06-15', 7 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Karolina' AND nazwisko='Tarka')),
(DEFAULT,'2019-06-16', 6 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Adam' AND nazwisko='Nowak')),
(DEFAULT, '2019-06-17', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Dorota' AND nazwisko='Korona')),
(DEFAULT, '2019-06-18', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Marek' AND nazwisko='Korona')),
(DEFAULT, '2019-06-19', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Karol' AND nazwisko='Kowalski')),
(DEFAULT, '2019-06-19', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Bartosz' AND nazwisko='Stary')),
(DEFAULT, '2019-06-20', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Dariusz' AND nazwisko='Kreda')),
(DEFAULT, '2019-06-21', 8 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Marta' AND nazwisko='Kreda')),
(DEFAULT, '2019-06-22', 7 , (SELECT id_pracownika FROM ksiegowosc.pracownicy WHERE imie='Adam' AND nazwisko='Nowak'));

INSERT INTO ksiegowosc.pensja
VALUES (DEFAULT, 'prezes', '15000'),
(DEFAULT, 'kierownik', '10000'),
(DEFAULT, 'sprzataczka', '3000'),
(DEFAULT, 'dyrektor ds. marketingu', '3000'),
(DEFAULT, 'dyrektor ds. rozwoju', '4000'),
(DEFAULT, 'sekretarka', '3500'),
(DEFAULT, 'psycholog', '5000'),
(DEFAULT, 'dyrektor ds. produkcji', '5000'),
(DEFAULT, 'informatyk', '9000'),
(DEFAULT, 'recepcjonistka', '3000');

INSERT INTO ksiegowosc.premia
VALUES (DEFAULT, 'uznaniowa' , '1000'),
(DEFAULT, 'indywidualna' , '650'),
(DEFAULT, 'powszechna' , '400'),
(DEFAULT, 'motywator dla produkcji' , '500'),
(DEFAULT, 'zespolowa' , '2500'),
(DEFAULT, 'z tytulu podzialu korzysci' , '250'),
(DEFAULT, 'dlugoterminowa' , '250'),
(DEFAULT, 'krotkoterminowa' , '550'),
(DEFAULT, 'roczna' , '5500'),
(DEFAULT, 'miesieczna' , '400');

INSERT INTO ksiegowosc.wynagrodzenie
VALUES (DEFAULT, '2020-05-02',1,4,9,3),
(DEFAULT,'2020-05-04',2,5,10,2),
(DEFAULT,'2020-05-05',3,5,8,8),
(DEFAULT,'2020-05-03',7,4,6,4),
(DEFAULT,'2020-05-04',8,9,7,2),
(DEFAULT,'2020-05-03',7,6,6,7),
(DEFAULT,'2020-05-02',7,3,5,2),
(DEFAULT,'2020-05-04',1,8,2,2),
(DEFAULT,'2020-05-03',1,1,2,2),
(DEFAULT,'2020-05-06',10,10,1,10);


--a)
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy
--b)
SELECT id_pracownika, kwota FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE kwota>1000 AND wynagrodzenie.id_pensji=pensja.id_pensji
--c)
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE pensja.id_pensji=wynagrodzenie.id_pensji AND kwota>2000 AND id_premii IS NULL
--d)
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'J%'
--e)
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.nazwisko LIKE '%n%' AND pracownicy.imie LIKE '%a'
--f)
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.godziny WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_godziny=godziny.id_godziny AND liczba_godzin-160>0 
--g)
SELECT imie, nazwisko FROM ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie WHERE pensja.kwota BETWEEN 1500 AND 3000 AND wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_pensji=pensja.id_pensji 
--h)
SELECT imie, nazwisko FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.godziny WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_godziny=godziny.id_godziny AND liczba_godzin-160>0 AND id_premii IS NULL
--i)
SELECT * FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy WHERE wynagrodzenie.id_pensji=pensja.id_pensji ORDER BY pensja.kwota ASC 
--j)
SELECT * FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.premia WHERE wynagrodzenie.id_pensji=pensja.id_pensji ORDER BY pensja.kwota DESC, premia.kwota DESC
--k)
SELECT count(pracownicy.id_pracownika) FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE pracownicy.id_pracownika=wynagrodzenie.id_pracownika AND wynagrodzenie.id_pensji=pensja.id_pensji GROUP BY pensja.stanowsko
--l)
SELECT pensja.stanowsko,ROUND(AVG(pensja.kwota)) AS srednia_płaca, MIN(pensja.kwota) AS płaca_min, MAX(pensja.kwota) AS płaca_max FROM ksiegowosc.pensja GROUP BY pensja.stanowsko HAVING pensja.stanowsko LIKE 'prezes                                            ';
--m)
SELECT SUM(kwota) FROM ksiegowosc.pensja
--n)
SELECT SUM(kwota) FROM ksiegowosc.pensja GROUP BY pensja.stanowsko
--o)
SELECT COUNT(premia.id_premii) FROM ksiegowosc.premia, ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE premia.id_premii=wynagrodzenie.id_premii AND pensja.id_pensji=wynagrodzenie.id_pensji GROUP BY pensja.stanowsko
--p)
DELETE FROM ksiegowosc.wynagrodzenie USING ksiegowosc.pensja WHERE pensja.kwota <1200 AND wynagrodzenie.id_pensji = pensja.id_pensji

