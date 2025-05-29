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

-- Přidání vzorových dat pro demonstraci struktury

-- Vzorové země (25 zemí)
INSERT INTO countries (country_name, country_code, continent) VALUES
('United Kingdom', 'GBR', 'Europe'),
('Netherlands', 'NLD', 'Europe'),
('Monaco', 'MCO', 'Europe'),
('Australia', 'AUS', 'Oceania'),
('Austria', 'AUT', 'Europe'),
('France', 'FRA', 'Europe'),
('Italy', 'ITA', 'Europe'),
('Luxembourg', 'LUX', 'Europe'),
('Belgium', 'BEL', 'Europe'),
('Japan', 'JPN', 'Asia'),
('Germany', 'DEU', 'Europe'),
('Spain', 'ESP', 'Europe'),
('Brazil', 'BRA', 'South America'),
('Mexico', 'MEX', 'North America'),
('Canada', 'CAN', 'North America'),
('United States', 'USA', 'North America'),
('Singapore', 'SGP', 'Asia'),
('Hungary', 'HUN', 'Europe'),
('Czech Republic', 'CZE', 'Europe'),
('Poland', 'POL', 'Europe'),
('Finland', 'FIN', 'Europe'),
('Sweden', 'SWE', 'Europe'),
('Denmark', 'DNK', 'Europe'),
('Switzerland', 'CHE', 'Europe'),
('Argentina', 'ARG', 'South America');

-- Vzorový jezdci (25 jezdců)
INSERT INTO drivers (first_name, last_name, country_id, date_of_birth, driver_number, championships_won, career_starts, career_wins, career_podiums, is_active) VALUES
('Lewis', 'Hamilton', 1, '1985-01-07', 44, 7, 350, 105, 195, TRUE),
('Max', 'Verstappen', 2, '1997-09-30', 1, 3, 180, 56, 98, TRUE),
('Charles', 'Leclerc', 3, '1997-10-16', 16, 0, 140, 5, 29, TRUE),
('Lando', 'Norris', 1, '1999-11-13', 4, 0, 120, 1, 13, TRUE),
('Oscar', 'Piastri', 4, '2001-04-06', 81, 0, 44, 2, 5, TRUE),
('George', 'Russell', 1, '1998-02-15', 63, 0, 110, 2, 13, TRUE),
('Carlos', 'Sainz Jr.', 12, '1994-09-01', 55, 0, 200, 3, 23, TRUE),
('Sergio', 'Pérez', 14, '1990-01-26', 11, 0, 280, 6, 39, TRUE),
('Fernando', 'Alonso', 12, '1981-07-29', 14, 2, 390, 32, 106, TRUE),
('Lance', 'Stroll', 15, '1998-10-29', 18, 0, 150, 0, 3, TRUE),
('Pierre', 'Gasly', 6, '1996-02-07', 10, 0, 140, 1, 4, TRUE),
('Esteban', 'Ocon', 6, '1996-09-17', 31, 0, 130, 1, 3, TRUE),
('Nico', 'Hülkenberg', 11, '1987-08-19', 27, 0, 220, 0, 0, TRUE),
('Kevin', 'Magnussen', 23, '1992-10-05', 20, 0, 180, 0, 1, TRUE),
('Valtteri', 'Bottas', 21, '1989-08-28', 77, 0, 230, 10, 67, TRUE),
('Zhou', 'Guanyu', 20, '1999-05-30', 24, 0, 66, 0, 1, TRUE),
('Yuki', 'Tsunoda', 10, '2000-05-11', 22, 0, 88, 0, 0, TRUE),
('Daniel', 'Ricciardo', 4, '1989-07-01', 3, 0, 250, 8, 32, TRUE),
('Logan', 'Sargeant', 16, '2000-12-31', 2, 0, 44, 0, 0, TRUE),
('Alex', 'Albon', 24, '1996-03-23', 23, 0, 100, 0, 2, TRUE),
('Sebastian', 'Vettel', 11, '1987-07-03', 5, 4, 299, 53, 122, FALSE),
('Kimi', 'Räikkönen', 21, '1979-10-17', 7, 1, 349, 21, 103, FALSE),
('Jenson', 'Button', 1, '1980-01-19', 22, 1, 306, 15, 50, FALSE),
('Felipe', 'Massa', 13, '1981-04-25', 19, 0, 269, 11, 41, FALSE),
('Rubens', 'Barrichello', 13, '1972-05-23', 23, 0, 322, 11, 68, FALSE),
('Josef', 'Král', 19, '1990-06-30', 56, 0, 0, 0, 0, FALSE),
('Tomáš', 'Enge', 19, '1976-09-11', 9, 0, 1, 0, 0, FALSE);


