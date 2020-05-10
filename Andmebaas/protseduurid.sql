CREATE PROCEDURE seanside_info(
IN kino_id INTEGER)
RESULT (
nimi VARCHAR(100),
aeg DATETIME,
hind float)
BEGIN
SELECT filmid.nimi,seansid.aeg,seansid.hind
FROM seansid,filmid,kinoseansid,kinod
WHERE filmid.id = seansid.film AND seansid.id = kinoseansid.seanss AND kinoseansid.kino = kino_id AND kinoseansid.kino = kinod.id
END;

CALL seanside_info(3)
DROP PROCEDURE seanside_info

SELECT * FROM seansid
SELECT * FROM kinoseansid

CREATE PROCEDURE top_filmid()
RESULT(
nimi VARCHAR(100),
vaatajate_arv INTEGER)
BEGIN
SELECT DISTINCT filmid.nimi,SUM(seansid.külastajate_arv) AS arv
FROM filmid, seansid
WHERE seansid.film = filmid.id
GROUP BY nimi
ORDER BY arv DESC
END;

CALL top_filmid;

CREATE PROCEDURE külastaja_tellimused (
IN külastaja_id FLOAT)
RESULT (
toidud VARCHAR(50),
hind VARCHAR(50))
BEGIN
SELECT nimi, hind FROM Toidud, Tellimused
WHERE Tellimused.tellija=külastaja_id AND tellimused.toit=toidud.id ORDER BY nimi;
END;

call külastaja_tellimused(2)

CREATE PROCEDURE seansi_sissetulek (
IN seansi_id INTEGER)
RESULT (
seansi_id VARCHAR(50),
film VARCHAR(50),
sissetulek INTEGER)
BEGIN
SELECT DISTINCT  seansid.id, filmid.nimi, CASE WHEN summa IS NULL THEN Külastajate_arv*Hind ELSE Külastajate_arv*Hind+summa END FROM Seansid, Tellimused, Filmid, (SELECT SUM(hind) AS summa FROM Toidud, Tellimused, Külastajad WHERE Seanss=seansi_id AND Tellimused.tellija=külastajad.id AND tellimused.toit=toidud.id) AS tellimused_sissetulek
WHERE seansi_id=Seansid.id AND Filmid.id=Seansid.film ORDER BY filmid.nimi;
END;

call seansi_sissetulek(2)

CREATE PROCEDURE kino_sissetulek(
IN kino_id INTEGER)
RESULT (
sissetulek FLOAT)
BEGIN
SELECT CASE WHEN summa IS NULL THEN SUM(test) ELSE SUM(test)+summa END FROM (SELECT SUM(hind) AS summa FROM Toidud, Tellimused, Külastajad, (SELECT DISTINCT seanss FROM Kinod, Kinoseansid WHERE kino_id=Kinoseansid.kino) AS Seans WHERE Külastajad.Seanss=Seans.seanss AND Tellimused.tellija=külastajad.id AND tellimused.toit=toidud.id) AS tellimused, (SELECT SUM(külastajate_arv*Hind) AS test FROM Seansid, (SELECT SUM(hind) AS summa FROM Toidud, Tellimused, Külastajad, (SELECT DISTINCT seanss FROM Kinod, Kinoseansid WHERE kino_id=Kinoseansid.kino) AS Seans WHERE Külastajad.Seanss=Seans.seanss AND Tellimused.tellija=külastajad.id AND tellimused.toit=toidud.id) AS tellimused, (SELECT DISTINCT seanss FROM Kinod, Kinoseansid WHERE kino_id=Kinoseansid.kino) AS seans
WHERE seans.seanss=Seansid.id GROUP by seans.seanss, Seansid.id, Hind, külastajate_arv, summa ORDER BY seans.seanss) AS mongol GROUP BY summa;
END;

CALL kino_sissetulek(4)
SELECT * FROM külastajad

DROP PROCEDURE kino_sissetulek;
DROP PROCEDURE seansi_sissetulek;
DROP PROCEDURE külastaja_tellimused;