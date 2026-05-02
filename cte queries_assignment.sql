-- 1.Write a query using a CTE to retrieve all flights with price greater than 500.
-- WITH high_price AS (
--     SELECT *
--     FROM flights
--     WHERE price > 500
-- )
-- SELECT h.flight_id, a.airline_name, h.source, h.destination, h.price
-- FROM high_price h
-- JOIN airlines a
-- ON h.airline_id = a.airline_id

-- 2.Use a CTE to join airlines and flights and display airline name, source, destination, and price
-- with flight_details as( select  f.source,f.destination,f.price,a.airline_name 
-- from flights f
-- join airlines a
-- on f.airline_id=a.airline_id)
-- select source,destination,price,airline_name from flight_details

-- 3.Write a CTE to calculate the average flight price per airline.
-- with avg_flight as(select f.AIRLINE_ID, avg(price) 
-- from flights f group by f.airline_id)
-- select * from 

-- 4.Using a CTE, find airlines whose average flight price is greater than 700.
-- with avg_flight as(select avg(price) as avg_price 
-- from flights)
-- select * from avg_flight where avg_price > 700 
 
--  5.Create a CTE to rank flights within each airline based on price (highest to lowest).
-- with ranked as (select airline_id ,flight_id,price, 
-- rank() over(partition by airline_id order by price desc) as rank_price from flights)
-- select * from ranked

-- 6.Use a CTE to find the most expensive flight for each airline.
-- with expensive as (select airline_id,max(price) as expensive_price from flights group by airline_id)
-- select * from expensive

-- 7.Use a CTE to identify duplicate flights based on source, destination, and departure_time.
-- with duplicate as(select source,destination,departure_time,count(*) 
-- from flights 
-- group by source,destination,departure_time
--  having count(*)>1)
--  select * from duplicate

-- 8.Write a recursive CTE to display possible flight paths starting from a given city.

-- WITH flight_path (source, destination, path) AS (
--     SELECT source, destination, source || '->' || destination
--     FROM flights
--     WHERE source = 'delhi'

--     UNION ALL

--     SELECT f.source, f.destination, fp.path || '->' || f.destination
--     FROM flights f
--     JOIN flight_path fp
--     ON f.source = fp.destination
-- )
-- SELECT * FROM flight_path;
 
-- 9.Write a CTE to calculate a running total of flight prices per airline ordered by departure time.
-- WITH total_running AS (
--     SELECT airline_id,departure_time,price,SUM(price) OVER (PARTITION BY airline_id 
--         ORDER BY departure_time
--      ) 
--      AS running_total
--     FROM flights
-- )
-- SELECT * FROM total_running;

-- 10.Use multiple CTEs to:
-- Count total flights per airline
-- Calculate average price per airline
-- Display both results together
-- with total_flights as(
--     select airline_id ,count(*) 
--     from flights 
--     group by airline_id),
-- avg_price as(
--     select airline_id,avg(price) as avg_price
--     from flights
--      group by airline_id) 
--      select t.airline_id,t.total_flights,a.avg_price from total_flights t 
--      join avg_price a 
--      on t.airline_id=a.airline_id

 