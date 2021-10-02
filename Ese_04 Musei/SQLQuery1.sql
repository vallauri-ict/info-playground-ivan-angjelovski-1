/* Per ciascun museo di londra il numero di opere di artisti italiani ivi conservate */
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
SELECT o.NomeArtista,COUNT(*) as NOpere
FROM Opere o
WHERE o.NomeMuseo='Galleria degli Uffizi'
GROUP BY o.NomeArtista  


/* 12. I musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeMuseo, COUNT(*) as n
FROM Opere o, Artisti a
WHERE o.NomeArtista=a.NomeArtista
AND a.Nazionalita='IT'
GROUP BY o.NomeMuseo
HAVING COUNT(*)>1



/* 13- Per le opere di artisti italiani che non hanno personaggi. il titolo dell’opera ed il nome
dell'artista */
SELECT a.NomeArtista, o.Titolo
FROM Artisti a, Personaggi p, Opere o
WHERE a.Nazionalita='IT'
AND p.Personaggio=NULL
AND p.Codice=o.Codice AND a.NomeArtista=o.NomeArtista

/* 14- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano */
SELECT *
FROM Opere o, Musei m
WHERE o.NomeMuseo=m.NomeMuseo
AND m.Citta='Londra'
AND NOT EXISTS(SELECT *
			FROM Artisti a
			WHERE a.NomeArtista=o.NomeArtista
			AND a.NomeArtista<>'Tiziano' 
			AND a.Nazionalita='IT')


/* 15- Per ogni museo, il numero di opere divise per la nazionalità dell'artista */
SELECT o.NomeMuseo,a.Nazionalita, COUNT(*) AS nOpere
FROM Artisti a, Opere o
WHERE a.NomeArtista=o.NomeArtista
GROUP BY o.NomeMuseo,a.Nazionalita
ORDER BY o.NomeMuseo