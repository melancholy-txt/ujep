-- Průměrný počet záznamů na jednu tabulku v DB
SELECT AVG(row_count) AS average_rows_per_table
FROM (
    SELECT COUNT(*) AS row_count FROM countries
    UNION ALL SELECT COUNT(*) FROM drivers
    UNION ALL SELECT COUNT(*) FROM team_principals
    UNION ALL SELECT COUNT(*) FROM teams
    UNION ALL SELECT COUNT(*) FROM tracks
    UNION ALL SELECT COUNT(*) FROM seasons
    UNION ALL SELECT COUNT(*) FROM races
    UNION ALL SELECT COUNT(*) FROM team_drivers
    UNION ALL SELECT COUNT(*) FROM race_results
    UNION ALL SELECT COUNT(*) FROM incidents
    UNION ALL SELECT COUNT(*) FROM engines
    UNION ALL SELECT COUNT(*) FROM team_engines
) AS table_counts;

-- Piloti kteří mají více vítězství než průměr
SELECT 
    CONCAT(first_name," ", last_name) AS name,
    career_wins
FROM drivers
WHERE career_wins > (
    SELECT AVG(career_wins) FROM drivers
)
ORDER BY career_wins DESC;

-- Analytická funkce (RANK, SUM OVER) spolu s GROUP BY
-- Zobrazí celkové body pilota, pořadí pilotů podle bodů,
-- a procentuální podíl na celkových bodech všech pilotů
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    COUNT(*) AS races_participated,
    SUM(rr.points_earned) AS total_points,
    RANK() OVER (ORDER BY SUM(rr.points_earned) DESC) AS points_ranking,
    ROUND(SUM(rr.points_earned) / SUM(SUM(rr.points_earned)) OVER () * 100, 2) AS percentage_of_total_points,
    SUM(SUM(rr.points_earned)) OVER (ORDER BY SUM(rr.points_earned) DESC) AS cumulative_points
FROM race_results rr
JOIN drivers d ON rr.driver_id = d.driver_id
GROUP BY d.driver_id, d.first_name, d.last_name
ORDER BY total_points DESC;


-- SELF JOIN - zobrazí ředitele a jeho mentora
SELECT 
    CONCAT(tp.first_name, ' ', tp.last_name) AS principal_name,
    CONCAT(mentor.first_name, ' ', mentor.last_name) AS mentor_name,
    tp.years_of_experience,
    mentor.years_of_experience AS mentor_experience
FROM team_principals tp
LEFT JOIN team_principals mentor ON tp.mentor_principal_id = mentor.principal_id
ORDER BY mentor_name, principal_name;

-- VIEW - přehled týmů s řediteli a motory
-- Spojuje 4 tabulky: teams, team_principals, engines, team_engines
-- Používá různé typy JOINů: INNER JOIN, LEFT JOIN, RIGHT JOIN
CREATE OR REPLACE VIEW v_team_overview AS
SELECT 
    t.team_name,
    t.base_location,
    t.founded_year,
    t.championships_won,
    t.team_color,
    CONCAT(tp.first_name, ' ', tp.last_name) AS principal_name,
    tp.years_of_experience AS principal_experience,
    e.manufacturer AS engine_manufacturer,
    e.horsepower
FROM teams t
LEFT JOIN team_principals tp ON t.principal_id = tp.principal_id
INNER JOIN team_engines te ON t.team_id = te.team_id
RIGHT JOIN engines e ON te.engine_id = e.engine_id
WHERE t.is_active = true;

-- Test VIEW
SELECT * FROM v_team_overview
ORDER BY championships_won DESC;

-- INDEXY

-- 1. Unikátní kompozitní index - zajistí, že pilot může mít pouze jeden aktivní kontrakt s týmem
-- (netriviální - kombinace více sloupců s podmínkou)
CREATE UNIQUE INDEX idx_active_driver_contract 
ON team_drivers (driver_id, team_id, contract_end_date);

