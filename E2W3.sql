USE chinook;

-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.

select g.name, count(g.name) as numero_tracce
from genre g
join track t on g.genreId = t.genreId
group by g.name
having count(g.name) >=10
order by numero_tracce desc;

-- Trovate le tre canzoni più costose.
select track.name as nameT, track.unitprice as maxprice
FROM track
order by maxprice desc
limit 3;

-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
select ar.Name
from artist ar
join album al on ar.ArtistId = al.ArtistId
join track tr on tr.AlbumId = al.AlbumId
where tr.Milliseconds > 360000
group by ar.ArtistId;

-- Individuate la durata media delle tracce per ogni genere.
SELECT Genre.Name AS Genre, FLOOR(AVG(Track.Milliseconds/60000)) AS MINUTES, ROUND((AVG(Track.Milliseconds/60000)-FLOOR(AVG(Track.Milliseconds/60000)))*60) AS Seconds
FROM Genre
JOIN Track ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
HAVING FLOOR(AVG(Track.Milliseconds/60000));

-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
SELECT TrackId, Name
FROM Track
WHERE Name LIKE '% Love %'
ORDER BY GenreId, Name ASC;

-- trovate il costo medio per ogni tipologia di media
select mediatype.name as nome_mt, avg(track.unitprice) as media
from mediatype
join track on mediatype.mediatypeId = track.mediatypeId
group by nome_mt;

-- Individuate il genere con più tracce.
SELECT genre.name nomegenere, COUNT(track.name) numero
FROM genre
JOIN track ON track.genreid = genre.genreid
GROUP BY nomegenere
ORDER BY numero DESC
LIMIT 1;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.
SELECT A1.Name
FROM Artist A1
JOIN Album AL1 ON A1.ArtistId = AL1.ArtistId
JOIN (
SELECT COUNT(*) AS NumAlbums
FROM Album
WHERE ArtistId = (
SELECT ArtistId
FROM Artist
WHERE Name = 'The Rolling Stones')) AS RS ON RS.NumAlbums = (
SELECT COUNT(*) AS NumAlbums
FROM Album
WHERE ArtistId = A1.ArtistId)
WHERE A1.Name != 'The Rolling Stones'
GROUP BY A1.name;



