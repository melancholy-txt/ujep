-- F1 databázové schéma s 11 tabulkami (normalizované s tabulkou countries)
USE f1;

-- 1. COUNTRIES tabulka - ukládá informace o zemích
CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL UNIQUE,
    country_code VARCHAR(3) NOT NULL UNIQUE, 
    continent VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. DRIVERS tabulka - ukládá informace o jezdcích
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    date_of_birth DATE NOT NULL,
    driver_number INT,
    championships_won INT DEFAULT 0,
    career_starts INT DEFAULT 0,
    career_wins INT DEFAULT 0,
    career_podiums INT DEFAULT 0,
    career_points DECIMAL(5,1) DEFAULT 0.0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- 3. TEAM_PRINCIPALS tabulka - ukládá informace o vedoucích týmů
CREATE TABLE team_principals (
    principal_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    date_of_birth DATE,
    years_of_experience INT DEFAULT 0,
    previous_teams TEXT, -- JSON nebo csv seznam předchozích týmů
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- 4. TEAMS (Konstruktéři) tabulka - ukládá informace o týmech/konstruktérech
CREATE TABLE teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(150),
    base_location VARCHAR(100),
    principal_id INT,
    founded_year INT,
    championships_won INT DEFAULT 0,
    total_wins INT DEFAULT 0,
    total_podiums INT DEFAULT 0,
    total_points DECIMAL(5,1) DEFAULT 0.0,
    is_active BOOLEAN DEFAULT TRUE,
    team_color VARCHAR(7), -- hex kód barvy
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (principal_id) REFERENCES team_principals(principal_id)
);

