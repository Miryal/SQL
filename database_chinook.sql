USE chinook;

-- mostra un elenco di tutte le tabelle
SHOW TABLES;

-- mostra le prime 10 righe della tabella album
SELECT * 
FROM album
LIMIT 10;

SELECT * FROM track;

-- mostra il numero totale delle canzoni nella tabella track
SELECT COUNT(*) 
FROM track;

-- trova i nomi dei diversi generi nella tabella Genre
SELECT DISTINCT Name
FROM genre;

-- trova i nomi degli artisti nella tabella artist
SELECT name
FROM artist;

-- conta il numero totale degli artisti
SELECT COUNT(*)
FROM artist;
 
-- Recuperate il nome di tutte le tracce e del genere associato
SELECT track.name AS trackname, genre.name AS genrename
FROM track
LEFT JOIN genre ON track.GenreId = genre.GenreId;

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. 
SELECT artist.Name 
FROM artist
WHERE EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

-- oppure
SELECT DISTINCT artist.name
FROM artist
JOIN album ON artist.ArtistId = album.ArtistId;

-- esistono artisti senza album nel database?
SELECT artist.name 
FROM artist
LEFT JOIN album ON  artist.ArtistId = album.ArtistId
WHERE AlbumId IS NULL;

-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media.
SELECT track.name AS track_name, genre.name AS genre_name, mediatype.name AS  mediatype_name
FROM track
JOIN genre ON track.GenreId = genre.GenreId
JOIN mediatype ON track.MediaTypeId  = mediatype.MediaTypeId;

-- Elencate i nomi di tutti gli artisti e dei loro album.
SELECT artist.name AS artist_name , album.title AS album_title
FROM artist
JOIN album ON artist.ArtistId = album.ArtistId
ORDER BY artist.name;

-- Individuate la durata media delle tracce per ogni album.
SELECT album.title  AS album_title, AVG(track.Milliseconds)/1000 AS media_track
FROM album
JOIN  track ON album.AlbumId = track.AlbumId
GROUP BY album.AlbumId;

-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”
SELECT track.name AS track_name, genre.name AS genere_name
FROM track
JOIN genre ON track.GenreId = genre.GenreId
WHERE genre.name IN ('Pop', 'Rock');

-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
SELECT album.title, artist.name
FROM album
LEFT JOIN artist ON album.ArtistId = artist.ArtistId
WHERE album.title LIKE "A%"
AND artist.name LIKE "A%";

-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
SELECT track.name, genre.name, track.Milliseconds/60000 AS durata
FROM track
JOIN genre ON track.GenreId = genre.GenreId
WHERE genre.name IN ('Jazz')
OR track.Milliseconds/60000 < 3;

-- Recuperate tutte le tracce più lunghe della durata media.
SELECT name,
CONCAT(FLOOR(milliseconds/60000, ':', LPAD(FLOOR((milliseconds%60000)/1000,2,'0')) AS durata
FROM  track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM  track);

-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.
SELECT genre.name AS genre_name
FROM track
JOIN genre ON  track.GenreId = genre.GenreId
GROUP BY genre.GenreId
HAVING AVG(track.Milliseconds) > 240000;

-- Individuate gli artisti che hanno rilasciato più di un album.
SELECT artist.Name AS artist_name, COUNT(album.albumId) AS AlbumsReleased
FROM artist
JOIN album ON  artist.ArtistId = album.ArtistId
GROUP BY artist.name
HAVING COUNT(album.albumId) >1;

-- Trovate la traccia più lunga in ogni album
SELECT album.title AS album_title, MAX(track.milliseconds) AS max_track
FROM album
JOIN track ON album.AlbumId = track.AlbumId
GROUP BY album.Title;

-- Individuate la durata media delle tracce per ogni album.
SELECT album.title AS album, AVG(track.milliseconds) / 60000 AS durata_media
FROM album
JOIN track ON album.AlbumId = track.AlbumId
GROUP BY album.AlbumId, album.title;

-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
SELECT album.title AS album_title, COUNT(track.trackId) AS n_track
FROM album
JOIN track on album.AlbumId = track.AlbumId
GROUP BY album.title
HAVING COUNT(track.trackId) > 20;