-- Vzorový vedoucí týmů (25 vedoucích)
INSERT INTO team_principals (first_name, last_name, country_id, date_of_birth, years_of_experience, previous_teams, is_active) VALUES
('Toto', 'Wolff', 5, '1972-01-12', 12, 'Williams (investor)', TRUE),
('Christian', 'Horner', 1, '1973-11-16', 19, 'Arden International', TRUE),
('Frédéric', 'Vasseur', 6, '1968-05-28', 25, 'Sauber, Alfa Romeo', TRUE),
('Andrea', 'Stella', 7, '1971-11-16', 20, 'Ferrari (engineer)', TRUE),
('Mike', 'Krack', 8, '1972-08-03', 15, 'BMW Sauber, Porsche', TRUE),
('James', 'Vowles', 1, '1979-11-01', 20, 'Mercedes (strategy)', TRUE),
('Ayao', 'Komatsu', 10, '1976-04-20', 15, 'Lotus, McLaren', TRUE),
('Alessandro', 'Alunni Bravi', 7, '1975-09-12', 18, 'Ferrari, Sauber', TRUE),
('Franz', 'Tost', 5, '1956-01-14', 30, 'BMW, Gerhard Berger', FALSE),
('Günther', 'Steiner', 7, '1965-04-07', 25, 'Red Bull, Jaguar', FALSE),
('Mattia', 'Binotto', 24, '1969-11-03', 28, 'Ferrari (engineer)', FALSE),
('Cyril', 'Abiteboul', 6, '1977-10-14', 20, 'Caterham, Renault', FALSE),
('Otmar', 'Szafnauer', 16, '1964-10-30', 25, 'Force India, Aston Martin', FALSE),
('Zak', 'Brown', 16, '1971-11-07', 15, 'JMI, CSM Sport', TRUE),
('Laurent', 'Mekies', 6, '1977-02-26', 22, 'Ferrari, FIA', TRUE),
('Rob', 'White', 1, '1962-08-15', 30, 'Renault Sport', FALSE),
('Mario', 'Isola', 7, '1967-12-30', 25, 'Pirelli', FALSE),
('Ross', 'Brawn', 1, '1954-11-23', 35, 'Benetton, Ferrari, Mercedes', FALSE),
('Jean', 'Todt', 6, '1946-02-25', 40, 'Peugeot, Ferrari', FALSE),
('Eddie', 'Jordan', 18, '1948-03-30', 20, 'Jordan Grand Prix', FALSE),
('Frank', 'Williams', 1, '1942-04-16', 50, 'Williams F1', FALSE),
('Ron', 'Dennis', 1, '1947-06-01', 35, 'McLaren', FALSE),
('Flavio', 'Briatore', 7, '1950-04-12', 25, 'Benetton, Renault', FALSE),
('Pat', 'Symonds', 1, '1953-06-11', 40, 'Toleman, Benetton, Renault', FALSE),
('Bob', 'Bell', 1, '1958-08-03', 35, 'McLaren, Renault, Mercedes', FALSE);