-- 2. Fulltextový index - pro vyhledávání v textu předchozích týmů ředitelů
ALTER TABLE team_principals ADD FULLTEXT INDEX idx_fulltext_previous_teams (previous_teams);

-- Příklad použití fulltextového indexu
SELECT 
    CONCAT(first_name, ' ', last_name) AS principal_name,
    previous_teams
FROM team_principals
WHERE MATCH(previous_teams) AGAINST('Ferrari' IN NATURAL LANGUAGE MODE);

-- FUNCTION - výpočet celkových bodů pilota v dané sezóně
DELIMITER //
CREATE FUNCTION fn_driver_season_points(
    p_driver_id INT,
    p_season_year INT
) 
RETURNS DECIMAL(6,1)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total_points DECIMAL(6,1);
    
    SELECT COALESCE(SUM(rr.points_earned), 0)
    INTO v_total_points
    FROM race_results rr
    INNER JOIN races r ON rr.race_id = r.race_id
    INNER JOIN seasons s ON r.season_id = s.season_id
    WHERE rr.driver_id = p_driver_id
      AND s.year = p_season_year;
    
    RETURN v_total_points;
END //
DELIMITER ;

-- Příklady použití funkce
-- Získání bodů konkrétního pilota v sezóně 2024
SELECT fn_driver_season_points(1, 2024) AS driver_1_points_2024;

-- Použití funkce ve výpisu všech pilotů
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    fn_driver_season_points(d.driver_id, 2024) AS season_points
FROM drivers d
WHERE d.is_active = true
ORDER BY season_points DESC;

-- PROCEDURE s CURSOR, HANDLER a TRANSACTION
-- Spočítá počet závodů a průměrné body na závod pro každý tým
DELIMITER ;;

CREATE PROCEDURE sp_team_race_stats()
BEGIN
    -- Proměnné pro cursor
    DECLARE v_team_id INT;
    DECLARE v_team_name VARCHAR(100);
    DECLARE v_done INT DEFAULT FALSE;
    DECLARE v_race_count INT;
    DECLARE v_avg_points DECIMAL(5,2);
    DECLARE v_error_occurred INT DEFAULT FALSE;
    
    -- CURSOR - prochází aktivní týmy
    DECLARE cur_teams CURSOR FOR
        SELECT team_id, team_name
        FROM teams
        WHERE is_active = true;
    
    -- HANDLER - konec dat
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    
    -- HANDLER - ošetření SQL chyb s ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_error_occurred = TRUE;
        ROLLBACK;
        SELECT 'Nastala chyba - transakce byla vrácena zpět (ROLLBACK)' AS error_message;
    END;
    
    -- START TRANSACTION - začátek transakce
    START TRANSACTION;
    
    -- Dočasná tabulka pro výsledky
    DROP TEMPORARY TABLE IF EXISTS tmp_team_stats;
    CREATE TEMPORARY TABLE tmp_team_stats (
        team_name VARCHAR(100),
        total_races INT,
        avg_points_per_race DECIMAL(5,2)
    );
    
    -- SAVEPOINT - záchytný bod před zpracováním dat
    SAVEPOINT before_processing;
    
    OPEN cur_teams;
    
    read_loop: LOOP
        FETCH cur_teams INTO v_team_id, v_team_name;
        
        IF v_done THEN
            LEAVE read_loop;
        END IF;
        
        -- Výpočet statistik pro tým (z race_results přes team_drivers)
        SELECT 
            COUNT(DISTINCT rr.race_id),
            COALESCE(AVG(rr.points_earned), 0)
        INTO v_race_count, v_avg_points
        FROM race_results rr
        INNER JOIN team_drivers td ON rr.driver_id = td.driver_id
        WHERE td.team_id = v_team_id;
        
        -- Pokud by nastala chyba zde, můžeme se vrátit k SAVEPOINT
        INSERT INTO tmp_team_stats VALUES (v_team_name, v_race_count, v_avg_points);
    END LOOP;
    
    CLOSE cur_teams;
    
    -- COMMIT - potvrzení transakce pokud vše proběhlo v pořádku
    COMMIT;
    
    SELECT * FROM tmp_team_stats ORDER BY avg_points_per_race DESC;
    
