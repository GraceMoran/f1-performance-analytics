-- Show all drivers
SELECT *
FROM drivers;

-- Show selected columns
SELECT forename,
       surname,
       nationality
FROM drivers;

-- Show Italian drivers
SELECT forename,
       surname,
       nationality
FROM drivers
WHERE nationality = 'Italian';

-- Show British drivers alphabetically
SELECT forename,
       surname,
       nationality
FROM drivers
WHERE nationality = 'British'
ORDER BY surname;

-- Count British drivers
SELECT COUNT(*)
FROM drivers
WHERE nationality = 'British';