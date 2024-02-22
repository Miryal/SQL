USE sakila;

SELECT
table_name
FROM
information_schema.tables
WHERE
table_schema = 'sakila';

SELECT
COUNT(*) AS total_tables
FROM
information_schema.tables
WHERE
table_schema = 'sakila';

SELECT * FROM customer;

-- Scoprite quanti clienti si sono registrati nel 2006.
SELECT COUNT(*) as total_customers
FROM customer
WHERE create_date > '2005-12-31';

-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
SELECT DISTINCT COUNT(*)
FROM rental
WHERE rental_date = '2006-01-01';

-- Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
SELECT
f.film_id,
f.title,
c.customer_id,
c.first_name,
c.last_name,
r.rental_date
FROM
rental AS r
JOIN
inventory AS i ON r.inventory_id = i.inventory_id
JOIN
film AS f ON i.film_id = f.film_id
JOIN
customer AS c ON r.customer_id = c.customer_id
WHERE
r.rental_date >= (SELECT DATE_SUB(MAX(rental_date), INTERVAL 1 WEEK) FROM rental);


SELECT
film.title,
rental.rental_id,
customer.first_name,
customer.last_name,
inventory_id,
rental_date
FROM
rental
JOIN
customer USING (customer_id)
JOIN
inventory USING (inventory_id)
JOIN
film USING (film_id)
WHERE
rental_date BETWEEN (SELECT
(ADDDATE(MAX(rental_date), - 7))
FROM
rental) AND (SELECT
MAX(rental_date)
FROM
rental);

-- Calcolate la durata media del noleggio per ogni categoria di film.
SELECT
c.name AS category,
SEC_TO_TIME(AVG(DATEDIFF(r.return_date, r.rental_date)) * 86400) AS avg_rental_duration
FROM
category c
JOIN film_category fc USING(category_id)
JOIN film f USING(film_id)
JOIN inventory i USING(film_id)
JOIN rental r USING(inventory_id)
GROUP BY
c.name;

-- cercate la durata del noleggio più lungo 
SELECT DATEDIFF(return_date, rental_date) AS rental_duration
FROM rental
ORDER BY rental_duration DESC
LIMIT 1;



