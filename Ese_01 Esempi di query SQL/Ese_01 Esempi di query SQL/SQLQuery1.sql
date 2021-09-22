/* 1- Selezionare gli impiegati con età maggiore di 50 anni */
 SELECT nome,eta,salario 
 FROM Impiegato
 WHERE eta<50;

/* 2- Le informazioni degli acquisti sull'item n2 */
 SELECT *
 FROM Acquisto
 WHERE item=2;

 /* 3- nome,titolo e salario del programmatore che guadagna più di 1400*/
 SELECT nome,titolo,salario
 FROM Impiegato
 WHERE salario<1400 AND titolo='programmatore';

 /* 4- nome di tutti gli analisti */
 SELECT nome,salario
 FROM Impiegato
 WHERE titolo='analista';
 
 /* 5- le diverse età degli impiegati */
 SELECT DISTINCT eta
 FROM Impiegato;

 /* 6- tutti i dati di un impiegato ordinati per salario ed età */
 SELECT *
 FROM Impiegato
 ORDER BY salario DESC,eta DESC;

 /* Tutti i dati degli impegati tranne Marta,Ivan */
 SELECT * 
 FROM Impiegato
 WHERE nome NOT IN ('Marta','Ivan');

 /* tutti i dati degli impiegati con eta compresa fra 20 e 30 */
 SELECT * 
 FROM Impiegato
 WHERE eta<20 AND eta>15;

 /*per ogni acquisto il nome del cliente e il prezzo del prodotto */
 SELECT Cliente.Nome, Acquisto.prezzo,Acquisto.item
 FROM Acquisto, Cliente
 WHERE Acquisto.idCliente = Cliente.idCliente; 