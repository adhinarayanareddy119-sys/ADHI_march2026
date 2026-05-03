-- 1.Write a query using a subquery to retrieve all flights with price greater than 500.
-- select * from flights where price in (select price from flights where price > 500)

-- 2.Use a subquery to display airline name, source, destination, and price by joining airlines and flights.
-- SELECT airline_name, source, destination, price
-- FROM flights f
-- JOIN (
--     SELECT airline_id, airline_name 
--     FROM airlines
-- ) a
-- ON f.airline_id = a.airline_id;

-- 3.Using a subquery, find airlines whose average flight price is greater than 700.
-- select airlines_id from flights 
-- group by airline_id 
-- having(select avg(price) as avg_price
--  from flights
--   where avg_price>700 )

-- 4.Write a query using a subquery to rank flights within each airline based on price.
-- SELECT flight_id, airline_id, price, rnk
-- FROM (
--     SELECT flight_id, airline_id, price,
--            RANK() OVER (PARTITION BY airline_id ORDER BY price DESC) AS rnk
--     FROM flights
-- ) 
-- 5.Use a subquery to find the most expensive flight for each airline.
-- SELECT airline_id, flight_id, price
-- FROM flights f
-- WHERE price = (
--     SELECT MAX(price)
--     FROM flights
--     WHERE airline_id = f.airline_id
-- )
-- 6.Write a query using subqueries to simulate flight paths starting from a given city.
-- SELECT f1.source, f1.destination AS stop1, f2.destination AS stop2
-- FROM flights f1
-- LEFT JOIN flights f2 
--     ON f1.destination = f2.source
-- WHERE f1.source = 'delhi'

-- 7.Use a subquery to identify duplicate flights based on source, destination, and departure_time.
-- SELECT *
-- FROM flights
-- WHERE (source, destination, departure_time) IN (
-- SELECT source, destination, departure_time
-- FROM flights
-- GROUP BY source, destination, departure_time
-- HAVING COUNT(*) > 1
-- );


--9. Use nested subqueries to:
-- Count total flights per airline
-- Calculate average price per airline
-- Display both results together
-- SELECT a.airline_id,
--        (SELECT COUNT(*) 
--         FROM flights f 
--         WHERE f.airline_id = a.airline_id) AS total_flights,
       
--        (SELECT AVG(price) 
--         FROM flights f 
--         WHERE f.airline_id = a.airline_id) AS avg_price

-- FROM (SELECT DISTINCT airline_id FROM flights) a;






