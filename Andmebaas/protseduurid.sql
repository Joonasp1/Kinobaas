CREATE PROCEDURE seanside_info(
IN kino_id INTEGER)
RESULT (
nimi VARCHAR(100),
aeg DATETIME,
hind float)
BEGIN
SELECT filmid.nimi,seansid.aeg,seansid.hind
FROM seansid,filmid,kinoseansid,kinod
WHERE filmid.id = seansid.film AND seansid.id = kinoseansid.seanss AND kinoseansid.kino = kino_id
END;

CALL seanside_info(4)
DROP PROCEDURE seanside_info

SELECT * FROM seansid
SELECT * FROM kinoseansid

CREATE PROCEDURE top_filmid()
RESULT(
nimi VARCHAR(100),
vaatajate_arv INTEGER)
BEGIN
SELECT DISTINCT filmid.nimi,SUM(seansid.k�lastajate_arv) AS arv
FROM filmid, seansid
WHERE seansid.film = filmid.id
GROUP BY nimi
ORDER BY arv DESC
END;

CALL top_filmid;

CREATE PROCEDURE k�lastaja_tellimused (
IN k�lastaja_id INTEGER)
RESULT (
toidud VARCHAR(50),
hind VARCHAR(50))
BEGIN
SELECT nimi, hind FROM Toidud, Tellimus
WHERE Tellimus.tellija=k�lastaja_id AND tellimus.toit=toidud.id ORDER BY nimi;
END;

call k�lastaja_tellimused(2)

CREATE PROCEDURE seansi_sissetulek (
IN seansi_id INTEGER)
RESULT (
seansi_id VARCHAR(50),
film VARCHAR(50),
sissetulek INTEGER)
BEGIN
SELECT DISTINCT  seansid.id, filmid.nimi, k�lastajate_arv*Hind+summa FROM Seansid, Tellimus, Filmid, (SELECT SUM(hind) AS summa FROM Toidud, Tellimus, K�lastajad WHERE Seanss=seansi_id AND Tellimus.tellija=k�lastajad.id AND tellimus.toit=toidud.id) AS tellimused
WHERE seansi_id=Seansid.id AND Filmid.id=Seansid.film ORDER BY filmid.nimi;
END;