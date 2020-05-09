INPUT INTO Toidud FROM 'toidud.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Saalid FROM 'saalid.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Filmid FROM 'filmid.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Külastajad FROM 'külastajad.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Tellimus FROM 'tellimus.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Kinosaalid FROM 'kinosaalid.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Kinod FROM 'kinod.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Seansid FROM 'seansid.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Kinoseansid FROM 'kinoseansid.txt' FORMAT ASCII DELIMITED BY '\x09';
INPUT INTO Sissetulekud FROM 'sissetulekud.txt' FORMAT ASCII DELIMITED BY '\x09';

SELECT * FROM toidud
SELECT * FROM Saalid
SELECT * FROM Filmid
SELECT * FROM Külastajad
SELECT * FROM Tellimus
SELECT * FROM Kinosaalid
SELECT * FROM Kinod
SELECT * FROM Seansid
SELECT * FROM Kinoseansid
SELECT * FROM sissetulekud