-- 5. TRACKS (Okruhy) tabulka - ukládá informace o okruzích
CREATE TABLE tracks (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    track_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    track_length_km DECIMAL(5,3) NOT NULL,
    number_of_turns INT NOT NULL,
    lap_record_time TIME,
    lap_record_holder_id INT,
    first_grand_prix_year INT,
    is_active BOOLEAN DEFAULT TRUE,
    track_type ENUM('permanent', 'street', 'temporary') DEFAULT 'permanent',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lap_record_holder_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- 6. SEASONS tabulka - ukládá informace o sezónách
CREATE TABLE seasons (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    year INT NOT NULL UNIQUE,
    number_of_races INT NOT NULL,
    drivers_champion_id INT,
    constructors_champion_id INT,
    season_start_date DATE,
    season_end_date DATE,
    total_points_awarded DECIMAL(10,1) DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (drivers_champion_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (constructors_champion_id) REFERENCES teams(team_id)
);

-- 7. RACES tabulka - ukládá informace o jednotlivých závodech
CREATE TABLE races (
    race_id INT PRIMARY KEY AUTO_INCREMENT,
    season_id INT NOT NULL,
    track_id INT NOT NULL,
    race_name VARCHAR(100) NOT NULL,
    race_date DATE NOT NULL,
    race_time TIME,
    round_number INT NOT NULL,
    total_laps INT NOT NULL,
    weather_conditions VARCHAR(50),
    safety_cars INT DEFAULT 0,
    red_flags INT DEFAULT 0,
    fastest_lap_time TIME,
    fastest_lap_driver_id INT,
    pole_position_driver_id INT,
    winner_driver_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (season_id) REFERENCES seasons(season_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (fastest_lap_driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (pole_position_driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (winner_driver_id) REFERENCES drivers(driver_id),
    UNIQUE KEY unique_season_round (season_id, round_number)
);

-- 8. TEAM_DRIVERS tabulka - spojovací tabulka pro vztahy jezdec-tým podle sezóny
CREATE TABLE team_drivers (
    team_driver_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT NOT NULL,
    driver_id INT NOT NULL,
    season_id INT NOT NULL,
    contract_start_date DATE,
    contract_end_date DATE,
    driver_number INT,
    is_reserve_driver BOOLEAN DEFAULT FALSE,
    salary_millions DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id),
    UNIQUE KEY unique_driver_season (driver_id, season_id, is_reserve_driver)
);

-- 9. RACE_RESULTS tabulka - ukládá detailní výsledky závodů pro každého jezdce
CREATE TABLE race_results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    race_id INT NOT NULL,
    driver_id INT NOT NULL,
    team_id INT NOT NULL,
    starting_position INT NOT NULL,
    finishing_position INT,
    points_earned DECIMAL(4,1) DEFAULT 0.0,    
    laps_completed INT NOT NULL,
    race_time TIME,
    time_gap VARCHAR(20), -- rozdíl času k vítězi (např. "+1.234s", "+1 kolo")
    fastest_lap_time TIME,
    pit_stops INT DEFAULT 0,
    dnf_reason VARCHAR(100), -- důvod nedokončení (Did Not Finish)
    disqualified BOOLEAN DEFAULT FALSE,
    disqualification_reason VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    UNIQUE KEY unique_race_driver (race_id, driver_id)
);

-- 10. ENGINES tabulka - ukládá informace o motorech/pohonných jednotkách
CREATE TABLE engines (
    engine_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer VARCHAR(50) NOT NULL,
    engine_name VARCHAR(100) NOT NULL,
    engine_type VARCHAR(50), -- např. "V6 Turbo Hybrid"
    first_used_year INT NOT NULL,
    last_used_year INT,
    horsepower INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 11. TEAM_ENGINES tabulka - spojovací tabulka pro vztahy tým-motor podle sezóny
CREATE TABLE team_engines (
    team_engine_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT NOT NULL,
    engine_id INT NOT NULL,
    season_id INT NOT NULL,
    is_manufacturer_team BOOLEAN DEFAULT FALSE, -- true pokud je tým zároveň výrobcem motoru
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (engine_id) REFERENCES engines(engine_id),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id),
    UNIQUE KEY unique_team_season_engine (team_id, season_id)
);

-- =====================================================
-- 2024 F1 SEASON DATA
-- =====================================================

-- Countries data (complete set for F1 2024)
INSERT INTO countries (country_name, country_code, continent) VALUES
('United Kingdom', 'GBR', 'Europe'),
('Netherlands', 'NLD', 'Europe'),
('Monaco', 'MCO', 'Europe'),
('Australia', 'AUS', 'Oceania'),
('Austria', 'AUT', 'Europe'),
('France', 'FRA', 'Europe'),
('Italy', 'ITA', 'Europe'),
('Spain', 'ESP', 'Europe'),
('Mexico', 'MEX', 'North America'),
('Canada', 'CAN', 'North America'),
('United States', 'USA', 'North America'),
('Japan', 'JPN', 'Asia'),
('China', 'CHN', 'Asia'),
('Thailand', 'THA', 'Asia'),
('Germany', 'DEU', 'Europe'),
('Finland', 'FIN', 'Europe'),
('Denmark', 'DNK', 'Europe'),
('New Zealand', 'NZL', 'Oceania'),
('Switzerland', 'CHE', 'Europe'),
('Belgium', 'BEL', 'Europe'),
('Brazil', 'BRA', 'South America'),
('Argentina', 'ARG', 'South America'),
('Saudi Arabia', 'SAU', 'Asia'),
('United Arab Emirates', 'ARE', 'Asia'),
('Singapore', 'SGP', 'Asia'),
('Hungary', 'HUN', 'Europe'),
('Azerbaijan', 'AZE', 'Asia'),
('Qatar', 'QAT', 'Asia');

-- Team Principals for 2024
INSERT INTO team_principals (first_name, last_name, country_id, date_of_birth, years_of_experience, previous_teams, is_active) VALUES
('Toto', 'Wolff', 5, '1972-01-12', 12, 'Williams (investor)', TRUE),
('Christian', 'Horner', 1, '1973-11-16', 19, 'Arden International', TRUE),
('Frédéric', 'Vasseur', 6, '1968-05-28', 25, 'Sauber, Alfa Romeo', TRUE),
('Andrea', 'Stella', 7, '1971-11-16', 20, 'Ferrari (engineer)', TRUE),
('Mike', 'Krack', 19, '1972-08-03', 15, 'BMW Sauber, Porsche', TRUE),
('James', 'Vowles', 1, '1979-11-01', 20, 'Mercedes (strategy)', TRUE),
('Ayao', 'Komatsu', 12, '1976-04-20', 15, 'Lotus, McLaren', TRUE),
('Alessandro', 'Alunni Bravi', 7, '1975-09-12', 18, 'Ferrari, Sauber', TRUE),
('Laurent', 'Mekies', 6, '1977-02-26', 22, 'Ferrari, FIA', TRUE),
('Franz', 'Tost', 5, '1956-01-14', 30, 'BMW, Gerhard Berger', TRUE);

-- Teams for 2024 season
INSERT INTO teams (team_name, full_name, base_location, principal_id, founded_year, championships_won, total_wins, total_podiums, total_points, is_active, team_color) VALUES
('Mercedes', 'Mercedes-AMG Petronas F1 Team', 'Brackley, UK', 1, 2010, 8, 125, 289, 6234.5, TRUE, '#00D2BE'),
('Red Bull Racing', 'Oracle Red Bull Racing', 'Milton Keynes, UK', 2, 2005, 6, 118, 234, 4856.0, TRUE, '#0600EF'),
('Ferrari', 'Scuderia Ferrari', 'Maranello, Italy', 3, 1950, 16, 245, 806, 9876.5, TRUE, '#DC143C'),
('McLaren', 'McLaren F1 Team', 'Woking, UK', 4, 1966, 8, 183, 494, 5234.5, TRUE, '#FF8700'),
('Aston Martin', 'Aston Martin Aramco F1 Team', 'Silverstone, UK', 5, 2021, 0, 1, 13, 234.0, TRUE, '#006F62'),
('Williams', 'Williams Racing', 'Grove, UK', 6, 1977, 9, 114, 313, 3456.5, TRUE, '#005AFF'),
('Haas', 'MoneyGram Haas F1 Team', 'Kannapolis, USA', 7, 2016, 0, 0, 8, 67.0, TRUE, '#FFFFFF'),
('Kick Sauber', 'Kick Sauber F1 Team', 'Hinwil, Switzerland', 8, 1993, 0, 1, 26, 378.0, TRUE, '#52E252'),
('Alpine', 'BWT Alpine F1 Team', 'Enstone, UK', 9, 1981, 2, 21, 73, 1456.5, TRUE, '#0090FF'),
('RB', 'Visa Cash App RB F1 Team', 'Faenza, Italy', 10, 1985, 0, 2, 5, 156.0, TRUE, '#6692FF');

-- 2024 F1 Drivers with accurate data
INSERT INTO drivers (first_name, last_name, country_id, date_of_birth, driver_number, championships_won, career_starts, career_wins, career_podiums, career_points, is_active) VALUES
('Max', 'Verstappen', 2, '1997-09-30', 1, 3, 184, 62, 107, 2987.5, TRUE),
('Lewis', 'Hamilton', 1, '1985-01-07', 44, 7, 350, 105, 195, 4634.5, TRUE),
('Charles', 'Leclerc', 3, '1997-10-16', 16, 0, 144, 5, 29, 1345.0, TRUE),
('Lando', 'Norris', 1, '1999-11-13', 4, 0, 124, 1, 13, 934.0, TRUE),
('Oscar', 'Piastri', 4, '2001-04-06', 81, 0, 44, 2, 5, 167.0, TRUE),
('George', 'Russell', 1, '1998-02-15', 63, 0, 114, 2, 13, 456.0, TRUE),
('Carlos', 'Sainz Jr.', 8, '1994-09-01', 55, 0, 204, 3, 23, 1234.5, TRUE),
('Sergio', 'Pérez', 9, '1990-01-26', 11, 0, 284, 6, 39, 1556.0, TRUE),
('Fernando', 'Alonso', 8, '1981-07-29', 14, 2, 394, 32, 106, 2223.0, TRUE),
('Lance', 'Stroll', 10, '1998-10-29', 18, 0, 154, 0, 3, 89.0, TRUE),
('Pierre', 'Gasly', 6, '1996-02-07', 10, 0, 144, 1, 4, 387.0, TRUE),
('Esteban', 'Ocon', 6, '1996-09-17', 31, 0, 134, 1, 3, 234.0, TRUE),
('Nico', 'Hülkenberg', 15, '1987-08-19', 27, 0, 224, 0, 0, 521.0, TRUE),
('Kevin', 'Magnussen', 17, '1992-10-05', 20, 0, 184, 0, 1, 178.0, TRUE),
('Valtteri', 'Bottas', 16, '1989-08-28', 77, 0, 234, 10, 67, 1897.0, TRUE),
('Zhou', 'Guanyu', 13, '1999-05-30', 24, 0, 66, 0, 1, 12.0, TRUE),
('Yuki', 'Tsunoda', 12, '2000-05-11', 22, 0, 88, 0, 0, 67.0, TRUE),
('Daniel', 'Ricciardo', 4, '1989-07-01', 3, 0, 254, 8, 32, 1329.0, TRUE),
('Logan', 'Sargeant', 11, '2000-12-31', 2, 0, 44, 0, 0, 1.0, TRUE),
('Alex', 'Albon', 14, '1996-03-23', 23, 0, 104, 0, 2, 234.0, TRUE);

-- 2024 F1 Tracks
INSERT INTO tracks (track_name, location, country_id, track_length_km, number_of_turns, lap_record_holder_id, first_grand_prix_year, is_active, track_type) VALUES
('Bahrain International Circuit', 'Sakhir', 23, 5.412, 15, 1, 2004, TRUE, 'permanent'),
('Jeddah Corniche Circuit', 'Jeddah', 23, 6.174, 27, 2, 2021, TRUE, 'street'),
('Albert Park Circuit', 'Melbourne', 4, 5.278, 14, 3, 1996, TRUE, 'permanent'),
('Suzuka International Racing Course', 'Suzuka', 12, 5.807, 18, 1, 1987, TRUE, 'permanent'),
('Shanghai International Circuit', 'Shanghai', 13, 5.451, 16, 1, 2004, TRUE, 'permanent'),
('Miami International Autodrome', 'Miami', 11, 5.412, 19, 1, 2022, TRUE, 'street'),
('Autodromo Enzo e Dino Ferrari', 'Imola', 7, 4.909, 19, 2, 1980, TRUE, 'permanent'),
('Circuit de Monaco', 'Monte Carlo', 3, 3.337, 19, 2, 1950, TRUE, 'street'),
('Circuit Gilles Villeneuve', 'Montreal', 10, 4.361, 14, 2, 1978, TRUE, 'temporary'),
('Circuit de Barcelona-Catalunya', 'Barcelona', 8, 4.675, 16, 1, 1991, TRUE, 'permanent'),
('Red Bull Ring', 'Spielberg', 5, 4.318, 10, 1, 1970, TRUE, 'permanent'),
('Silverstone Circuit', 'Silverstone', 1, 5.891, 18, 2, 1950, TRUE, 'permanent'),
('Hungaroring', 'Budapest', 26, 4.381, 14, 2, 1986, TRUE, 'permanent'),
('Circuit de Spa-Francorchamps', 'Spa', 20, 7.004, 19, 1, 1950, TRUE, 'permanent'),
('Circuit Zandvoort', 'Zandvoort', 2, 4.259, 14, 1, 1952, TRUE, 'permanent'),
('Autodromo Nazionale Monza', 'Monza', 7, 5.793, 11, 2, 1950, TRUE, 'permanent'),
('Baku City Circuit', 'Baku', 27, 6.003, 20, 3, 2016, TRUE, 'street'),
('Marina Bay Street Circuit', 'Singapore', 25, 5.063, 23, 2, 2008, TRUE, 'street'),
('Circuit of the Americas', 'Austin', 11, 5.513, 20, 3, 2012, TRUE, 'permanent'),
('Autódromo Hermanos Rodríguez', 'Mexico City', 9, 4.304, 17, 1, 1963, TRUE, 'permanent'),
('Interlagos', 'São Paulo', 21, 4.309, 15, 1, 1973, TRUE, 'permanent'),
('Las Vegas Strip Circuit', 'Las Vegas', 11, 6.201, 17, 1, 2023, TRUE, 'street'),
('Losail International Circuit', 'Lusail', 28, 5.380, 16, 1, 2021, TRUE, 'permanent'),
('Yas Marina Circuit', 'Abu Dhabi', 24, 5.281, 16, 1, 2009, TRUE, 'permanent');

-- 2024 F1 Engines
INSERT INTO engines (manufacturer, engine_name, engine_type, first_used_year, last_used_year, horsepower, is_active) VALUES
('Mercedes', 'M15 E Performance', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Honda RBPT', 'RA625H', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Ferrari', '066/12', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Renault', 'E-Tech RE24', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE);

-- 2024 Season
INSERT INTO seasons (year, number_of_races, drivers_champion_id, constructors_champion_id, season_start_date, season_end_date, total_points_awarded) VALUES
(2024, 24, 1, 2, '2024-03-02', '2024-12-08', 1205.0);

-- 2024 F1 Calendar (24 races)
INSERT INTO races (season_id, track_id, race_name, race_date, race_time, round_number, total_laps, weather_conditions, fastest_lap_driver_id, pole_position_driver_id, winner_driver_id) VALUES
(1, 1, 'Bahrain Grand Prix', '2024-03-02', '18:00:00', 1, 57, 'Clear', 1, 1, 1),
(1, 2, 'Saudi Arabian Grand Prix', '2024-03-09', '20:00:00', 2, 50, 'Clear', 1, 1, 1),
(1, 3, 'Australian Grand Prix', '2024-03-24', '15:00:00', 3, 58, 'Partly Cloudy', 3, 1, 3),
(1, 4, 'Japanese Grand Prix', '2024-04-07', '14:00:00', 4, 53, 'Clear', 1, 1, 1),
(1, 5, 'Chinese Grand Prix', '2024-04-21', '15:00:00', 5, 56, 'Overcast', 4, 1, 1),
(1, 6, 'Miami Grand Prix', '2024-05-05', '20:30:00', 6, 57, 'Sunny', 1, 1, 4),
(1, 7, 'Emilia Romagna Grand Prix', '2024-05-19', '15:00:00', 7, 63, 'Clear', 1, 1, 1),
(1, 8, 'Monaco Grand Prix', '2024-05-26', '15:00:00', 8, 78, 'Partly Cloudy', 3, 3, 3),
(1, 9, 'Canadian Grand Prix', '2024-06-09', '20:00:00', 9, 70, 'Clear', 1, 6, 1),
(1, 10, 'Spanish Grand Prix', '2024-06-23', '15:00:00', 10, 66, 'Sunny', 1, 1, 1),
(1, 11, 'Austrian Grand Prix', '2024-06-30', '15:00:00', 11, 71, 'Clear', 1, 1, 6),
(1, 12, 'British Grand Prix', '2024-07-07', '16:00:00', 12, 52, 'Rain', 2, 6, 2),
(1, 13, 'Hungarian Grand Prix', '2024-07-21', '15:00:00', 13, 70, 'Hot', 1, 4, 5),
(1, 14, 'Belgian Grand Prix', '2024-07-28', '15:00:00', 14, 44, 'Variable', 2, 3, 2),
(1, 15, 'Dutch Grand Prix', '2024-08-25', '15:00:00', 15, 72, 'Clear', 4, 4, 4),
(1, 16, 'Italian Grand Prix', '2024-09-01', '15:00:00', 16, 53, 'Clear', 3, 4, 3),
(1, 17, 'Azerbaijan Grand Prix', '2024-09-15', '13:00:00', 17, 51, 'Clear', 5, 3, 5),
(1, 18, 'Singapore Grand Prix', '2024-09-22', '20:00:00', 18, 62, 'Hot & Humid', 4, 4, 4),
(1, 19, 'United States Grand Prix', '2024-10-20', '21:00:00', 19, 56, 'Clear', 3, 4, 3),
(1, 20, 'Mexican Grand Prix', '2024-10-27', '21:00:00', 20, 71, 'Clear', 7, 7, 7),
(1, 21, 'Brazilian Grand Prix', '2024-11-03', '16:00:00', 21, 71, 'Rain', 1, 4, 1),
(1, 22, 'Las Vegas Grand Prix', '2024-11-23', '22:00:00', 22, 50, 'Cool', 6, 6, 6),
(1, 23, 'Qatar Grand Prix', '2024-12-01', '18:00:00', 23, 57, 'Clear', 1, 1, 1),
(1, 24, 'Abu Dhabi Grand Prix', '2024-12-08', '17:00:00', 24, 55, 'Clear', 4, 4, 4);

-- 2024 Team-Driver relationships
INSERT INTO team_drivers (team_id, driver_id, season_id, contract_start_date, contract_end_date, driver_number, is_reserve_driver) VALUES
-- Mercedes
(1, 2, 1, '2024-01-01', '2024-12-31', 44, FALSE),
(1, 6, 1, '2024-01-01', '2024-12-31', 63, FALSE),
-- Red Bull Racing
(2, 1, 1, '2024-01-01', '2024-12-31', 1, FALSE),
(2, 8, 1, '2024-01-01', '2024-12-31', 11, FALSE),
-- Ferrari
(3, 3, 1, '2024-01-01', '2024-12-31', 16, FALSE),
(3, 7, 1, '2024-01-01', '2024-12-31', 55, FALSE),
-- McLaren
(4, 4, 1, '2024-01-01', '2024-12-31', 4, FALSE),
(4, 5, 1, '2024-01-01', '2024-12-31', 81, FALSE),
-- Aston Martin
(5, 9, 1, '2024-01-01', '2024-12-31', 14, FALSE),
(5, 10, 1, '2024-01-01', '2024-12-31', 18, FALSE),
-- Williams
(6, 20, 1, '2024-01-01', '2024-12-31', 23, FALSE),
(6, 19, 1, '2024-01-01', '2024-12-31', 2, FALSE),
-- Haas
(7, 13, 1, '2024-01-01', '2024-12-31', 27, FALSE),
(7, 14, 1, '2024-01-01', '2024-12-31', 20, FALSE),
-- Kick Sauber
(8, 15, 1, '2024-01-01', '2024-12-31', 77, FALSE),
(8, 16, 1, '2024-01-01', '2024-12-31', 24, FALSE),
-- Alpine
(9, 11, 1, '2024-01-01', '2024-12-31', 10, FALSE),
(9, 12, 1, '2024-01-01', '2024-12-31', 31, FALSE),
-- RB
(10, 17, 1, '2024-01-01', '2024-12-31', 22, FALSE),
(10, 18, 1, '2024-01-01', '2024-12-31', 3, FALSE);

-- 2024 Team-Engine relationships
INSERT INTO team_engines (team_id, engine_id, season_id, is_manufacturer_team) VALUES
-- Mercedes teams
(1, 1, 1, TRUE),   -- Mercedes with Mercedes engine
(6, 1, 1, FALSE),  -- Williams with Mercedes engine
(5, 1, 1, FALSE),  -- Aston Martin with Mercedes
(4, 1, 1, FALSE),  -- McLaren with Renault
-- Red Bull teams  
(2, 2, 1, FALSE),  -- Red Bull Racing with Honda RBPT
(10, 2, 1, FALSE), -- RB with Honda RBPT
-- Ferrari teams
(3, 3, 1, TRUE),   -- Ferrari with Ferrari engine
(7, 3, 1, FALSE),  -- Haas with Ferrari engine
(8, 3, 1, FALSE),  -- Kick Sauber with Ferrari engine
-- Renault teams
(9, 4, 1, FALSE);  -- Alpine with Renault

-- Sample 2024 Race Results (First 5 races for demonstration)
-- Bahrain GP 2024
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(1, 1, 2, 1, 1, 25.0, 57, 'Winner'),
(1, 8, 2, 2, 2, 18.0, 57, '+22.457s'),
(1, 7, 3, 3, 3, 15.0, 57, '+31.928s'),
(1, 6, 1, 4, 4, 12.0, 57, '+39.217s'),
(1, 9, 5, 5, 5, 10.0, 57, '+47.294s'),
(1, 13, 7, 6, 6, 8.0, 57, '+1:12.171'),
(1, 2, 1, 7, 7, 6.0, 57, '+1:20.043'),
(1, 17, 10, 8, 8, 4.0, 57, '+1:31.055'),
(1, 9, 5, 9, 9, 2.0, 57, '+1:33.995'),
(1, 10, 5, 10, 10, 1.0, 57, '+1:38.235');

-- Saudi Arabian GP 2024
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(2, 1, 2, 1, 1, 25.0, 50, 'Winner'),
(2, 8, 2, 2, 2, 18.0, 50, '+7.865s'),
(2, 3, 3, 3, 3, 15.0, 50, '+18.639s'),
(2, 6, 1, 4, 4, 12.0, 50, '+32.211s'),
(2, 9, 5, 5, 5, 10.0, 50, '+39.208s'),
(2, 13, 7, 6, 6, 8.0, 50, '+54.825s'),
(2, 2, 1, 7, 7, 6.0, 50, '+1:02.234'),
(2, 17, 10, 8, 8, 4.0, 50, '+1:11.892'),
(2, 11, 9, 9, 9, 2.0, 50, '+1:23.987'),
(2, 14, 7, 10, 10, 1.0, 50, '+1:29.456');

-- Australian GP 2024
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(3, 7, 3, 1, 1, 25.0, 58, 'Winner'),
(3, 3, 3, 2, 2, 18.0, 58, '+2.366s'),
(3, 4, 4, 3, 3, 15.0, 58, '+12.533s'),
(3, 5, 4, 4, 4, 12.0, 58, '+15.974s'),
(3, 1, 2, 5, 5, 10.0, 58, '+17.421s'),
(3, 6, 1, 6, 6, 8.0, 58, '+23.894s'),
(3, 2, 1, 7, 7, 6.0, 58, '+30.127s'),
(3, 17, 10, 8, 8, 4.0, 58, '+45.321s'),
(3, 9, 5, 9, 9, 2.0, 58, '+52.987'),
(3, 10, 5, 10, 10, 1.0, 58, '+1:02.456');

-- Japanese GP 2024
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(4, 1, 2, 1, 1, 25.0, 53, 'Winner'),
(4, 8, 2, 2, 2, 18.0, 53, '+12.536s'),
(4, 7, 3, 3, 3, 15.0, 53, '+18.265s'),
(4, 3, 3, 4, 4, 12.0, 53, '+25.893s'),
(4, 4, 4, 5, 5, 10.0, 53, '+31.274s'),
(4, 6, 1, 6, 6, 8.0, 53, '+42.159s'),
(4, 9, 5, 7, 7, 6.0, 53, '+49.892s'),
(4, 2, 1, 8, 8, 4.0, 53, '+55.321s'),
(4, 13, 7, 9, 9, 2.0, 53, '+1:02.847'),
(4, 17, 10, 10, 10, 1.0, 53, '+1:08.234');

-- Chinese GP 2024
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(5, 1, 2, 1, 1, 25.0, 56, 'Winner'),
(5, 4, 4, 2, 2, 18.0, 56, '+13.736s'),
(5, 8, 2, 3, 3, 15.0, 56, '+18.902s'),
(5, 3, 3, 4, 4, 12.0, 56, '+28.535s'),
(5, 6, 1, 5, 5, 10.0, 56, '+35.892s'),
(5, 9, 5, 6, 6, 8.0, 56, '+42.761s'),
(5, 13, 7, 7, 7, 6.0, 56, '+48.329s'),
(5, 17, 10, 8, 8, 4.0, 56, '+54.892s'),
(5, 2, 1, 9, 9, 2.0, 56, '+1:01.234'),
(5, 11, 9, 10, 10, 1.0, 56, '+1:07.569');