END ;;
DELIMITER ;

-- Volání procedury
CALL sp_team_race_stats();

-- TEST TRANSACTION v proceduře sp_team_race_stats
-- Normální volání - transakce proběhne úspěšně (COMMIT)
CALL sp_team_race_stats();

-- Pro test ROLLBACK - dočasně zrušíme tabulku teams a zavoláme proceduru
DROP TABLE IF EXISTS teams_backup;
CREATE TABLE teams_backup AS SELECT * FROM teams;

-- Simulace chyby - přejmenujeme tabulku (procedura ji nenajde)
RENAME TABLE teams TO teams_hidden;

-- Toto volání selže a provede ROLLBACK
CALL sp_team_race_stats();

-- Obnovení tabulky
RENAME TABLE teams_hidden TO teams;


-- TRIGGER - logování změn v tabulce drivers
-- Vytvoří log tabulku a trigger pro sledování UPDATE operací

-- Tabulka pro ukládání logu změn
CREATE TABLE IF NOT EXISTS drivers_audit_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT NOT NULL,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    old_values TEXT,
    new_values TEXT,
    changed_by VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER ;;

-- Trigger pro UPDATE - zaznamená změny v tabulce drivers
CREATE TRIGGER trg_drivers_after_update
AFTER UPDATE ON drivers
FOR EACH ROW
BEGIN
    INSERT INTO drivers_audit_log (
        driver_id,
        action_type,
        old_values,
        new_values,
        changed_by,
        changed_at
    ) VALUES (
        OLD.driver_id,
        'UPDATE',
        CONCAT_WS(', ',
            CONCAT('first_name: ', OLD.first_name),
            CONCAT('last_name: ', OLD.last_name),
            CONCAT('driver_number: ', OLD.driver_number),
            CONCAT('career_wins: ', OLD.career_wins),
            CONCAT('career_points: ', OLD.career_points),
            CONCAT('is_active: ', OLD.is_active)
        ),
        CONCAT_WS(', ',
            CONCAT('first_name: ', NEW.first_name),
            CONCAT('last_name: ', NEW.last_name),
            CONCAT('driver_number: ', NEW.driver_number),
            CONCAT('career_wins: ', NEW.career_wins),
            CONCAT('career_points: ', NEW.career_points),
            CONCAT('is_active: ', NEW.is_active)
        ),
        CURRENT_USER(),
        NOW()
    );
END ;;

