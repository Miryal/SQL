-- CREAZIONE DEL DATABASE
CREATE DATABASE GESTIONALE;

USE GESTIONALE;

-- CREAZIONE TABELLA PRODOTTI
CREATE TABLE Prodotti (
IDProdotto INT AUTO_INCREMENT,
NomeProdotto NVARCHAR(100),
Prezzo DECIMAL(10,2),
PRIMARY KEY (IDProdotto));

-- INSERIMENTO DATI NELLA TABELLA PRODOTTI
INSERT INTO Prodotti (IDProdotto, NomeProdotto, Prezzo) VALUES
(1, 'Tablet', 300.00),
(2, 'Mouse', 20.00),
(3, 'Tastiera', 25.00),
(4, 'Monitor', 180.00),
(5, 'HDD', 90.00),
(6, 'SSD', 200.00),
(7, 'RAM', 100.00),
(8, 'Router', 80.00),
(9, 'Webcam', 45.00),
(10, 'GPU', 1250.00),
(11, 'Trackpad', 500.00),
(12, 'Techmagazine', 5.00),
(13, 'Martech', 50.00);


-- CREAZI0NE TABELLA CLIENTI
CREATE TABLE Clienti (
IDCliente INT AUTO_INCREMENT,
Nome NVARCHAR(50),
Email NVARCHAR(100),
PRIMARY KEY (IDCliente));

-- INSERIMENTO DATI NELLA TABELLA CLIENTI
INSERT INTO Clienti (IDCliente, Nome, Email) VALUES
(1, 'Antonio', NULL),
(2, 'Battista', 'battista@mailmail.it'),
(3, 'Maria', 'maria@posta,it'),
(4, 'Franca', 'franca@lettere.it'),
(5, 'Ettore', NULL),
(6, 'Arianna', 'arianna@posta.it'),
(7, 'Piero', 'piero@lavoro.it');

-- CREAZIONE TABELLA ORDINI
CREATE TABLE Ordini (
 IDOrdine INT AUTO_INCREMENT,
 IDProdotto INT,
 IDCliente INT,
 Quantità INT,
 PRIMARY KEY (IDOrdine),
 FOREIGN KEY (IDProdotto) REFERENCES Prodotti (IDProdotto),
 FOREIGN KEY (IDCliente) REFERENCES Clienti (IDCliente));
 
 -- INSERIMENTO DATI NELLA TABELLA ORDINI
 INSERT INTO Ordini (IDOrdine, IDProdotto, IDCliente, Quantità) VALUES
 (1, 2, 1, 10),
 (2, 6, 2, 2),
 (3, 4, 3, 5),
 (4, 9, 1, 1),
 (5, 11, 6, 4),
 (6, 10, 2, 2),
 (7, 3, 3, 3),
 (8, 1, 4, 1),
 (9, 2, 5, 3),
 (10, 1, 6, 2),
 (11, 2, 7, 1);
 
 -- CREAZIONE TABELLA BONUS DETTAGLIO ORDINE
 CREATE TABLE DettaglioOrdine (
 IDOrdine INT,
 IDProdotto INT,
 IDCliente INT, 
 PrezzoTotale DECIMAL(10,2),
 PRIMARY KEY (IDOrdine, IDProdotto, IDCliente),
 FOREIGN KEY (IDOrdine) REFERENCES Ordini (IDOrdine),
 FOREIGN KEY (IDProdotto) REFERENCES Prodotti (IDProdotto),
 FOREIGN KEY (IDCliente) REFERENCES Clienti (IDCliente));
 
 SELECT * FROM Prodotti;
 SELECT * FROM Clienti;
 SELECT * FROM Ordini;
 
-- CALCOLO DEL PREZZO TOTALE 
 SELECT d.IDOrdine, d.IDProdotto, d.IDCliente,
	(o.Quantità * p.Prezzo) AS PrezzoTotale
FROM DettaglioOrdine d
JOIN Ordini o ON d.IDOrdine = o.IDOrdine
JOIN Prodotti p ON d.IDProdotto = p.IDProdotto;


 

 

