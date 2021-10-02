﻿/* Per ciascun museo di londra il numero di opere di artisti italiani ivi conservate */
/* Quando c'è da ragruppare per musei di londra uso la groupby */
/* Groupby raggruppa le righe in base ai valori uguali delle colonne */
SELECT m.NomeM, COUNT(*) AS NumeroOpere
FROM Artisti a, Opere o, Musei m
WHERE a.Nazionalita = 'Ita'
AND a.NomeA = o.NomeA
AND m.NomeM = o.NomeM
AND m.Citta = 'Londra'
GROUP BY m.NomeM

/* Il nome dei musei di londra che non hanno opere di Tiziano */
SELECT DISTINCT m.NomeM
FROM Musei m
WHERE m.Citta = 'Londra'
AND NOT EXISTS(SELECT * 
			   FROM Opere o
			   WHERE o.NomeA = 'Tiziano'
			   AND o.NomeM = m.NomeM)






/* 11. Per ciascun artista, il nome dell'artista ed il numero di sue opere conservate alla “Galleria
degli Uffizi” */
SELECT o.NomeA,COUNT(*) as NOpere
FROM Opere o
WHERE o.NomeM='Galleria degli Uffizi'
GROUP BY o.NomeA  


/* 12. I musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeM, COUNT(*) as n
FROM Opere o, Artisti a
WHERE o.NomeA=a.NomeA
AND a.Nazionalita='IT'
GROUP BY o.NomeM
HAVING COUNT(*)>1



/* 13- Per le opere di artisti italiani che non hanno personaggi. il titolo dell’opera ed il nome
dell'artista */
SELECT a.NomeA, o.Titolo
FROM Artisti a, Opere o
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND NOT EXISTS (SELECT *
				FROM Personaggi p
				WHERE p.Codice = o.Codice)

/* 14- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano */
SELECT *
FROM Opere o, Musei m
WHERE o.NomeM=m.NomeM
AND m.Citta='Londra'
AND NOT EXISTS(SELECT *
			FROM Artisti a
			WHERE a.NomeA=o.NomeA
			AND a.NomeA<>'Tiziano' 
			AND a.Nazionalita='IT')


/* 15- Per ogni museo, il numero di opere divise per la nazionalità dell'artista */
SELECT o.NomeM,a.Nazionalita, COUNT(*) AS nOpere
FROM Artisti a, Opere o
WHERE a.NomeA=o.NomeA
GROUP BY o.NomeM,a.Nazionalita
ORDER BY o.NomeM

UPDATE Artisti
SET Nazionalita = 'ES'
WHERE NomeA = 'Picasso'