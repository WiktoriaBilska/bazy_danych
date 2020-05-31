--a)
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(18);
UPDATE ksiegowosc.pracownicy SET telefon='(+48)' || telefon
--b)
UPDATE ksiegowosc.pracownicy SET telefon=SUBSTRING(telefon,1,8) || '-' || SUBSTRING(telefon,9,3) || '-' || SUBSTRING(telefon,12,3)
--c)
SELECT UPPER(imie), UPPER(nazwisko), UPPER(adres), UPPER(telefon) FROM ksiegowosc.pracownicy ORDER BY LENGTH(pracownicy.nazwisko) DESC LIMIT 1 
--d)
SELECT pracownicy.*, MD5(CAST(kwota AS VARCHAR)) AS md5_kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_pensji = pensja.id_pensji
--e)
SELECT pracownicy.* , pensja.kwota, premia.kwota FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji = pensja.id_pensji
LEFT JOIN ksiegowosc.premia ON wynagrodzenie.id_premii = premia.id_premii
--f)
SELECT CONCAT('Pracownik ',pracownicy.imie, pracownicy.nazwisko,', w dniu ',
godziny.data,' otrzymał pensję całkowitą na kwotę ',COALESCE(premia.kwota,0)+COALESCE(pensja.kwota,0),
', gdzie wynagrodzenie zasadnicze wynosiło: ',pensja.kwota,', premia: ',premia.kwota,
', nadgodziny: ',godziny.liczba_godzin) AS Informacja
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji = pensja.id_pensji
LEFT JOIN ksiegowosc.premia ON wynagrodzenie.id_premii = premia.id_premii 
LEFT JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika