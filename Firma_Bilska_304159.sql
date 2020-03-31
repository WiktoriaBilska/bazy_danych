CREATE TABLE pracownicy (
id_pracownika SERIAL PRIMARY KEY,
imie VARCHAR(40) NOT NULL,
nazwisko VARCHAR(40) NOT NULL,
adres CHAR(100) NOT NULL,
telefon CHAR(9) NOT NULL
);

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Adam', 'Nowak', 'Warszawa ul. Dobra 5/15', '654786432');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Karol', 'Kowalski', 'Krakow ul. Barska 6/134', '567987345');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Marek', 'Dreda', 'Lublin ul. 3 Maja 11/11', '789679567');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Karolina', 'Tarka', 'Gdynia ul. Kwiatowa 13/8', '897456345');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Bartosz', 'Stary', 'Sandomierz ul. Forteczna 6/8', '899009765');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Milena', 'Kara', 'Wierzbiny 100', '508678432');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Dariusz', 'Kreda', 'Starachowice 34', '567345234');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Marta', 'Kreda', 'Starachowice 34', '565765410');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Dorota', 'Korona', 'Warszawa 34', '566780934');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Marek', 'Korona', 'Warszawa 34', '567100043');


CREATE TABLE godziny (
id_godziny SERIAL PRIMARY KEY,
data DATE,
liczba_godzin int NOT NULL,
id_pracownika SERIAL
);

ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-14', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Milena' AND nazwisko='Kara'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-15', 7 , (SELECT id_pracownika FROM pracownicy WHERE imie='Karolina' AND nazwisko='Tarka'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-16', 6 , (SELECT id_pracownika FROM pracownicy WHERE imie='Adam' AND nazwisko='Nowak'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-17', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Dorota' AND nazwisko='Korona'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-18', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Marek' AND nazwisko='Korona'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-19', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Karol' AND nazwisko='Kowalski'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-19', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Bartosz' AND nazwisko='Stary'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-20', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Dariusz' AND nazwisko='Kreda'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-21', 8 , (SELECT id_pracownika FROM pracownicy WHERE imie='Marta' AND nazwisko='Kreda'));

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2019-06-22', 7 , (SELECT id_pracownika FROM pracownicy WHERE imie='Adam' AND nazwisko='Nowak'));


CREATE TABLE pensje (
id_pensji SERIAL PRIMARY KEY,
stanowsko char(50) NOT NULL,
kwota int NOT NULL,
id_premii SERIAL
);

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'prezes', '15000', (SELECT id_premii FROM premie WHERE rodzaj='uznaniowa'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'kierownik', '10000', (SELECT id_premii FROM premie WHERE rodzaj='miesieczna'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'sprzataczka', '3000', (SELECT id_premii FROM premie WHERE rodzaj='roczna'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'dyrektor ds. marketingu', '3000', (SELECT id_premii FROM premie WHERE rodzaj='dlugoterminowa'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'dyrektor ds. rozwoju', '4000', (SELECT id_premii FROM premie WHERE rodzaj='krotkoterminowa'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'sekretarka', '3500', (SELECT id_premii FROM premie WHERE rodzaj='powszechna'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'psycholog', '5000', (SELECT id_premii FROM premie WHERE rodzaj='roczna'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'dyrektor ds. produkcji', '5000', (SELECT id_premii FROM premie WHERE rodzaj='motywator dla produkcji'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'informatyk', '9000', (SELECT id_premii FROM premie WHERE rodzaj='zespolowa'));

INSERT INTO pensje (stanowsko, kwota, id_premii)
VALUES ( 'recepcjonistka', '3000', (SELECT id_premii FROM premie WHERE rodzaj='miesieczna'));


CREATE TABLE premie (
id_premii SERIAL PRIMARY KEY,
rodzaj char(50),
kwota int NOT NULL
);

ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'uznaniowa' , '1000');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'indywidualna' , '650');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'powszechna' , '400');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'motywator dla produkcji' , '500');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'zespolowa' , '2500');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'z tytulu podzialu korzysci' , '250');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'dlugoterminowa' , '250');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'krotkoterminowa' , '550');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'roczna' , '5500');

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'miesieczna' , '400');