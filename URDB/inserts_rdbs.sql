-- Inserts for simplified F1 schema (2025 season)
-- Aligned with f1_simplified.sql

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

-- Team Principals (2025)
INSERT INTO team_principals (first_name, last_name, country_id, date_of_birth, years_of_experience, previous_teams, mentor_principal_id, is_active) VALUES
('Toto', 'Wolff', 5, '1972-01-12', 13, 'Williams (investor)', 11, TRUE),
('Christian', 'Horner', 1, '1973-11-16', 20, 'Arden International', 12, TRUE),
('Frédéric', 'Vasseur', 6, '1968-05-28', 26, 'Sauber, Alfa Romeo', 13, TRUE),
('Andrea', 'Stella', 7, '1971-11-16', 21, 'Ferrari (engineer)', 12, TRUE),
('Mike', 'Krack', 19, '1972-08-03', 16, 'BMW Sauber, Porsche', 18, TRUE),
('James', 'Vowles', 1, '1979-11-01', 21, 'Mercedes (strategy)', 1, TRUE),
('Ayao', 'Komatsu', 12, '1976-04-20', 16, 'Lotus, McLaren', 16, TRUE),
('Alessandro', 'Alunni Bravi', 7, '1975-09-12', 19, 'Ferrari, Sauber', 13, TRUE),
('Bruno', 'Famin', 6, '1962-05-25', 25, 'Peugeot, FIA', 17, TRUE),
('Laurent', 'Mekies', 6, '1977-02-26', 23, 'Ferrari, FIA', 13, TRUE),
('Ross', 'Brawn', 1, '1954-11-23', 34, 'Benetton, Ferrari, Brawn GP', NULL, FALSE),
('Ron', 'Dennis', 1, '1947-06-01', 35, 'Project Four, McLaren', NULL, FALSE),
('Jean', 'Todt', 6, '1946-02-25', 30, 'Peugeot Talbot Sport, Ferrari', NULL, FALSE),
('Frank', 'Williams', 1, '1942-04-16', 40, 'Williams', NULL, FALSE),
('Flavio', 'Briatore', 7, '1950-04-12', 28, 'Benetton, Renault', NULL, FALSE),
('Günther', 'Steiner', 7, '1965-04-07', 18, 'Red Bull, Jaguar, Haas', NULL, FALSE),
('Cyril', 'Abiteboul', 6, '1977-10-14', 15, 'Renault, Caterham', NULL, FALSE),
('Otmar', 'Szafnauer', 11, '1964-08-13', 25, 'BAR, Force India, Aston Martin', NULL, FALSE);

-- Teams for 2025 season
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

-- 2025 F1 Drivers (active race drivers only)
INSERT INTO drivers (first_name, last_name, country_id, date_of_birth, driver_number, championships_won, career_starts, career_wins, career_podiums, career_points, is_active) VALUES
('Max', 'Verstappen', 2, '1997-09-30', 1, 3, 184, 62, 107, 2987.5, TRUE),
('Liam', 'Lawson', 18, '2002-02-11', 30, 0, 6, 0, 0, 0.0, TRUE),
('Yuki', 'Tsunoda', 12, '2000-05-11', 22, 0, 88, 0, 0, 67.0, TRUE),
('Isack', 'Hadjar', 6, '2004-09-28', 6, 0, 0, 0, 0, 0.0, TRUE),
('Lando', 'Norris', 1, '1999-11-13', 4, 0, 124, 1, 13, 934.0, TRUE),
('Oscar', 'Piastri', 4, '2001-04-06', 81, 0, 44, 2, 5, 167.0, TRUE),
('Charles', 'Leclerc', 3, '1997-10-16', 16, 0, 144, 5, 29, 1345.0, TRUE),
('Lewis', 'Hamilton', 1, '1985-01-07', 44, 7, 350, 105, 195, 4634.5, TRUE),
('George', 'Russell', 1, '1998-02-15', 63, 0, 114, 2, 13, 456.0, TRUE),
('Kimi', 'Antonelli', 7, '2006-08-25', 12, 0, 0, 0, 0, 0.0, TRUE),
('Fernando', 'Alonso', 8, '1981-07-29', 14, 2, 394, 32, 106, 2223.0, TRUE),
('Lance', 'Stroll', 10, '1998-10-29', 18, 0, 154, 0, 3, 89.0, TRUE),
('Pierre', 'Gasly', 6, '1996-02-07', 10, 0, 144, 1, 4, 387.0, TRUE),
('Jack', 'Doohan', 4, '2003-01-20', 61, 0, 0, 0, 0, 0.0, TRUE),
('Franco', 'Colapinto', 22, '2003-05-27', 43, 0, 0, 0, 0, 0.0, TRUE),
('Esteban', 'Ocon', 6, '1996-09-17', 31, 0, 134, 1, 3, 234.0, TRUE),
('Oliver', 'Bearman', 1, '2005-05-08', 87, 0, 0, 0, 0, 0.0, TRUE),
('Nico', 'Hulkenberg', 15, '1987-08-19', 27, 0, 224, 0, 0, 521.0, TRUE),
('Gabriel', 'Bortoleto', 21, '2004-10-14', 5, 0, 0, 0, 0, 0.0, TRUE),
('Alex', 'Albon', 14, '1996-03-23', 23, 0, 104, 0, 2, 234.0, TRUE),
('Carlos', 'Sainz', 8, '1994-09-01', 55, 0, 204, 3, 23, 1234.5, TRUE);

