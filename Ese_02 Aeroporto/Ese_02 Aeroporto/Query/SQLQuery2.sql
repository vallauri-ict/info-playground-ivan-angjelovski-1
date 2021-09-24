/* citta di cui non si sa il numero di piste */

SELECT a.Citta
FROM Aeroporto a
WHERE a.NumPiste IS NULL


/* per ogni volo misto il numero di merci a bordo */
SELECT v.TipoAereo, v.IdVolo, a.QtaMerci
FROM Aereo a, VOLO v
WHERE a.TipoAereo = v.TipoAereo 
AND a.QtaMerci > 0 AND a.NumPass > 0

/* per ogni 