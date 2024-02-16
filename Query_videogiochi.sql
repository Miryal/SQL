USE videogamesstoredb;
SELECT * FROM impiegato;

-- SELEZIONE DI TUTTI GLI IMPIEGATI CON UNA LAUREA IN ECONOMIA
SELECT * 
FROM impiegato
WHERE TitoloStudio = 'Laurea in Economia'; 

-- SELEZIONA GLI IMPIEGATI CHE LAVORANO COME CASSIERE O CHE HANNO UN DIPLOMA IN INFORMATICA 
SELECT * 
FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.carica = "Cassiere"
OR impiegato.titolostudio = "Diploma in Informatica";

-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023.
SELECT Nome, TitoloStudio
FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio > '2023.01.01';

-- Seleziona i titoli di studio distinti tra gli impiegati
SELECT DISTINCT TitoloStudio
FROM impiegato;

-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia"
SELECT * 
FROM impiegato
WHERE TitoloStudio <> 'Laurea in Economia';

-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi
SELECT *
FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio < '2023.07.01'
AND servizio_impiegato.Carica = 'Commesso';

SELECT * FROM videogioco;

-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020
SELECT Titolo, Sviluppatore
FROM videogioco
WHERE AnnoDistribuzione = '2020-01-01';



