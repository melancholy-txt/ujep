SELECT 
    d.first_name,                     
    d.last_name,                       
    t.team_name,                                
    SUM(rr.points_earned) AS "total_points_earned"                 
FROM drivers AS d                       
INNER JOIN race_results AS rr          -- INNER JOIN: pouze jezdci s výsledky
    ON d.driver_id = rr.driver_id
LEFT JOIN teams AS t                    -- LEFT JOIN: všechny týmy (i když nemají výsledky)
    ON rr.team_id = t.team_id
WHERE rr.finishing_position <= 10   -- Pouze body bodující pozice (top 10)
GROUP BY d.driver_id
ORDER BY "total_points_earned" DESC     

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
    COUNT(rr.result_id) AS "race_entries",
    SUM(rr.points_earned) AS "total_points_2024",
    AVG(rr.finishing_position) AS "avg_position"
FROM teams AS t
LEFT JOIN race_results AS rr
    ON t.team_id = rr.team_id
LEFT JOIN races AS r
    ON rr.race_id = r.race_id
LEFT JOIN seasons AS s
    ON r.season_id = s.season_id AND s.year = 2024
WHERE t.is_active = TRUE
GROUP BY t.team_id
ORDER BY t.championships_won DESC;

-- ######################################################################################################################

-- vnořené selekty místo joinu aby jsem se vyhnul duplicitním hodnotám při COUNT

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
ORDER BY c.country_name ASC



