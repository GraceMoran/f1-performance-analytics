-- ==========================================
-- Formula 1 Performance Analytics
-- Milestone 2: GROUP BY and JOINs
-- ==========================================


-- Count drivers by nationality

SELECT nationality,
       COUNT(*) AS driver_count
FROM drivers
GROUP BY nationality;


-- Count drivers by nationality (highest first)

SELECT nationality,
       COUNT(*) AS driver_count
FROM drivers
GROUP BY nationality
ORDER BY driver_count DESC;


-- Top 5 nationalities

SELECT nationality,
       COUNT(*) AS driver_count
FROM drivers
GROUP BY nationality
ORDER BY driver_count DESC
LIMIT 5;


-- Exclude missing nationalities

SELECT nationality,
       COUNT(*) AS driver_count
FROM drivers
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY driver_count DESC;


-- Check whether base_team_id contains data

SELECT *
FROM teams
WHERE base_team_id IS NOT NULL;


-- Count teams with a primary colour

SELECT COUNT(*) AS coloured_teams
FROM teams
WHERE primary_color IS NOT NULL;


-- First JOIN
-- Show drivers, team IDs and seasons

SELECT d.forename,
       d.surname,
       td.team_id,
       td.season_id
FROM drivers AS d
JOIN team_driver AS td
    ON d.id = td.driver_id
LIMIT 10;


-- Second JOIN
-- Replace team IDs with team names

SELECT d.forename,
       d.surname,
       t.name AS team_name,
       td.season_id
FROM drivers AS d
JOIN team_driver AS td
    ON d.id = td.driver_id
JOIN teams AS t
    ON td.team_id = t.id
LIMIT 10;


-- Show all Ferrari driver records

SELECT d.forename,
       d.surname,
       t.name AS team_name,
       td.season_id
FROM drivers AS d
JOIN team_driver AS td
    ON d.id = td.driver_id
JOIN teams AS t
    ON td.team_id = t.id
WHERE t.name = 'Ferrari';


-- Show unique drivers who have driven for Ferrari

SELECT DISTINCT d.forename,
                d.surname
FROM drivers AS d
JOIN team_driver AS td
    ON d.id = td.driver_id
JOIN teams AS t
    ON td.team_id = t.id
WHERE t.name = 'Ferrari'
ORDER BY d.surname;


-- Count unique Ferrari drivers

SELECT COUNT(DISTINCT d.id) AS driver_count
FROM drivers AS d
JOIN team_driver AS td
    ON d.id = td.driver_id
JOIN teams AS t
    ON td.team_id = t.id
WHERE t.name = 'Ferrari';