-- 2025 F1 Tracks
INSERT INTO tracks (track_name, location, country_id, track_length_km, number_of_turns, first_grand_prix_year, is_active, track_type) VALUES
('Bahrain International Circuit', 'Sakhir', 23, 5.412, 15, 2004, TRUE, 'permanent'),
('Jeddah Corniche Circuit', 'Jeddah', 23, 6.174, 27, 2021, TRUE, 'street'),
('Albert Park Circuit', 'Melbourne', 4, 5.278, 14, 1996, TRUE, 'permanent'),
('Suzuka International Racing Course', 'Suzuka', 12, 5.807, 18, 1987, TRUE, 'permanent'),
('Shanghai International Circuit', 'Shanghai', 13, 5.451, 16, 2004, TRUE, 'permanent'),
('Miami International Autodrome', 'Miami', 11, 5.412, 19, 2022, TRUE, 'street'),
('Autodromo Enzo e Dino Ferrari', 'Imola', 7, 4.909, 19, 1980, TRUE, 'permanent'),
('Circuit de Monaco', 'Monte Carlo', 3, 3.337, 19, 1950, TRUE, 'street'),
('Circuit Gilles Villeneuve', 'Montreal', 10, 4.361, 14, 1978, TRUE, 'temporary'),
('Circuit de Barcelona-Catalunya', 'Barcelona', 8, 4.675, 16, 1991, TRUE, 'permanent'),
('Red Bull Ring', 'Spielberg', 5, 4.318, 10, 1970, TRUE, 'permanent'),
('Silverstone Circuit', 'Silverstone', 1, 5.891, 18, 1950, TRUE, 'permanent'),
('Hungaroring', 'Budapest', 26, 4.381, 14, 1986, TRUE, 'permanent'),
('Circuit de Spa-Francorchamps', 'Spa', 20, 7.004, 19, 1950, TRUE, 'permanent'),
('Circuit Zandvoort', 'Zandvoort', 2, 4.259, 14, 1952, TRUE, 'permanent'),
('Autodromo Nazionale Monza', 'Monza', 7, 5.793, 11, 1950, TRUE, 'permanent'),
('Baku City Circuit', 'Baku', 27, 6.003, 20, 2016, TRUE, 'street'),
('Marina Bay Street Circuit', 'Singapore', 25, 5.063, 23, 2008, TRUE, 'street'),
('Circuit of the Americas', 'Austin', 11, 5.513, 20, 2012, TRUE, 'permanent'),
('Autódromo Hermanos Rodríguez', 'Mexico City', 9, 4.304, 17, 1963, TRUE, 'permanent'),
('Interlagos', 'São Paulo', 21, 4.309, 15, 1973, TRUE, 'permanent'),
('Las Vegas Strip Circuit', 'Las Vegas', 11, 6.201, 17, 2023, TRUE, 'street'),
('Losail International Circuit', 'Lusail', 28, 5.380, 16, 2021, TRUE, 'permanent'),
('Yas Marina Circuit', 'Abu Dhabi', 24, 5.281, 16, 2009, TRUE, 'permanent');

