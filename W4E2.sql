USE sakila;

-- Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
SELECT c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id AND MONTH(r.rental_date) = 1 AND YEAR(r.rental_date) = 2006
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) = 0;

-- Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005
SELECT f.film_id, f.title, COUNT(*) AS rental_count
FROM film AS f
JOIN inventory 	AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE YEAR(r.rental_date) = 2005
AND QUARTER(r.rental_date) = 3
GROUP BY f.film_id, f.title
HAVING count(*) > 10;

-- Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
SELECT SUM(p.amount) AS toytal_revenue_weekend
FROM payment p
JOIN rental r on p.rental_id =r.rental_id
WHERE DAYOFWEEK(r.rental_date) IN (1,7);

-- Individuate il cliente che ha speso di più in noleggi.
SELECT c.customer_id, concat(C.FIRST_NAME, ' ', C.LAST_NAME), sum(PAYMENT.AMOUNT) AS TOTALE
FROM CUSTOMER C
JOIN RENTAL R ON C.CUSTOMER_ID = R.CUSTOMER_ID
JOIN PAYMENT ON R.RENTAL_ID = PAYMENT.RENTAL_ID
group by C.CUSTOMER_ID
order by TOTALE DESC
LIMIT 1;

-- elencate i 5 film con la maggior durata media di noleggi
select f.film_id, f.title, SEC_TO_TIME(AVG(DATEDIFF(r.return_date, r.rental_date)) * 86400) AS avg_rental_duration
from film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
group by f.film_id
order by avg_rental_duration desc
limit 5;

-- Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente.
SELECT
customer_id,
AVG(DATEDIFF(next_rental_date, rental_date)) AS avg_time_between_rentals
FROM
(
SELECT
r1.customer_id,
r1.rental_date,
MIN(r2.rental_date) AS next_rental_date
FROM
rental AS r1
LEFT JOIN
rental AS r2 ON r1.customer_id = r2.customer_id
AND r1.rental_date < r2.rental_date
GROUP BY
r1.customer_id,
r1.rental_date
) AS rental_pairs
GROUP BY
customer_id;