-- Vzorové týmy (25 týmů - současné a historické)
INSERT INTO teams (team_name, full_name, base_location, principal_id, founded_year, championships_won, total_wins, total_podiums, is_active, team_color) VALUES
('Mercedes', 'Mercedes-AMG Petronas F1 Team', 'Brackley, UK', 1, 2010, 8, 125, 289, TRUE, '#00D2BE'),
('Red Bull Racing', 'Oracle Red Bull Racing', 'Milton Keynes, UK', 2, 2005, 6, 118, 234, TRUE, '#0600EF'),
('Ferrari', 'Scuderia Ferrari', 'Maranello, Italy', 3, 1950, 16, 245, 806, TRUE, '#DC143C'),
('McLaren', 'McLaren F1 Team', 'Woking, UK', 4, 1966, 8, 183, 494, TRUE, '#FF8700'),
('Aston Martin', 'Aston Martin Aramco F1 Team', 'Silverstone, UK', 5, 2021, 0, 1, 13, TRUE, '#006F62'),
('Williams', 'Williams Racing', 'Grove, UK', 6, 1977, 9, 114, 313, TRUE, '#005AFF'),
('Haas', 'MoneyGram Haas F1 Team', 'Kannapolis, USA', 7, 2016, 0, 0, 8, TRUE, '#FFFFFF'),
('Sauber', 'Kick Sauber F1 Team', 'Hinwil, Switzerland', 8, 1993, 0, 1, 26, TRUE, '#52E252'),
('Alpine', 'BWT Alpine F1 Team', 'Enstone, UK', 15, 1981, 2, 21, 73, TRUE, '#0090FF'),
('RB', 'Visa Cash App RB F1 Team', 'Faenza, Italy', 9, 1985, 0, 2, 5, TRUE, '#6692FF'),
('Lotus', 'Team Lotus', 'Hethel, UK', 11, 1958, 6, 79, 165, FALSE, '#FFD700'),
('Benetton', 'Benetton Formula', 'Enstone, UK', 12, 1986, 2, 27, 78, FALSE, '#0066CC'),
('Tyrrell', 'Tyrrell Racing', 'Ockham, UK', 13, 1968, 1, 23, 52, FALSE, '#000080'),
('Brabham', 'Motor Racing Developments', 'Chessington, UK', 14, 1962, 4, 35, 78, FALSE, '#FFFFFF'),
('Jordan', 'Jordan Grand Prix', 'Silverstone, UK', 20, 1991, 0, 4, 19, FALSE, '#FFD700'),
('BAR', 'British American Racing', 'Brackley, UK', 16, 1999, 0, 0, 9, FALSE, '#FF0000'),
('Renault', 'Renault F1 Team', 'Enstone, UK', 17, 2002, 2, 35, 98, FALSE, '#FFF500'),
('Toyota', 'Toyota Racing', 'Cologne, Germany', 18, 2002, 0, 0, 13, FALSE, '#FF0000'),
('Jaguar', 'Jaguar Racing', 'Milton Keynes, UK', 19, 2000, 0, 0, 2, FALSE, '#004225'),
('Minardi', 'Minardi Team', 'Faenza, Italy', 21, 1985, 0, 0, 0, FALSE, '#0033FF'),
('Prost', 'Prost Grand Prix', 'Guyancourt, France', 22, 1997, 0, 0, 0, FALSE, '#0066FF'),
('Arrows', 'Arrows Grand Prix', 'Leafield, UK', 23, 1978, 0, 0, 9, FALSE, '#FFA500'),
('Surtees', 'Team Surtees', 'Edenbridge, UK', 24, 1970, 0, 0, 15, FALSE, '#008000'),
('March', 'March Engineering', 'Bicester, UK', 25, 1969, 0, 3, 22, FALSE, '#800080'),
('Stewart', 'Stewart Grand Prix', 'Milton Keynes, UK', 10, 1997, 0, 1, 5, FALSE, '#FFFFFF');

-- Vzorové okruhy (25 okruhů)
INSERT INTO tracks (track_name, location, country_id, track_length_km, number_of_turns, lap_record_holder_id, first_grand_prix_year, is_active, track_type) VALUES
('Monaco Circuit', 'Monte Carlo', 3, 3.337, 19, 1, 1950, TRUE, 'street'),
('Silverstone Circuit', 'Silverstone', 1, 5.891, 18, 2, 1950, TRUE, 'permanent'),
('Spa-Francorchamps', 'Spa', 9, 7.004, 19, 2, 1950, TRUE, 'permanent'),
('Monza Circuit', 'Monza', 7, 5.793, 11, 1, 1950, TRUE, 'permanent'),
('Suzuka Circuit', 'Suzuka', 10, 5.807, 18, 2, 1987, TRUE, 'permanent'),
('Circuit de Nevers Magny-Cours', 'Magny-Cours', 6, 4.411, 17, 9, 1991, FALSE, 'permanent'),
('Circuit Gilles Villeneuve', 'Montreal', 15, 4.361, 14, 1, 1978, TRUE, 'temporary'),
('Red Bull Ring', 'Spielberg', 5, 4.318, 10, 2, 1970, TRUE, 'permanent'),
('Hungaroring', 'Budapest', 18, 4.381, 14, 1, 1986, TRUE, 'permanent'),
('Circuit de Barcelona-Catalunya', 'Barcelona', 12, 4.675, 16, 2, 1991, TRUE, 'permanent'),
('Autodromo Hermanos Rodriguez', 'Mexico City', 14, 4.304, 17, 2, 1963, TRUE, 'permanent'),
('Interlagos', 'São Paulo', 13, 4.309, 15, 2, 1973, TRUE, 'permanent'),
('Marina Bay Street Circuit', 'Singapore', 17, 5.063, 23, 1, 2008, TRUE, 'street'),
('Yas Marina Circuit', 'Abu Dhabi', 1, 5.281, 16, 2, 2009, TRUE, 'permanent'),
('Circuit of the Americas', 'Austin', 16, 5.513, 20, 3, 2012, TRUE, 'permanent'),
('Nürburgring', 'Nürburg', 11, 5.148, 16, 21, 1951, FALSE, 'permanent'),
('Hockenheimring', 'Hockenheim', 11, 4.574, 17, 9, 1970, FALSE, 'permanent'),
('Imola', 'Imola', 7, 4.909, 19, 1, 1980, TRUE, 'permanent'),
('Zandvoort', 'Zandvoort', 2, 4.259, 14, 2, 1952, TRUE, 'permanent'),
('Paul Ricard', 'Le Castellet', 6, 5.842, 15, 2, 1971, TRUE, 'permanent'),
('Baku City Circuit', 'Baku', 1, 6.003, 20, 3, 2016, TRUE, 'street'),
('Jeddah Corniche Circuit', 'Jeddah', 1, 6.174, 27, 1, 2021, TRUE, 'street'),
('Miami International Autodrome', 'Miami', 16, 5.412, 19, 2, 2022, TRUE, 'street'),
('Las Vegas Strip Circuit', 'Las Vegas', 16, 6.201, 17, 2, 2023, TRUE, 'street'),
('Losail International Circuit', 'Lusail', 1, 5.380, 16, 2, 2021, TRUE, 'permanent');