-- Trigger pro DELETE - zaznamená smazání pilota
CREATE TRIGGER trg_drivers_after_delete
AFTER DELETE ON drivers
FOR EACH ROW
BEGIN
    INSERT INTO drivers_audit_log (
        driver_id,
        action_type,
        old_values,
        new_values,
        changed_by,
        changed_at
    ) VALUES (
        OLD.driver_id,
        'DELETE',
        CONCAT_WS(', ',
            CONCAT('first_name: ', OLD.first_name),
            CONCAT('last_name: ', OLD.last_name),
            CONCAT('driver_number: ', OLD.driver_number)
        ),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END ;;

DELIMITER ;

-- Test triggeru - aktualizace pilota
UPDATE drivers SET career_wins = career_wins + 1 WHERE driver_id = 1;

-- Zobrazení logu změn
SELECT * FROM drivers_audit_log ORDER BY changed_at DESC;



-- USER & ROLE MANAGEMENT

-- Vytvoření uživatele
CREATE USER 'f1_viewer'@'localhost' IDENTIFIED BY 'heslo123';
CREATE USER 'f1_editor'@'localhost' IDENTIFIED BY 'heslo456';

-- Zobrazení existujících uživatelů
SELECT User, Host FROM mysql.user WHERE User LIKE 'f1_%';

-- Vytvoření rolí (MySQL 8.0+)
CREATE ROLE 'role_readonly';
CREATE ROLE 'role_editor';

-- Přidělení oprávnění rolím
-- role_readonly - pouze čtení
GRANT SELECT ON f1_database.* TO 'role_readonly';

-- role_editor - čtení + úpravy
GRANT SELECT, INSERT, UPDATE, DELETE ON f1_database.* TO 'role_editor';

-- Přiřazení rolí uživatelům
GRANT 'role_readonly' TO 'f1_viewer'@'localhost';
GRANT 'role_editor' TO 'f1_editor'@'localhost';

-- Aktivace výchozí role pro uživatele
SET DEFAULT ROLE 'role_readonly' TO 'f1_viewer'@'localhost';
SET DEFAULT ROLE 'role_editor' TO 'f1_editor'@'localhost';

-- Alternativa - přímé přidělení oprávnění (bez rolí)
-- GRANT SELECT ON f1_database.* TO 'f1_viewer'@'localhost';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON f1_database.* TO 'f1_editor'@'localhost';

-- Zobrazení oprávnění uživatele
SHOW GRANTS FOR 'f1_viewer'@'localhost';
SHOW GRANTS FOR 'f1_editor'@'localhost';

-- Odebrání oprávnění
REVOKE 'role_readonly' FROM 'f1_viewer'@'localhost';

-- Odstranění role
DROP ROLE 'role_readonly';
DROP ROLE 'role_editor';

-- Odstranění uživatele
DROP USER 'f1_viewer'@'localhost';
DROP USER 'f1_editor'@'localhost';

-- Ověření smazání
SELECT User, Host FROM mysql.user WHERE User LIKE 'f1_%';


-- TABLE LOCKING


-- Zamčení tabulky pro čtení (READ LOCK)
-- Ostatní mohou číst, ale nikdo (ani my) nemůže zapisovat
LOCK TABLES drivers READ;

-- Test - čtení funguje
SELECT * FROM drivers LIMIT 3;

-- Test - zápis NEFUNGUJE (ani pro nás)
-- UPDATE drivers SET career_wins = 0 WHERE driver_id = 1;  -- Toto by vyhodilo chybu

-- Odemčení
UNLOCK TABLES;

-- Zamčení tabulky pro zápis (WRITE LOCK)
-- Pouze my můžeme číst i zapisovat, ostatní čekají
LOCK TABLES drivers WRITE;

-- Teď můžeme číst i zapisovat
SELECT * FROM drivers LIMIT 3;
UPDATE drivers SET career_wins = career_wins WHERE driver_id = 1;  -- OK

-- Odemčení
UNLOCK TABLES;

-- Zamčení více tabulek najednou
LOCK TABLES 
    drivers READ,
    teams WRITE,
    race_results READ;

-- Práce s tabulkami...
SELECT COUNT(*) FROM drivers;
SELECT COUNT(*) FROM teams;

UNLOCK TABLES;


-- ============================================
-- TEST ZAMYKÁNÍ ZE DVOU SESSIONS
-- ============================================
-- 
-- SESSION 1 (první terminál):
-- mysql -u root -p
-- USE f1_database;
-- LOCK TABLES drivers WRITE;
-- SELECT 'Tabulka drivers je zamčená' AS status;
-- -- Nechte toto okno otevřené (nezadávejte UNLOCK)
--
-- SESSION 2 (druhý terminál):
-- mysql -u root -p
-- USE f1_database;
-- SELECT * FROM drivers LIMIT 1;  -- Toto ČEKÁ, dokud Session 1 neuvolní zámek
--
-- Zpět v SESSION 1:
-- UNLOCK TABLES;  -- Session 2 nyní dostane odpověď
--
-- ============================================

-- Zobrazení aktuálních zámků (diagnostika)
SHOW OPEN TABLES WHERE In_use > 0;

-- Zobrazení čekajících procesů
SHOW PROCESSLIST;

-- Timeout pro čekání na zámek (v sekundách)
SET SESSION innodb_lock_wait_timeout = 10;

-- Pokud zámek není uvolněn do 10 sekund, vrátí chybu
