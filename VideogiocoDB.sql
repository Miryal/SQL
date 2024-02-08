-- COMMENTI DI UNA SOLA RIGA

/*
SCRIVI COMMENTO DI PIù RIGHE

*/

-- CREAZIONE DEL DATABASE
CREATE DATABASE VideogamesstoreDB
USE videogamesstoredb;

-- CREAZIONE TABELLA Store
CREATE TABLE Store (CodiceStore INTEGER PRIMARY KEY, 
IndirizzoFisico VARCHAR(50),
NumeroTelefono VARCHAR(15));

-- CREAZIONE TABELLA Impiegato
CREATE TABLE Impiegato (CodiceFiscale VARCHAR(50) PRIMARY KEY,
Nome VARCHAR(50),
TitoloStudio VARCHAR(50),
Recapito VARCHAR(50));

-- CREAZIONE TABELLA Servizio-Impiegato
CREATE TABLE Servizio_Impiegato (ID_servizio INTEGER PRIMARY KEY AUTO_INCREMENT,
CodiceFiscale VARCHAR(50),
CodiceStore INTEGER,
DataInizio DATE,
DataFine DATE,
Carica VARCHAR(50),
FOREIGN KEY (CodiceFiscale) REFERENCES Impiegato(CodiceFiscale),
FOREIGN KEY (CodiceStore) REFERENCES Store(CodiceStore));

-- CREAZIONE TABELLA VIDEOGIOCO
CREATE TABLE Videogioco (Titolo VARCHAR(30) PRIMARY KEY, 
Sviluppatore VARCHAR(30),
AnnoDistribuzione DATE,
CostoAquisto FLOAT,
Genere VARCHAR(30),
RemakeDi VARCHAR(10),
CodiceStore INTEGER,
FOREIGN KEY (CodiceStore) REFERENCES Store(CodiceStore));

-- INSERIMENTO DATI NELLA TABELLA Store
INSERT INTO Store (CodiceStore, IndirizzoFisico, NumeroTelefono) VALUES
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma', '+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678');

-- INSERIMENTO DATI NELLA TABELLA Impiegato
INSERT INTO Impiegato (CodiceFiscale, Nome, TitoloStudio, Recapito)
VALUES
('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi', 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@email.com');

-- INSERIMENTO DATI NELLA TABELLA Servizio-Impiegato
INSERT INTO Servizio_Impiegato (CodiceFiscale, CodiceStore, DataInizio, DataFine, Carica)
VALUES
('ABC12345XYZ67890', 1, '2023-01-01', '2023-12-31', 'Cassiere'),
('DEF67890XYZ12345', 2, '2023-02-01', '2023-11-30', 'Commesso'),
('GHI12345XYZ67890', 3, '2023-03-01', '2023-10-31', 'Magazziniere'),
('JKL67890XYZ12345', 4, '2023-04-01', '2023-09-30', 'Addetto alle vendite'),
('MNO12345XYZ67890', 5, '2023-05-01', '2023-08-31', 'Addetto alle pulizie'),
('PQR67890XYZ12345', 6, '2023-06-01', '2023-07-31', 'Commesso'),
('STU12345XYZ67890', 7, '2023-07-01', '2023-06-30', 'Commesso'),
('VWX67890XYZ12345', 8, '2023-08-01', '2023-05-31', 'Cassiere'),
('YZA12345XYZ67890', 9, '2023-09-01', '2023-04-30', 'Cassiere'),
('BCD67890XYZ12345', 10, '2023-10-01', '2023-03-31', 'Cassiere');

-- INSERIMENTO DATI NELLA TABELLA Videogioco
INSERT INTO Videogioco (Titolo, Sviluppatore, AnnoDistribuzione, CostoAquisto, Genere, RemakeDi,CodiceStore)
VALUES
('Fifa 2023', 'EA Sports', '2023-01-01', 49.99, 'Calcio', NULL,5),
('Assassin''s Creed: Valhalla', 'Ubisoft', '2020-01-01', 59.99, 'Action', NULL,2),
('Super Mario Odyssey', 'Nintendo', '2017-01-01', 39.99, 'Platform', NULL,1),
('The Last of Us Part II', 'Naughty Dog', '2020-01-01', 69.99, 'Action', NULL,4),
('Cyberpunk 2077', 'CD Projekt Red', '2020-01-01', 49.99, 'RPG', NULL,3),
('Animal Crossing: New Horizons', 'Nintendo', '2020-01-01', 54.99, 'Simulation', NULL,8),
('Call of Duty: Warzone', 'Infinity Ward', '2020-01-01', 0.00, 'FPS', NULL,7),
('The Legend of Zelda', 'Nintendo', '2017-01-01', 59.99, 'Action-Adventure', NULL,6),
('Fortnite', 'Epic Games', '2017-01-01', 0.00, 'Battle Royale', NULL,10),
('Red Dead Redemption 2', 'Rockstar Games', '2018-01-01', 39.99, 'Action-Adventure', NULL,9);

DESCRIBE Videogioco;
SHOW TABLES;

-- ESEGUE LA QUERY PER RITROVARE LA COLLOCAZIONE DEL VIDEOGIOCO
SELECT Videogioco.Titolo, Store.IndirizzoFisico
FROM Store
JOIN Videogioco ON Store.CodiceStore = Videogioco.CodiceStore;


