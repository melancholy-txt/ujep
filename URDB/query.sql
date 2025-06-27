CREATE OR REPLACE VIEW active_team_drivers AS
SELECT 
    d.driver_id,
    d.first_name,
    d.last_name,
    t.team_id,
    t.team_name,
    td.contract_start_date,
    td.contract_end_date
FROM drivers AS d
INNER JOIN team_drivers AS td
    ON d.driver_id = td.driver_id
INNER JOIN teams AS t
    ON td.team_id = t.team_id
WHERE YEAR(td.contract_start_date) = 2024  -- Show 2024 season contracts

SELECT * FROM active_team_drivers;

-- ######################################################################################################################


SELECT 
    d.first_name,                     
    d.last_name,                       
    adt.team_name,                                
    SUM(rr.points_earned) AS "total_points_earned"                 
FROM drivers AS d                       
INNER JOIN race_results AS rr          -- INNER JOIN: pouze jezdci s výsledky
    ON d.driver_id = rr.driver_id
LEFT JOIN active_team_drivers AS adt          -- LEFT JOIN: propojení jezdce s týmem ale i bez týmu
    ON d.driver_id = adt.driver_id 
WHERE rr.finishing_position <= 10   -- Pouze bodující pozice (top 10)
GROUP BY d.driver_id
ORDER BY SUM(rr.points_earned) DESC

-- ######################################################################################################################

SELECT 
    t.team_name,                     
    t.full_name,                     
    e.manufacturer,                  
    e.engine_name,
    tp.first_name,
    tp.last_name                  
FROM teams AS t                      
INNER JOIN team_engines AS te        
    ON t.team_id = te.team_id
LEFT JOIN engines AS e               
    ON te.engine_id = e.engine_id
LEFT JOIN seasons AS s               
    ON te.season_id = s.season_id
RIGHT JOIN team_principals AS tp      -- RIGHT JOIN: i neaktivní ředitelé
   on t.principal_id = tp.principal_id
ORDER BY t.team_name ASC;

-- ######################################################################################################################

SELECT 
    t.team_name,
    t.founded_year,
    t.championships_won,
    FLOOR(COUNT(rr.result_id) / 2) AS "race_entries",
    SUM(rr.points_earned) AS "total_points_2024",
    AVG(rr.finishing_position) AS "avg_position"
FROM teams AS t
LEFT JOIN active_team_drivers AS atd  -- Connect teams to active drivers (2024)
    ON t.team_id = atd.team_id
LEFT JOIN race_results AS rr          -- Connect drivers to race results
    ON atd.driver_id = rr.driver_id
WHERE t.is_active = TRUE
GROUP BY t.team_id
HAVING COUNT(rr.result_id) > 1 
ORDER BY t.championships_won DESC;

-- ######################################################################################################################

-- vnořené selekty místo joinu aby jsem se vyhnul duplicitním hodnotám při COUNT

CREATE OR REPLACE VIEW country_statistics AS
SELECT 
    c.country_name,
    c.continent,
    (SELECT COUNT(*) FROM drivers AS d WHERE d.country_id = c.country_id) AS "drivers",
    (SELECT COUNT(*) FROM team_principals tp WHERE tp.country_id = c.country_id) AS "team_principals",
    (SELECT COUNT(*) FROM tracks t WHERE t.country_id = c.country_id) AS "total_tracks"
FROM countries AS c
WHERE (SELECT COUNT(*) FROM drivers d WHERE d.country_id = c.country_id) > 0
   OR (SELECT COUNT(*) FROM team_principals tp WHERE tp.country_id = c.country_id) > 0
   OR (SELECT COUNT(*) FROM tracks t WHERE t.country_id = c.country_id) > 0
ORDER BY c.country_name ASC;

SELECT * FROM country_statistics

-- ######################################################################################################################


-- Kdo vyhrál závod
SELECT d.first_name, d.last_name FROM race_results AS rr
JOIN drivers AS d ON rr.driver_id = d.driver_id
WHERE race_id = ? AND finishing_position = 1;

-- Pole position
SELECT d.first_name, d.last_name FROM race_results AS rr
JOIN drivers AS d ON rr.driver_id = d.driver_id
WHERE race_id = ? AND starting_position = 1;

-- Leader šampionátu jezdců
SELECT 
    d.driver_id, 
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    atd.team_name,
    SUM(points_earned) AS total_points 
FROM race_results AS rr 
JOIN races AS r ON rr.race_id = r.race_id 
JOIN drivers AS d ON rr.driver_id = d.driver_id
JOIN active_team_drivers AS atd ON rr.driver_id = atd.driver_id 
WHERE r.season_id = ? 
GROUP BY rr.driver_id 
ORDER BY total_points DESC;

-- Leader šampionátu týmů
SELECT 
    atd.team_id,
    atd.team_name,
    SUM(points_earned) AS total_points 
FROM race_results AS rr 
JOIN races AS r ON rr.race_id = r.race_id 
JOIN drivers AS d ON rr.driver_id = d.driver_id
JOIN active_team_drivers AS atd ON rr.driver_id = atd.driver_id 
WHERE r.season_id = ? 
GROUP BY atd.team_id
ORDER BY total_points DESC;