-- Vzorové motory (25 motorů)
INSERT INTO engines (manufacturer, engine_name, engine_type, first_used_year, last_used_year, horsepower, is_active) VALUES
('Mercedes', 'M15 E Performance', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Honda RBPT', 'RA625H', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Ferrari', '066/12', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Renault', 'E-Tech RE24', 'V6 Turbo Hybrid', 2024, NULL, 1000, TRUE),
('Mercedes', 'M14 E Performance', 'V6 Turbo Hybrid', 2023, 2023, 1000, FALSE),
('Honda RBPT', 'RA624H', 'V6 Turbo Hybrid', 2023, 2023, 1000, FALSE),
('Ferrari', '066/11', 'V6 Turbo Hybrid', 2023, 2023, 1000, FALSE),
('Renault', 'E-Tech RE23', 'V6 Turbo Hybrid', 2023, 2023, 1000, FALSE),
('Mercedes', 'M13 E Performance', 'V6 Turbo Hybrid', 2022, 2022, 1000, FALSE),
('Honda RBPT', 'RA622H', 'V6 Turbo Hybrid', 2022, 2022, 1000, FALSE),
('Ferrari', '066/7', 'V6 Turbo Hybrid', 2022, 2022, 1000, FALSE),
('Renault', 'E-Tech RE22', 'V6 Turbo Hybrid', 2022, 2022, 1000, FALSE),
('Mercedes', 'M12 E Performance', 'V6 Turbo Hybrid', 2021, 2021, 1000, FALSE),
('Honda', 'RA621H', 'V6 Turbo Hybrid', 2021, 2021, 1000, FALSE),
('Ferrari', '065/6', 'V6 Turbo Hybrid', 2021, 2021, 1000, FALSE),
('Renault', 'E-Tech 21', 'V6 Turbo Hybrid', 2021, 2021, 1000, FALSE),
('Mercedes', 'M11 EQ Performance', 'V6 Turbo Hybrid', 2020, 2020, 1000, FALSE),
('Honda', 'RA620H', 'V6 Turbo Hybrid', 2020, 2020, 1000, FALSE),
('Ferrari', '065', 'V6 Turbo Hybrid', 2020, 2020, 1000, FALSE),
('Renault', 'E-Tech 20', 'V6 Turbo Hybrid', 2020, 2020, 1000, FALSE),
('Mercedes', 'M10 EQ Power+', 'V6 Turbo Hybrid', 2019, 2019, 1000, FALSE),
('Honda', 'RA619H', 'V6 Turbo Hybrid', 2019, 2019, 1000, FALSE),
('Ferrari', '064', 'V6 Turbo Hybrid', 2019, 2019, 1000, FALSE),
('Renault', 'E-Tech 19', 'V6 Turbo Hybrid', 2019, 2019, 1000, FALSE),
('TAG Heuer', 'TAG-320B', 'V6 Turbo', 1985, 1987, 750, FALSE);

-- Vzorové sezóny (25 sezón)
INSERT INTO seasons (year, number_of_races, drivers_champion_id, constructors_champion_id, season_start_date, season_end_date, total_points_awarded) VALUES
(2024, 24, 2, 2, '2024-03-02', '2024-12-08', 1205.0),
(2023, 23, 2, 2, '2023-03-05', '2023-11-26', 1158.0),
(2022, 22, 2, 2, '2022-03-20', '2022-11-20', 1110.0),
(2021, 22, 2, 1, '2021-03-28', '2021-12-12', 1100.0),
(2020, 17, 1, 1, '2020-07-05', '2020-12-13', 850.0),
(2019, 21, 1, 1, '2019-03-17', '2019-12-01', 1050.0),
(2018, 21, 1, 1, '2018-03-25', '2018-11-25', 1050.0),
(2017, 20, 1, 1, '2017-03-26', '2017-11-26', 1000.0),
(2016, 21, 15, 1, '2016-03-20', '2016-11-27', 1050.0),
(2015, 19, 1, 1, '2015-03-15', '2015-11-29', 950.0),
(2014, 19, 1, 1, '2014-03-16', '2014-11-23', 950.0),
(2013, 19, 21, 2, '2013-03-17', '2013-11-24', 950.0),
(2012, 20, 21, 2, '2012-03-18', '2012-11-25', 1000.0),
(2011, 19, 21, 2, '2011-03-27', '2011-11-27', 950.0),
(2010, 19, 21, 2, '2010-03-14', '2010-11-14', 950.0),
(2009, 17, 23, 11, '2009-03-29', '2009-11-01', 850.0),
(2008, 18, 1, 3, '2008-03-16', '2008-11-02', 900.0),
(2007, 17, 22, 3, '2007-03-18', '2007-10-21', 850.0),
(2006, 18, 9, 8, '2006-03-12', '2006-10-22', 900.0),
(2005, 19, 9, 8, '2005-03-06', '2005-10-16', 950.0),
(2004, 18, 24, 3, '2004-03-07', '2004-10-24', 900.0),
(2003, 16, 24, 3, '2003-03-09', '2003-10-12', 800.0),
(2002, 17, 24, 3, '2002-03-03', '2002-10-13', 850.0),
(2001, 17, 24, 3, '2001-03-04', '2001-10-14', 850.0),
(2000, 17, 24, 3, '2000-03-12', '2000-10-22', 850.0);

-- Vzorové závody (25 závodů pro sezónu 2024)
INSERT INTO races (season_id, track_id, race_name, race_date, race_time, round_number, total_laps, weather_conditions, fastest_lap_driver_id, pole_position_driver_id, winner_driver_id) VALUES
(1, 8, 'Bahrain Grand Prix', '2024-03-02', '15:00:00', 1, 57, 'Clear', 2, 2, 2),
(1, 17, 'Saudi Arabian Grand Prix', '2024-03-09', '18:00:00', 2, 50, 'Clear', 2, 2, 2),
(1, 4, 'Australian Grand Prix', '2024-03-24', '15:00:00', 3, 58, 'Partly Cloudy', 3, 2, 3),
(1, 19, 'Japanese Grand Prix', '2024-04-07', '14:00:00', 4, 53, 'Clear', 2, 2, 2),
(1, 23, 'Chinese Grand Prix', '2024-04-21', '15:00:00', 5, 56, 'Overcast', 4, 2, 2),
(1, 23, 'Miami Grand Prix', '2024-05-05', '15:30:00', 6, 57, 'Sunny', 2, 2, 4),
(1, 18, 'Emilia Romagna Grand Prix', '2024-05-19', '15:00:00', 7, 63, 'Clear', 2, 2, 2),
(1, 1, 'Monaco Grand Prix', '2024-05-26', '15:00:00', 8, 78, 'Partly Cloudy', 3, 3, 3),
(1, 7, 'Canadian Grand Prix', '2024-06-09', '14:00:00', 9, 70, 'Clear', 2, 2, 2),
(1, 10, 'Spanish Grand Prix', '2024-06-23', '15:00:00', 10, 66, 'Hot', 2, 2, 2),
(1, 8, 'Austrian Grand Prix', '2024-06-30', '15:00:00', 11, 71, 'Clear', 2, 2, 2),
(1, 2, 'British Grand Prix', '2024-07-07', '15:00:00', 12, 52, 'Rain', 1, 2, 1),
(1, 9, 'Hungarian Grand Prix', '2024-07-21', '15:00:00', 13, 70, 'Hot', 5, 2, 5),
(1, 3, 'Belgian Grand Prix', '2024-07-28', '15:00:00', 14, 44, 'Wet', 1, 3, 1),
(1, 19, 'Dutch Grand Prix', '2024-08-25', '15:00:00', 15, 72, 'Clear', 2, 2, 4),
(1, 5, 'Italian Grand Prix', '2024-09-01', '15:00:00', 16, 53, 'Sunny', 3, 4, 3),
(1, 21, 'Azerbaijan Grand Prix', '2024-09-15', '13:00:00', 17, 51, 'Clear', 5, 3, 5),
(1, 13, 'Singapore Grand Prix', '2024-09-22', '20:00:00', 18, 62, 'Humid', 2, 2, 2),
(1, 15, 'United States Grand Prix', '2024-10-20', '14:00:00', 19, 56, 'Clear', 3, 2, 3),
(1, 11, 'Mexican Grand Prix', '2024-10-27', '14:00:00', 20, 71, 'Clear', 3, 3, 3),
(1, 12, 'São Paulo Grand Prix', '2024-11-03', '14:00:00', 21, 71, 'Wet', 2, 2, 2),
(1, 24, 'Las Vegas Grand Prix', '2024-11-23', '22:00:00', 22, 50, 'Clear', 2, 2, 2),
(1, 25, 'Qatar Grand Prix', '2024-12-01', '16:00:00', 23, 57, 'Hot', 2, 2, 2),
(1, 14, 'Abu Dhabi Grand Prix', '2024-12-08', '17:00:00', 24, 58, 'Clear', 2, 4, 2),
(2, 8, 'Bahrain Grand Prix', '2023-03-05', '15:00:00', 1, 57, 'Clear', 2, 2, 2);

-- Vzorové vztahy jezdec-tým (30 vztahů pro více sezón)
INSERT INTO team_drivers (team_id, driver_id, season_id, contract_start_date, contract_end_date, driver_number, is_reserve_driver, salary_millions) VALUES
(1, 1, 1, '2024-01-01', '2024-12-31', 44, FALSE, 50.0),
(1, 6, 1, '2024-01-01', '2024-12-31', 63, FALSE, 15.0),
(2, 2, 1, '2024-01-01', '2025-12-31', 1, FALSE, 55.0),
(2, 8, 1, '2024-01-01', '2024-12-31', 11, FALSE, 12.0),
(3, 3, 1, '2024-01-01', '2026-12-31', 16, FALSE, 25.0),
(3, 7, 1, '2024-01-01', '2024-12-31', 55, FALSE, 20.0),
(4, 4, 1, '2024-01-01', '2026-12-31', 4, FALSE, 18.0),
(4, 5, 1, '2024-01-01', '2026-12-31', 81, FALSE, 4.0),
(5, 9, 1, '2024-01-01', '2024-12-31', 14, FALSE, 30.0),
(5, 10, 1, '2024-01-01', '2025-12-31', 18, FALSE, 8.0),
(6, 20, 1, '2024-01-01', '2025-12-31', 23, FALSE, 5.0),
(6, 19, 1, '2024-01-01', '2024-12-31', 2, FALSE, 3.0),
(7, 13, 1, '2024-01-01', '2024-12-31', 27, FALSE, 7.0),
(7, 14, 1, '2024-01-01', '2024-12-31', 20, FALSE, 6.0),
(8, 15, 1, '2024-01-01', '2024-12-31', 77, FALSE, 10.0),
(8, 16, 1, '2024-01-01', '2024-12-31', 24, FALSE, 4.0),
(9, 11, 1, '2024-01-01', '2024-12-31', 10, FALSE, 8.0),
(9, 12, 1, '2024-01-01', '2024-12-31', 31, FALSE, 6.0),
(10, 17, 1, '2024-01-01', '2024-12-31', 22, FALSE, 5.0),
(10, 18, 1, '2024-01-01', '2024-12-31', 3, FALSE, 15.0),
(1, 1, 2, '2023-01-01', '2023-12-31', 44, FALSE, 45.0),
(1, 6, 2, '2023-01-01', '2023-12-31', 63, FALSE, 12.0),
(2, 2, 2, '2023-01-01', '2023-12-31', 1, FALSE, 50.0),
(2, 8, 2, '2023-01-01', '2023-12-31', 11, FALSE, 10.0),
(3, 3, 2, '2023-01-01', '2023-12-31', 16, FALSE, 20.0),
(3, 7, 2, '2023-01-01', '2023-12-31', 55, FALSE, 18.0),
(4, 4, 2, '2023-01-01', '2023-12-31', 4, FALSE, 15.0),
(4, 5, 2, '2023-01-01', '2023-12-31', 81, FALSE, 2.0),
(5, 9, 2, '2023-01-01', '2023-12-31', 14, FALSE, 25.0),
(5, 10, 2, '2023-01-01', '2023-12-31', 18, FALSE, 6.0);

-- Vzorové výsledky závodů (50 výsledků z různých závodů)
INSERT INTO race_results (race_id, driver_id, team_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
(1, 2, 2, 1, 1, 25.0, 57, '01:31:44.742', 'Winner', '01:31.447', 2),
(1, 8, 2, 2, 2, 18.0, 57, '01:31:56.832', '+12.090s', '01:31.502', 2),
(1, 3, 3, 3, 3, 15.0, 57, '01:32:15.421', '+30.679s', '01:31.789', 2),
(1, 7, 3, 4, 4, 12.0, 57, '01:32:28.945', '+44.203s', '01:31.856', 2),
(1, 1, 1, 5, 5, 10.0, 57, '01:32:42.156', '+57.414s', '01:31.923', 2),
(1, 6, 1, 6, 6, 8.0, 57, '01:32:58.743', '+1:14.001s', '01:32.045', 2),
(1, 4, 4, 7, 7, 6.0, 57, '01:33:12.456', '+1:27.714s', '01:32.178', 2),
(1, 5, 4, 8, 8, 4.0, 57, '01:33:25.789', '+1:41.047s', '01:32.234', 2),
(1, 9, 5, 9, 9, 2.0, 57, '01:33:38.234', '+1:53.492s', '01:32.345', 2),
(1, 10, 5, 10, 10, 1.0, 57, '01:33:51.567', '+2:06.825s', '01:32.456', 2),
(1, 20, 6, 11, 11, 0.0, 57, '01:34:05.123', '+2:20.381s', '01:32.567', 2),
(1, 19, 6, 12, 12, 0.0, 57, '01:34:18.456', '+2:33.714s', '01:32.678', 2),
(1, 13, 7, 13, 13, 0.0, 57, '01:34:31.789', '+2:47.047s', '01:32.789', 2),
(1, 14, 7, 14, 14, 0.0, 57, '01:34:45.123', '+3:00.381s', '01:32.890', 2),
(1, 15, 8, 15, 15, 0.0, 57, '01:34:58.456', '+3:13.714s', '01:32.901', 2),
(1, 16, 8, 16, 16, 0.0, 57, '01:35:11.789', '+3:27.047s', '01:33.012', 2),
(1, 11, 9, 17, 17, 0.0, 57, '01:35:25.123', '+3:40.381s', '01:33.123', 2),
(1, 12, 9, 18, 18, 0.0, 57, '01:35:38.456', '+3:53.714s', '01:33.234', 2),
(1, 17, 10, 19, 19, 0.0, 57, '01:35:51.789', '+4:07.047s', '01:33.345', 2),
(1, 18, 10, 20, 20, 0.0, 57, '01:36:05.123', '+4:20.381s', '01:33.456', 2),
(2, 2, 2, 1, 1, 25.0, 50, '01:20:43.273', 'Winner', '01:29.734', 2),
(2, 8, 2, 2, 2, 18.0, 50, '01:20:58.429', '+15.156s', '01:29.891', 2),
(2, 9, 5, 3, 3, 15.0, 50, '01:21:15.672', '+32.399s', '01:30.045', 2),
(2, 3, 3, 4, 4, 12.0, 50, '01:21:28.945', '+45.672s', '01:30.156', 2),
(2, 7, 3, 5, 5, 10.0, 50, '01:21:42.156', '+58.883s', '01:30.267', 2),
(3, 3, 3, 2, 1, 25.0, 58, '01:20:26.843', 'Winner', '01:16.302', 2),
(3, 2, 2, 1, 2, 18.0, 58, '01:20:29.450', '+2.607s', '01:16.421', 2),
(3, 4, 4, 5, 3, 15.0, 58, '01:20:51.234', '+24.391s', '01:16.789', 2),
(3, 1, 1, 6, 4, 12.0, 58, '01:21:03.567', '+36.724s', '01:16.890', 2),
(3, 5, 4, 8, 5, 10.0, 58, '01:21:15.890', '+49.047s', '01:16.945', 2),
(4, 2, 2, 1, 1, 26.0, 53, '01:30:21.892', 'Winner', '01:30.983', 2),
(4, 8, 2, 3, 2, 18.0, 53, '01:30:35.467', '+13.575s', '01:31.123', 2),
(4, 3, 3, 2, 3, 15.0, 53, '01:30:48.234', '+26.342s', '01:31.234', 2),
(4, 7, 3, 4, 4, 12.0, 53, '01:31:01.567', '+39.675s', '01:31.345', 2),
(4, 1, 1, 5, 5, 10.0, 53, '01:31:14.890', '+52.998s', '01:31.456', 2),
(5, 2, 2, 1, 1, 25.0, 56, '01:40:52.554', 'Winner', '01:32.441', 2),
(5, 4, 4, 3, 2, 18.0, 56, '01:41:08.332', '+15.778s', '01:32.567', 2),
(5, 3, 3, 2, 3, 15.0, 56, '01:41:25.789', '+33.235s', '01:32.678', 2),
(5, 8, 2, 4, 4, 12.0, 56, '01:41:38.123', '+45.569s', '01:32.789', 2),
(5, 1, 1, 5, 5, 10.0, 56, '01:41:51.456', '+58.902s', '01:32.890', 2),
(6, 4, 4, 3, 1, 25.0, 57, '01:27:42.198', 'Winner', '01:27.241', 2),
(6, 2, 2, 1, 2, 18.0, 57, '01:27:45.623', '+3.425s', '01:27.356', 2),
(6, 3, 3, 2, 3, 15.0, 57, '01:28:02.789', '+20.591s', '01:27.467', 2),
(6, 1, 1, 4, 4, 12.0, 57, '01:28:15.123', '+32.925s', '01:27.578', 2),
(6, 5, 4, 5, 5, 10.0, 57, '01:28:28.456', '+46.258s', '01:27.689', 2),
(7, 2, 2, 1, 1, 25.0, 63, '01:25:31.456', 'Winner', '01:14.746', 2),
(7, 3, 3, 2, 2, 18.0, 63, '01:25:48.789', '+17.333s', '01:14.867', 2),
(7, 4, 4, 3, 3, 15.0, 63, '01:26:05.123', '+33.667s', '01:14.978', 2),
(7, 1, 1, 4, 4, 12.0, 63, '01:26:18.456', '+47.000s', '01:15.089', 2),
(7, 8, 2, 5, 5, 10.0, 63, '01:26:31.789', '+1:00.333s', '01:15.123', 2);

-- Vzorové vztahy tým-motor (30 vztahů)
INSERT INTO team_engines (team_id, engine_id, season_id, is_manufacturer_team) VALUES
(1, 1, 1, TRUE),   -- Mercedes uses Mercedes engine
(2, 2, 1, FALSE),  -- Red Bull uses Honda RBPT
(3, 3, 1, TRUE),   -- Ferrari uses Ferrari engine
(4, 1, 1, FALSE),  -- McLaren uses Mercedes engine
(5, 1, 1, FALSE),  -- Aston Martin uses Mercedes engine
(6, 1, 1, FALSE),  -- Williams uses Mercedes engine
(7, 3, 1, FALSE),  -- Haas uses Ferrari engine
(8, 3, 1, FALSE),  -- Sauber uses Ferrari engine
(9, 4, 1, TRUE),   -- Alpine uses Renault engine
(10, 2, 1, FALSE), -- RB uses Honda RBPT engine
(1, 5, 2, TRUE),   -- Mercedes 2023
(2, 6, 2, FALSE),  -- Red Bull 2023
(3, 7, 2, TRUE),   -- Ferrari 2023
(4, 5, 2, FALSE),  -- McLaren 2023
(5, 5, 2, FALSE),  -- Aston Martin 2023
(6, 5, 2, FALSE),  -- Williams 2023
(7, 7, 2, FALSE),  -- Haas 2023
(8, 7, 2, FALSE),  -- Sauber 2023
(9, 8, 2, TRUE),   -- Alpine 2023
(10, 6, 2, FALSE), -- RB 2023
(1, 9, 3, TRUE),   -- Mercedes 2022
(2, 10, 3, FALSE), -- Red Bull 2022
(3, 11, 3, TRUE),  -- Ferrari 2022
(4, 9, 3, FALSE),  -- McLaren 2022
(5, 9, 3, FALSE),  -- Aston Martin 2022
(6, 9, 3, FALSE),  -- Williams 2022
(7, 11, 3, FALSE), -- Haas 2022
(8, 11, 3, FALSE), -- Sauber 2022
(9, 12, 3, TRUE),  -- Alpine 2022
(10, 10, 3, FALSE); -- RB 2022