-- 2025 F1 Engines
INSERT INTO engines (manufacturer, engine_name, engine_type, horsepower, is_active) VALUES
('Mercedes', 'M16 E Performance', 'V6 Turbo Hybrid', 1000, TRUE),
('Honda RBPT', 'RA626H', 'V6 Turbo Hybrid', 1000, TRUE),
('Ferrari', '066/13', 'V6 Turbo Hybrid', 1000, TRUE),
('Renault', 'E-Tech RE25', 'V6 Turbo Hybrid', 1000, TRUE);

-- 2025 Season
INSERT INTO seasons (year, number_of_races, season_start_date, season_end_date) VALUES
(2025, 24, '2025-03-02', '2025-12-07');

-- 2025 F1 Calendar (dates aligned to 2025 season structure)
INSERT INTO races (season_id, track_id, race_name, race_date, race_time, round_number, total_laps, weather_conditions) VALUES
(1, 1, 'Bahrain Grand Prix', '2025-03-02', '18:00:00', 1, 57, 'Clear'),
(1, 2, 'Saudi Arabian Grand Prix', '2025-03-09', '20:00:00', 2, 50, 'Clear'),
(1, 3, 'Australian Grand Prix', '2025-03-23', '15:00:00', 3, 58, 'Partly Cloudy'),
(1, 4, 'Japanese Grand Prix', '2025-04-06', '14:00:00', 4, 53, 'Clear'),
(1, 5, 'Chinese Grand Prix', '2025-04-20', '15:00:00', 5, 56, 'Overcast'),
(1, 6, 'Miami Grand Prix', '2025-05-04', '20:30:00', 6, 57, 'Sunny'),
(1, 7, 'Emilia Romagna Grand Prix', '2025-05-18', '15:00:00', 7, 63, 'Clear'),
(1, 8, 'Monaco Grand Prix', '2025-05-25', '15:00:00', 8, 78, 'Partly Cloudy'),
(1, 9, 'Canadian Grand Prix', '2025-06-08', '20:00:00', 9, 70, 'Clear'),
(1, 10, 'Spanish Grand Prix', '2025-06-22', '15:00:00', 10, 66, 'Sunny'),
(1, 11, 'Austrian Grand Prix', '2025-06-29', '15:00:00', 11, 71, 'Clear'),
(1, 12, 'British Grand Prix', '2025-07-06', '16:00:00', 12, 52, 'Rain'),
(1, 13, 'Hungarian Grand Prix', '2025-07-20', '15:00:00', 13, 70, 'Hot'),
(1, 14, 'Belgian Grand Prix', '2025-07-27', '15:00:00', 14, 44, 'Variable'),
(1, 15, 'Dutch Grand Prix', '2025-08-24', '15:00:00', 15, 72, 'Clear'),
(1, 16, 'Italian Grand Prix', '2025-08-31', '15:00:00', 16, 53, 'Clear'),
(1, 17, 'Azerbaijan Grand Prix', '2025-09-14', '13:00:00', 17, 51, 'Clear'),
(1, 18, 'Singapore Grand Prix', '2025-09-21', '20:00:00', 18, 62, 'Hot & Humid'),
(1, 19, 'United States Grand Prix', '2025-10-19', '21:00:00', 19, 56, 'Clear'),
(1, 20, 'Mexican Grand Prix', '2025-10-26', '21:00:00', 20, 71, 'Clear'),
(1, 21, 'Brazilian Grand Prix', '2025-11-02', '16:00:00', 21, 71, 'Rain'),
(1, 22, 'Las Vegas Grand Prix', '2025-11-22', '22:00:00', 22, 50, 'Cool'),
(1, 23, 'Qatar Grand Prix', '2025-11-30', '18:00:00', 23, 57, 'Clear'),
(1, 24, 'Abu Dhabi Grand Prix', '2025-12-07', '17:00:00', 24, 55, 'Clear');

-- 2025 Team-Driver relationships
INSERT INTO team_drivers (team_id, driver_id, contract_start_date, contract_end_date, is_reserve_driver) VALUES
-- Mercedes
(1, 9, '2025-01-01', '2025-12-31', FALSE),
(1, 10, '2025-01-01', '2025-12-31', FALSE),
-- Red Bull Racing
(2, 1, '2025-01-01', '2025-12-31', FALSE),
(2, 3, '2025-01-01', '2025-12-31', FALSE),
-- Ferrari
(3, 7, '2025-01-01', '2025-12-31', FALSE),
(3, 8, '2025-01-01', '2025-12-31', FALSE),
-- McLaren
(4, 5, '2025-01-01', '2025-12-31', FALSE),
(4, 6, '2025-01-01', '2025-12-31', FALSE),
-- Aston Martin
(5, 11, '2025-01-01', '2025-12-31', FALSE),
(5, 12, '2025-01-01', '2025-12-31', FALSE),
-- Williams
(6, 20, '2025-01-01', '2025-12-31', FALSE),
(6, 21, '2025-01-01', '2025-12-31', FALSE),
-- Haas
(7, 16, '2025-01-01', '2025-12-31', FALSE),
(7, 17, '2025-01-01', '2025-12-31', FALSE),
-- Kick Sauber
(8, 18, '2025-01-01', '2025-12-31', FALSE),
(8, 19, '2025-01-01', '2025-12-31', FALSE),
-- Alpine
(9, 13, '2025-01-01', '2025-12-31', FALSE),
(9, 15, '2025-01-01', '2025-12-31', FALSE),
(9, 14, '2025-01-01', '2025-12-31', TRUE),
-- RB
(10, 4, '2025-01-01', '2025-12-31', FALSE),
(10, 2, '2025-01-01', '2025-12-31', FALSE);

-- 2025 Team-Engine relationships
INSERT INTO team_engines (team_id, engine_id, season_id, is_manufacturer_team) VALUES
-- Mercedes teams
(1, 1, 1, TRUE),   -- Mercedes with Mercedes engine
(6, 1, 1, FALSE),  -- Williams with Mercedes engine
(5, 1, 1, FALSE),  -- Aston Martin with Mercedes
(4, 1, 1, FALSE),  -- McLaren with Mercedes
-- Red Bull teams
(2, 2, 1, FALSE),  -- Red Bull Racing with Honda RBPT
(10, 2, 1, FALSE), -- RB with Honda RBPT
-- Ferrari teams
(3, 3, 1, TRUE),   -- Ferrari with Ferrari engine
(7, 3, 1, FALSE),  -- Haas with Ferrari engine
(8, 3, 1, FALSE),  -- Kick Sauber with Ferrari engine
-- Renault teams
(9, 4, 1, FALSE);  -- Alpine with Renault

-- =====================================================
-- Sample 2025 Race Results (top 10 each race)
-- =====================================================
-- Sample results: Bahrain Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Bahrain Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Bahrain Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Saudi Arabian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Saudi Arabian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Saudi Arabian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Australian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Australian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Australian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Japanese Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Japanese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Japanese Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Chinese Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Chinese Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Chinese Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Miami Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Miami Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Miami Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Emilia Romagna Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Emilia Romagna Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Emilia Romagna Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Monaco Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Monaco Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Monaco Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Canadian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Canadian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Canadian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Spanish Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Spanish Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Spanish Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Austrian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Austrian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Austrian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: British Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='British Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='British Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Hungarian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Hungarian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Hungarian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Belgian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Belgian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Belgian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Dutch Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Dutch Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Dutch Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Italian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Italian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Italian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Azerbaijan Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Azerbaijan Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Azerbaijan Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Singapore Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Singapore Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Singapore Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: United States Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='United States Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='United States Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Mexican Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Mexican Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Mexican Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Brazilian Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Brazilian Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Brazilian Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Las Vegas Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Las Vegas Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Las Vegas Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Qatar Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Qatar Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Qatar Grand Prix'),NULL,'+50.000s',NULL,2);

-- Sample results: Abu Dhabi Grand Prix
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, race_time, time_gap, fastest_lap_time, pit_stops) VALUES
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Oscar' AND last_name='Piastri'),1,1,25.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),'01:30:00','Winner',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Charles' AND last_name='Leclerc'),2,2,18.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+10.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lewis' AND last_name='Hamilton'),3,3,15.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+15.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='George' AND last_name='Russell'),4,4,12.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+20.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Fernando' AND last_name='Alonso'),5,5,10.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+25.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lance' AND last_name='Stroll'),6,6,8.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+30.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Pierre' AND last_name='Gasly'),7,7,6.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+35.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Alex' AND last_name='Albon'),8,8,4.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+40.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Max' AND last_name='Verstappen'),9,9,2.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+45.000s',NULL,2),
((SELECT race_id FROM races WHERE race_name='Abu Dhabi Grand Prix'),(SELECT driver_id FROM drivers WHERE first_name='Lando' AND last_name='Norris'),10,10,1.0,(SELECT total_laps FROM races WHERE race_name='Abu Dhabi Grand Prix'),NULL,'+50.000s',NULL,2);
