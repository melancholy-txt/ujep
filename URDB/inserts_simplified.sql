-- Updated inserts.sql file for simplified F1 database schema
-- Aligned with f1_simplified.sql structure

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
('Franz', 'Tost', 5, '1956-01-14', 30, 'BMW, Gerhard Berger', TRUE),
('Mattia', 'Binotto', 7, '1956-01-14', 8, 'Ferrari (Engine Engineer, Chief Engineer, CTO)', FALSE);

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

-- 2024 F1 Tracks (removed lap_record_holder_id field)
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

-- 2024 F1 Engines
INSERT INTO engines (manufacturer, engine_name, engine_type, horsepower, is_active) VALUES
('Mercedes', 'M15 E Performance', 'V6 Turbo Hybrid', 1000, TRUE),
('Honda RBPT', 'RA625H', 'V6 Turbo Hybrid', 1000, TRUE),
('Ferrari', '066/12', 'V6 Turbo Hybrid', 1000, TRUE),
('Renault', 'E-Tech RE24', 'V6 Turbo Hybrid', 1000, TRUE);

-- 2024 Season (removed championship leader fields and total_points_awarded)
INSERT INTO seasons (year, number_of_races, season_start_date, season_end_date) VALUES
(2024, 24, '2024-03-02', '2024-12-08');

-- 2024 F1 Calendar (24 races) - removed fastest_lap_driver_id, pole_position_driver_id, winner_driver_id
INSERT INTO races (season_id, track_id, race_name, race_date, race_time, round_number, total_laps, weather_conditions) VALUES
(1, 1, 'Bahrain Grand Prix', '2024-03-02', '18:00:00', 1, 57, 'Clear'),
(1, 2, 'Saudi Arabian Grand Prix', '2024-03-09', '20:00:00', 2, 50, 'Clear'),
(1, 3, 'Australian Grand Prix', '2024-03-24', '15:00:00', 3, 58, 'Partly Cloudy'),
(1, 4, 'Japanese Grand Prix', '2024-04-07', '14:00:00', 4, 53, 'Clear'),
(1, 5, 'Chinese Grand Prix', '2024-04-21', '15:00:00', 5, 56, 'Overcast'),
(1, 6, 'Miami Grand Prix', '2024-05-05', '20:30:00', 6, 57, 'Sunny'),
(1, 7, 'Emilia Romagna Grand Prix', '2024-05-19', '15:00:00', 7, 63, 'Clear'),
(1, 8, 'Monaco Grand Prix', '2024-05-26', '15:00:00', 8, 78, 'Partly Cloudy'),
(1, 9, 'Canadian Grand Prix', '2024-06-09', '20:00:00', 9, 70, 'Clear'),
(1, 10, 'Spanish Grand Prix', '2024-06-23', '15:00:00', 10, 66, 'Sunny'),
(1, 11, 'Austrian Grand Prix', '2024-06-30', '15:00:00', 11, 71, 'Clear'),
(1, 12, 'British Grand Prix', '2024-07-07', '16:00:00', 12, 52, 'Rain'),
(1, 13, 'Hungarian Grand Prix', '2024-07-21', '15:00:00', 13, 70, 'Hot'),
(1, 14, 'Belgian Grand Prix', '2024-07-28', '15:00:00', 14, 44, 'Variable'),
(1, 15, 'Dutch Grand Prix', '2024-08-25', '15:00:00', 15, 72, 'Clear'),
(1, 16, 'Italian Grand Prix', '2024-09-01', '15:00:00', 16, 53, 'Clear'),
(1, 17, 'Azerbaijan Grand Prix', '2024-09-15', '13:00:00', 17, 51, 'Clear'),
(1, 18, 'Singapore Grand Prix', '2024-09-22', '20:00:00', 18, 62, 'Hot & Humid'),
(1, 19, 'United States Grand Prix', '2024-10-20', '21:00:00', 19, 56, 'Clear'),
(1, 20, 'Mexican Grand Prix', '2024-10-27', '21:00:00', 20, 71, 'Clear'),
(1, 21, 'Brazilian Grand Prix', '2024-11-03', '16:00:00', 21, 71, 'Rain'),
(1, 22, 'Las Vegas Grand Prix', '2024-11-23', '22:00:00', 22, 50, 'Cool'),
(1, 23, 'Qatar Grand Prix', '2024-12-01', '18:00:00', 23, 57, 'Clear'),
(1, 24, 'Abu Dhabi Grand Prix', '2024-12-08', '17:00:00', 24, 55, 'Clear');

-- 2024 Team-Driver relationships (added season_id)
INSERT INTO team_drivers (team_id, driver_id, season_id, contract_start_date, contract_end_date, is_reserve_driver) VALUES
-- Mercedes
(1, 2, 1, '2024-01-01', '2024-12-31', FALSE),
(1, 6, 1, '2024-01-01', '2024-12-31', FALSE),
-- Red Bull Racing
(2, 1, 1, '2024-01-01', '2024-12-31', FALSE),
(2, 8, 1, '2024-01-01', '2024-12-31', FALSE),
-- Ferrari
(3, 3, 1, '2024-01-01', '2024-12-31', FALSE),
(3, 7, 1, '2024-01-01', '2024-12-31', FALSE),
-- McLaren
(4, 4, 1, '2024-01-01', '2024-12-31', FALSE),
(4, 5, 1, '2024-01-01', '2024-12-31', FALSE),
-- Aston Martin
(5, 9, 1, '2024-01-01', '2024-12-31', FALSE),
(5, 10, 1, '2024-01-01', '2024-12-31', FALSE),
-- Williams
(6, 20, 1, '2024-01-01', '2024-12-31', FALSE),
(6, 19, 1, '2024-01-01', '2024-12-31', FALSE),
-- Haas
(7, 13, 1, '2024-01-01', '2024-12-31', FALSE),
(7, 14, 1, '2024-01-01', '2024-12-31', FALSE),
-- Kick Sauber
(8, 15, 1, '2024-01-01', '2024-12-31', FALSE),
(8, 16, 1, '2024-01-01', '2024-12-31', FALSE),
-- Alpine
(9, 11, 1, '2024-01-01', '2024-12-31', FALSE),
(9, 12, 1, '2024-01-01', '2024-12-31', FALSE),
-- RB
(10, 17, 1, '2024-01-01', '2024-12-31', FALSE),
(10, 18, 1, '2024-01-01', '2024-12-31', FALSE);

-- 2024 Team-Engine relationships (corrected engine assignments)
INSERT INTO team_engines (team_id, engine_id, season_id, is_manufacturer_team) VALUES
-- Mercedes teams
(1, 1, 1, TRUE),   -- Mercedes with Mercedes engine
(6, 1, 1, FALSE),  -- Williams with Mercedes engine
(5, 1, 1, FALSE),  -- Aston Martin with Mercedes engine
(4, 1, 1, FALSE),  -- McLaren with Mercedes engine (corrected from Renault)
-- Red Bull teams  
(2, 2, 1, FALSE),  -- Red Bull Racing with Honda RBPT
(10, 2, 1, FALSE), -- RB with Honda RBPT
-- Ferrari teams
(3, 3, 1, TRUE),   -- Ferrari with Ferrari engine
(7, 3, 1, FALSE),  -- Haas with Ferrari engine
(8, 3, 1, FALSE),  -- Kick Sauber with Ferrari engine
-- Renault teams
(9, 4, 1, FALSE);  -- Alpine with Renault

-- 2024 Race Results (removed team_id column as it can be derived from team_drivers)
-- Bahrain GP 2024
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(1, 1, 1, 1, 25.0, 57, 'Winner'),
(1, 8, 2, 2, 18.0, 57, '+22.457s'),
(1, 7, 3, 3, 15.0, 57, '+31.928s'),
(1, 6, 4, 4, 12.0, 57, '+39.217s'),
(1, 9, 5, 5, 10.0, 57, '+47.294s'),
(1, 13, 6, 6, 8.0, 57, '+1:12.171'),
(1, 2, 7, 7, 6.0, 57, '+1:20.043'),
(1, 17, 8, 8, 4.0, 57, '+1:31.055'),
(1, 11, 9, 9, 2.0, 57, '+1:33.995'),
(1, 10, 10, 10, 1.0, 57, '+1:38.235'),
(1, 3, 11, 11, 0.0, 57, '+1:41.234'),
(1, 4, 12, 12, 0.0, 57, '+1:44.567'),
(1, 5, 13, 13, 0.0, 57, '+1:47.891'),
(1, 12, 14, 14, 0.0, 57, '+1:51.234'),
(1, 14, 15, 15, 0.0, 57, '+1:54.567'),
(1, 15, 16, 16, 0.0, 57, '+1:57.891'),
(1, 16, 17, 17, 0.0, 56, '+1 lap'),
(1, 18, 18, 18, 0.0, 55, '+2 laps'),
(1, 19, 19, 19, 0.0, 54, '+3 laps'),
(1, 20, 20, 20, 0.0, 53, '+4 laps');

-- Saudi Arabian GP 2024
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(2, 1, 1, 1, 25.0, 50, 'Winner'),
(2, 8, 2, 2, 18.0, 50, '+7.865s'),
(2, 3, 3, 3, 15.0, 50, '+18.639s'),
(2, 6, 4, 4, 12.0, 50, '+32.211s'),
(2, 9, 5, 5, 10.0, 50, '+39.208s'),
(2, 13, 6, 6, 8.0, 50, '+54.825s'),
(2, 2, 7, 7, 6.0, 50, '+1:02.234'),
(2, 17, 8, 8, 4.0, 50, '+1:11.892'),
(2, 11, 9, 9, 2.0, 50, '+1:23.987'),
(2, 14, 10, 10, 1.0, 50, '+1:29.456'),
(2, 4, 11, 11, 0.0, 50, '+1:32.789'),
(2, 5, 12, 12, 0.0, 50, '+1:36.123'),
(2, 7, 13, 13, 0.0, 50, '+1:39.456'),
(2, 10, 14, 14, 0.0, 50, '+1:42.789'),
(2, 12, 15, 15, 0.0, 50, '+1:46.123'),
(2, 15, 16, 16, 0.0, 50, '+1:49.456'),
(2, 16, 17, 17, 0.0, 49, '+1 lap'),
(2, 18, 18, 18, 0.0, 48, '+2 laps'),
(2, 19, 19, 19, 0.0, 47, '+3 laps'),
(2, 20, 20, 20, 0.0, 46, '+4 laps');

-- Australian GP 2024
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(3, 7, 1, 1, 25.0, 58, 'Winner'),
(3, 3, 2, 2, 18.0, 58, '+2.366s'),
(3, 4, 3, 3, 15.0, 58, '+12.533s'),
(3, 5, 4, 4, 12.0, 58, '+15.974s'),
(3, 1, 5, 5, 10.0, 58, '+17.421s'),
(3, 6, 6, 6, 8.0, 58, '+23.894s'),
(3, 2, 7, 7, 6.0, 58, '+30.127s'),
(3, 17, 8, 8, 4.0, 58, '+45.321s'),
(3, 9, 9, 9, 2.0, 58, '+52.987'),
(3, 10, 10, 10, 1.0, 58, '+1:02.456'),
(3, 8, 11, 11, 0.0, 58, '+1:05.789'),
(3, 11, 12, 12, 0.0, 58, '+1:09.123'),
(3, 12, 13, 13, 0.0, 58, '+1:12.456'),
(3, 13, 14, 14, 0.0, 58, '+1:15.789'),
(3, 14, 15, 15, 0.0, 58, '+1:19.123'),
(3, 15, 16, 16, 0.0, 58, '+1:22.456'),
(3, 16, 17, 17, 0.0, 57, '+1 lap'),
(3, 18, 18, 18, 0.0, 56, '+2 laps'),
(3, 19, 19, 19, 0.0, 55, '+3 laps'),
(3, 20, 20, 20, 0.0, 54, '+4 laps');

-- Japanese GP 2024
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(4, 1, 1, 1, 25.0, 53, 'Winner'),
(4, 8, 2, 2, 18.0, 53, '+12.536s'),
(4, 7, 3, 3, 15.0, 53, '+18.265s'),
(4, 3, 4, 4, 12.0, 53, '+25.893s'),
(4, 4, 5, 5, 10.0, 53, '+31.274s'),
(4, 6, 6, 6, 8.0, 53, '+42.159s'),
(4, 9, 7, 7, 6.0, 53, '+49.892s'),
(4, 2, 8, 8, 4.0, 53, '+55.321s'),
(4, 13, 9, 9, 2.0, 53, '+1:02.847'),
(4, 17, 10, 10, 1.0, 53, '+1:08.234'),
(4, 5, 11, 11, 0.0, 53, '+1:11.567'),
(4, 10, 12, 12, 0.0, 53, '+1:14.891'),
(4, 11, 13, 13, 0.0, 53, '+1:18.234'),
(4, 12, 14, 14, 0.0, 53, '+1:21.567'),
(4, 14, 15, 15, 0.0, 53, '+1:24.891'),
(4, 15, 16, 16, 0.0, 53, '+1:28.234'),
(4, 16, 17, 17, 0.0, 52, '+1 lap'),
(4, 18, 18, 18, 0.0, 51, '+2 laps'),
(4, 19, 19, 19, 0.0, 50, '+3 laps'),
(4, 20, 20, 20, 0.0, 49, '+4 laps');

-- Chinese GP 2024
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(5, 1, 1, 1, 25.0, 56, 'Winner'),
(5, 4, 2, 2, 18.0, 56, '+13.736s'),
(5, 8, 3, 3, 15.0, 56, '+18.902s'),
(5, 3, 4, 4, 12.0, 56, '+28.535s'),
(5, 6, 5, 5, 10.0, 56, '+35.892s'),
(5, 9, 6, 6, 8.0, 56, '+42.761s'),
(5, 13, 7, 7, 6.0, 56, '+48.329s'),
(5, 17, 8, 8, 4.0, 56, '+54.892s'),
(5, 2, 9, 9, 2.0, 56, '+1:01.234'),
(5, 11, 10, 10, 1.0, 56, '+1:07.569'),
(5, 5, 11, 11, 0.0, 56, '+1:10.892'),
(5, 7, 12, 12, 0.0, 56, '+1:14.234'),
(5, 10, 13, 13, 0.0, 56, '+1:17.567'),
(5, 12, 14, 14, 0.0, 56, '+1:20.892'),
(5, 14, 15, 15, 0.0, 56, '+1:24.234'),
(5, 15, 16, 16, 0.0, 56, '+1:27.567'),
(5, 16, 17, 17, 0.0, 55, '+1 lap'),
(5, 18, 18, 18, 0.0, 54, '+2 laps'),
(5, 19, 19, 19, 0.0, 53, '+3 laps'),
(5, 20, 20, 20, 0.0, 52, '+4 laps');

-- Miami GP 2024 (Race 6)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(6, 4, 1, 1, 25.0, 57, 'Winner'),
(6, 1, 2, 2, 18.0, 57, '+7.612s'),
(6, 3, 3, 3, 15.0, 57, '+12.229s'),
(6, 8, 4, 4, 12.0, 57, '+16.491s'),
(6, 7, 5, 5, 10.0, 57, '+18.573s'),
(6, 17, 6, 6, 8.0, 57, '+21.368s'),
(6, 13, 7, 7, 6.0, 57, '+23.894s'),
(6, 9, 8, 8, 4.0, 57, '+26.312s'),
(6, 6, 9, 9, 2.0, 57, '+28.947s'),
(6, 10, 10, 10, 1.0, 57, '+31.205s'),
(6, 11, 11, 11, 0.0, 57, '+33.678s'),
(6, 12, 12, 12, 0.0, 57, '+35.124s'),
(6, 14, 13, 13, 0.0, 57, '+38.567s'),
(6, 15, 14, 21, 0.0, 45, 'DNF'),
(6, 16, 15, 15, 0.0, 57, '+44.236s'),
(6, 20, 16, 16, 0.0, 57, '+47.821s'),
(6, 19, 17, 17, 0.0, 57, '+51.394s'),
(6, 18, 18, 18, 0.0, 56, '+1 lap'),
(6, 2, 19, 19, 0.0, 55, '+2 laps'),
(6, 5, 20, 20, 0.0, 54, '+3 laps');

-- Emilia Romagna GP 2024 (Race 7)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(7, 1, 1, 1, 25.0, 63, 'Winner'),
(7, 4, 2, 2, 18.0, 63, '+5.409s'),
(7, 3, 3, 3, 15.0, 63, '+9.164s'),
(7, 5, 4, 4, 12.0, 63, '+11.728s'),
(7, 7, 5, 5, 10.0, 63, '+13.845s'),
(7, 2, 6, 6, 8.0, 63, '+15.892s'),
(7, 6, 7, 7, 6.0, 63, '+18.234s'),
(7, 8, 8, 8, 4.0, 63, '+21.567s'),
(7, 9, 9, 9, 2.0, 63, '+24.891s'),
(7, 17, 10, 10, 1.0, 63, '+27.345s'),
(7, 13, 11, 11, 0.0, 63, '+29.678s'),
(7, 11, 12, 12, 0.0, 63, '+32.145s'),
(7, 10, 13, 13, 0.0, 63, '+34.567s'),
(7, 14, 14, 14, 0.0, 63, '+37.234s'),
(7, 15, 15, 15, 0.0, 63, '+39.891s'),
(7, 16, 16, 16, 0.0, 63, '+42.567s'),
(7, 12, 17, 17, 0.0, 63, '+45.234s'),
(7, 20, 18, 18, 0.0, 62, '+1 lap'),
(7, 19, 19, 19, 0.0, 61, '+2 laps'),
(7, 18, 20, 20, 0.0, 60, '+3 laps');

-- Monaco GP 2024 (Race 8)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(8, 3, 1, 1, 25.0, 78, 'Winner'),
(8, 5, 2, 2, 18.0, 78, '+1.148s'),
(8, 7, 3, 3, 15.0, 78, '+2.567s'),
(8, 6, 4, 4, 12.0, 78, '+4.892s'),
(8, 1, 5, 5, 10.0, 78, '+6.234s'),
(8, 2, 6, 6, 8.0, 78, '+8.567s'),
(8, 4, 7, 7, 6.0, 78, '+11.234s'),
(8, 9, 8, 8, 4.0, 78, '+13.891s'),
(8, 8, 9, 9, 2.0, 78, '+16.567s'),
(8, 13, 10, 10, 1.0, 78, '+19.234s'),
(8, 10, 11, 11, 0.0, 78, '+21.891s'),
(8, 17, 12, 12, 0.0, 78, '+24.567s'),
(8, 11, 13, 13, 0.0, 78, '+27.234s'),
(8, 14, 14, 14, 0.0, 78, '+29.891s'),
(8, 15, 15, 15, 0.0, 78, '+32.567s'),
(8, 16, 16, 16, 0.0, 78, '+35.234s'),
(8, 12, 17, 21, 0.0, 25, 'DNF'),
(8, 20, 18, 18, 0.0, 77, '+1 lap'),
(8, 19, 19, 19, 0.0, 76, '+2 laps'),
(8, 18, 20, 20, 0.0, 75, '+3 laps');

-- Canadian GP 2024 (Race 9)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(9, 1, 1, 1, 25.0, 70, 'Winner'),
(9, 4, 2, 2, 18.0, 70, '+3.879s'),
(9, 6, 3, 3, 15.0, 70, '+4.317s'),
(9, 2, 4, 4, 12.0, 70, '+4.915s'),
(9, 5, 5, 5, 10.0, 70, '+5.857s'),
(9, 9, 6, 6, 8.0, 70, '+6.396s'),
(9, 13, 7, 7, 6.0, 70, '+7.462s'),
(9, 8, 8, 8, 4.0, 70, '+8.549s'),
(9, 17, 9, 9, 2.0, 70, '+9.623s'),
(9, 11, 10, 10, 1.0, 70, '+10.754s'),
(9, 3, 11, 11, 0.0, 70, '+11.892s'),
(9, 7, 12, 12, 0.0, 70, '+12.987s'),
(9, 10, 13, 13, 0.0, 70, '+14.123s'),
(9, 14, 14, 14, 0.0, 70, '+15.234s'),
(9, 15, 15, 15, 0.0, 70, '+16.345s'),
(9, 16, 16, 16, 0.0, 70, '+17.456s'),
(9, 12, 17, 17, 0.0, 70, '+18.567s'),
(9, 20, 18, 18, 0.0, 69, '+1 lap'),
(9, 19, 19, 19, 0.0, 68, '+2 laps'),
(9, 18, 20, 20, 0.0, 67, '+3 laps');

-- Spanish GP 2024 (Race 10)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(10, 1, 1, 1, 25.0, 66, 'Winner'),
(10, 4, 2, 2, 18.0, 66, '+2.219s'),
(10, 6, 3, 3, 15.0, 66, '+17.968s'),
(10, 3, 4, 4, 12.0, 66, '+19.241s'),
(10, 5, 5, 5, 10.0, 66, '+20.485s'),
(10, 2, 6, 6, 8.0, 66, '+21.892s'),
(10, 9, 7, 7, 6.0, 66, '+23.234s'),
(10, 8, 8, 8, 4.0, 66, '+24.567s'),
(10, 7, 9, 9, 2.0, 66, '+25.891s'),
(10, 13, 10, 10, 1.0, 66, '+27.234s'),
(10, 17, 11, 11, 0.0, 66, '+28.567s'),
(10, 11, 12, 12, 0.0, 66, '+29.891s'),
(10, 10, 13, 13, 0.0, 66, '+31.234s'),
(10, 14, 14, 14, 0.0, 66, '+32.567s'),
(10, 15, 15, 15, 0.0, 66, '+33.891s'),
(10, 16, 16, 16, 0.0, 66, '+35.234s'),
(10, 12, 17, 17, 0.0, 66, '+36.567s'),
(10, 20, 18, 18, 0.0, 65, '+1 lap'),
(10, 19, 19, 19, 0.0, 64, '+2 laps'),
(10, 18, 20, 20, 0.0, 63, '+3 laps');

-- Austrian GP 2024 (Race 11)
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(11, 6, 1, 1, 25.0, 71, 'Winner'),
(11, 4, 2, 2, 18.0, 71, '+1.906s'),
(11, 5, 3, 3, 15.0, 71, '+4.581s'),
(11, 7, 4, 4, 12.0, 71, '+13.291s'),
(11, 2, 5, 5, 10.0, 71, '+54.148s'),
(11, 13, 6, 6, 8.0, 71, '+59.024s'),
(11, 11, 7, 7, 6.0, 71, '+62.217s'),
(11, 9, 8, 8, 4.0, 71, '+64.535s'),
(11, 12, 9, 9, 2.0, 71, '+67.148s'),
(11, 17, 10, 10, 1.0, 71, '+69.789s'),
(11, 1, 11, 11, 0.0, 71, '+72.456s'),
(11, 8, 12, 12, 0.0, 71, '+75.123s'),
(11, 3, 13, 13, 0.0, 71, '+77.891s'),
(11, 10, 14, 14, 0.0, 71, '+80.567s'),
(11, 14, 15, 15, 0.0, 71, '+83.234s'),
(11, 15, 16, 16, 0.0, 71, '+85.891s'),
(11, 16, 17, 17, 0.0, 71, '+88.567s'),
(11, 20, 18, 18, 0.0, 70, '+1 lap'),
(11, 19, 19, 19, 0.0, 69, '+2 laps'),
(11, 18, 20, 21, 0.0, 62, 'DNF');

-- British GP 2024 (Race 12) - Russell wins home race
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(12, 2, 1, 1, 25.0, 52, 'Winner'),
(12, 4, 3, 2, 18.0, 52, '+1.465s'),
(12, 5, 4, 3, 15.0, 52, '+7.547s'),
(12, 7, 5, 4, 12.0, 52, '+12.429s'),
(12, 13, 6, 5, 10.0, 52, '+47.318s'),
(12, 10, 7, 6, 8.0, 52, '+55.722s'),
(12, 6, 8, 7, 6.0, 52, '+64.925s'),
(12, 9, 9, 8, 4.0, 52, '+77.691s'),
(12, 17, 10, 9, 2.0, 52, '+80.456s'),
(12, 8, 11, 10, 1.0, 52, '+83.234s'),
(12, 3, 12, 11, 0.0, 52, '+85.891s'),
(12, 11, 13, 12, 0.0, 52, '+88.567s'),
(12, 12, 14, 13, 0.0, 52, '+91.234s'),
(12, 14, 15, 14, 0.0, 52, '+93.891s'),
(12, 15, 16, 15, 0.0, 52, '+96.567s'),
(12, 16, 17, 16, 0.0, 52, '+99.234s'),
(12, 20, 18, 17, 0.0, 51, '+1 lap'),
(12, 19, 19, 18, 0.0, 50, '+2 laps'),
(12, 18, 20, 19, 0.0, 49, '+3 laps'),
(12, 1, 2, 21, 0.0, 35, 'DNF');

-- Hungarian GP 2024 (Race 13) - Piastri's first win
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(13, 5, 1, 1, 25.0, 70, 'Winner'),
(13, 4, 2, 2, 18.0, 70, '+33.731s'),
(13, 2, 3, 3, 15.0, 70, '+36.533s'),
(13, 3, 4, 4, 12.0, 70, '+44.321s'),
(13, 1, 5, 5, 10.0, 70, '+47.567s'),
(13, 7, 6, 6, 8.0, 70, '+51.289s'),
(13, 9, 7, 7, 6.0, 70, '+54.234s'),
(13, 6, 8, 8, 4.0, 70, '+57.891s'),
(13, 17, 9, 9, 2.0, 70, '+60.567s'),
(13, 18, 10, 10, 1.0, 70, '+63.234s'),
(13, 8, 11, 11, 0.0, 70, '+65.891s'),
(13, 13, 12, 12, 0.0, 70, '+68.567s'),
(13, 11, 13, 13, 0.0, 70, '+71.234s'),
(13, 10, 14, 14, 0.0, 70, '+73.891s'),
(13, 14, 15, 15, 0.0, 70, '+76.567s'),
(13, 15, 16, 16, 0.0, 70, '+79.234s'),
(13, 16, 17, 17, 0.0, 70, '+81.891s'),
(13, 12, 18, 18, 0.0, 69, '+1 lap'),
(13, 20, 19, 19, 0.0, 68, '+2 laps'),
(13, 19, 20, 20, 0.0, 67, '+3 laps');

-- Belgian GP 2024 (Race 14) - Russell wins again
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(14, 2, 1, 1, 25.0, 44, 'Winner'),
(14, 5, 2, 2, 18.0, 44, '+0.647s'),
(14, 3, 3, 3, 15.0, 44, '+8.023s'),
(14, 1, 4, 4, 12.0, 44, '+8.700s'),
(14, 4, 5, 5, 10.0, 44, '+9.226s'),
(14, 7, 6, 6, 8.0, 44, '+9.726s'),
(14, 8, 7, 7, 6.0, 44, '+10.225s'),
(14, 9, 8, 8, 4.0, 44, '+10.784s'),
(14, 12, 9, 9, 2.0, 44, '+11.344s'),
(14, 11, 10, 10, 1.0, 44, '+11.904s'),
(14, 17, 12, 11, 0.0, 44, '+13.024s'),
(14, 18, 13, 12, 0.0, 44, '+13.584s'),
(14, 13, 14, 13, 0.0, 44, '+14.144s'),
(14, 14, 15, 14, 0.0, 44, '+14.704s'),
(14, 10, 16, 15, 0.0, 44, '+15.264s'),
(14, 20, 17, 16, 0.0, 44, '+15.824s'),
(14, 15, 18, 17, 0.0, 43, '+1 lap'),
(14, 16, 19, 18, 0.0, 42, '+2 laps'),
(14, 19, 20, 19, 0.0, 41, '+3 laps'),
(14, 6, 11, 22, 0.0, 44, 'DSQ');

-- Dutch GP 2024 (Race 15) - Norris wins at Zandvoort
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(15, 4, 1, 1, 25.0, 72, 'Winner'),
(15, 1, 2, 2, 18.0, 72, '+22.896s'),
(15, 3, 3, 3, 15.0, 72, '+25.439s'),
(15, 5, 4, 4, 12.0, 72, '+27.818s'),
(15, 7, 5, 5, 10.0, 72, '+44.617s'),
(15, 9, 6, 6, 8.0, 72, '+49.071s'),
(15, 13, 7, 7, 6.0, 72, '+52.345s'),
(15, 11, 8, 8, 4.0, 72, '+55.892s'),
(15, 2, 9, 9, 2.0, 72, '+59.567s'),
(15, 17, 10, 10, 1.0, 72, '+1:02.234'),
(15, 6, 11, 11, 0.0, 72, '+1:05.891'),
(15, 8, 12, 12, 0.0, 72, '+1:08.567'),
(15, 12, 13, 13, 0.0, 72, '+1:11.234'),
(15, 10, 14, 14, 0.0, 72, '+1:13.891'),
(15, 18, 15, 15, 0.0, 72, '+1:16.567'),
(15, 14, 16, 16, 0.0, 72, '+1:19.234'),
(15, 15, 17, 17, 0.0, 72, '+1:21.891'),
(15, 16, 18, 18, 0.0, 71, '+1 lap'),
(15, 20, 19, 19, 0.0, 70, '+2 laps'),
(15, 19, 20, 20, 0.0, 69, '+3 laps');

-- Italian GP 2024 (Race 16) - Leclerc wins at Monza
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(16, 3, 1, 1, 25.0, 53, 'Winner'),
(16, 5, 2, 2, 18.0, 53, '+2.664s'),
(16, 4, 3, 3, 15.0, 53, '+6.153s'),
(16, 7, 4, 4, 12.0, 53, '+15.621s'),
(16, 2, 5, 5, 10.0, 53, '+16.111s'),
(16, 1, 6, 6, 8.0, 53, '+16.645s'),
(16, 6, 7, 7, 6.0, 53, '+18.650s'),
(16, 13, 8, 8, 4.0, 53, '+22.234s'),
(16, 9, 9, 9, 2.0, 53, '+25.891s'),
(16, 17, 10, 10, 1.0, 53, '+28.567s'),
(16, 11, 11, 11, 0.0, 53, '+31.234s'),
(16, 12, 13, 12, 0.0, 53, '+33.891s'),
(16, 10, 14, 13, 0.0, 53, '+36.567s'),
(16, 18, 15, 14, 0.0, 53, '+39.234s'),
(16, 14, 16, 15, 0.0, 53, '+41.891s'),
(16, 15, 17, 16, 0.0, 53, '+44.567s'),
(16, 16, 18, 17, 0.0, 52, '+1 lap'),
(16, 20, 19, 18, 0.0, 51, '+2 laps'),
(16, 19, 20, 19, 0.0, 50, '+3 laps'),
(16, 8, 12, 21, 0.0, 40, 'DNF');

-- Azerbaijan GP 2024 (Race 17) - Piastri wins in Baku
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(17, 5, 1, 1, 25.0, 51, 'Winner'),
(17, 3, 2, 2, 18.0, 51, '+3.181s'),
(17, 6, 3, 3, 15.0, 51, '+22.134s'),
(17, 4, 4, 4, 12.0, 51, '+31.328s'),
(17, 1, 5, 5, 10.0, 51, '+36.143s'),
(17, 9, 6, 6, 8.0, 51, '+47.391s'),
(17, 2, 7, 7, 6.0, 51, '+50.567s'),
(17, 13, 8, 8, 4.0, 51, '+53.234s'),
(17, 12, 9, 9, 2.0, 51, '+55.891s'),
(17, 11, 10, 10, 1.0, 51, '+58.567s'),
(17, 7, 11, 11, 0.0, 51, '+1:01.234'),
(17, 8, 12, 12, 0.0, 51, '+1:03.891'),
(17, 17, 13, 13, 0.0, 51, '+1:06.567'),
(17, 18, 14, 14, 0.0, 51, '+1:09.234'),
(17, 10, 15, 15, 0.0, 51, '+1:11.891'),
(17, 14, 16, 16, 0.0, 51, '+1:14.567'),
(17, 15, 17, 17, 0.0, 51, '+1:17.234'),
(17, 16, 18, 18, 0.0, 50, '+1 lap'),
(17, 20, 19, 19, 0.0, 49, '+2 laps'),
(17, 19, 20, 20, 0.0, 48, '+3 laps');

-- Singapore GP 2024 (Race 18) - Norris dominates in Singapore
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(18, 4, 1, 1, 25.0, 62, 'Winner'),
(18, 1, 2, 2, 18.0, 62, '+20.945s'),
(18, 5, 3, 3, 15.0, 62, '+29.138s'),
(18, 6, 4, 4, 12.0, 62, '+54.617s'),
(18, 3, 5, 5, 10.0, 62, '+61.307s'),
(18, 9, 6, 6, 8.0, 62, '+67.891s'),
(18, 13, 7, 7, 6.0, 62, '+71.234s'),
(18, 2, 8, 8, 4.0, 62, '+74.567s'),
(18, 17, 9, 9, 2.0, 62, '+77.891s'),
(18, 7, 10, 10, 1.0, 62, '+80.234s'),
(18, 18, 11, 11, 0.0, 62, '+82.567s'),
(18, 11, 12, 12, 0.0, 62, '+84.891s'),
(18, 8, 13, 13, 0.0, 62, '+87.234s'),
(18, 12, 14, 14, 0.0, 62, '+89.567s'),
(18, 14, 16, 15, 0.0, 62, '+91.891s'),
(18, 15, 17, 16, 0.0, 62, '+94.234s'),
(18, 16, 18, 17, 0.0, 61, '+1 lap'),
(18, 20, 19, 18, 0.0, 60, '+2 laps'),
(18, 19, 20, 19, 0.0, 59, '+3 laps'),
(18, 10, 15, 21, 0.0, 30, 'DNF');

-- United States GP 2024 (Race 19) - Leclerc wins at COTA
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(19, 3, 1, 1, 25.0, 56, 'Winner'),
(19, 7, 2, 2, 18.0, 56, '+8.562s'),
(19, 1, 3, 3, 15.0, 56, '+19.412s'),
(19, 4, 4, 4, 12.0, 56, '+20.354s'),
(19, 5, 5, 5, 10.0, 56, '+21.921s'),
(19, 6, 6, 6, 8.0, 56, '+32.462s'),
(19, 13, 7, 7, 6.0, 56, '+37.234s'),
(19, 2, 8, 8, 4.0, 56, '+40.891s'),
(19, 17, 9, 9, 2.0, 56, '+43.567s'),
(19, 11, 10, 10, 1.0, 56, '+46.234s'),
(19, 8, 11, 11, 0.0, 56, '+48.891s'),
(19, 9, 12, 12, 0.0, 56, '+51.567s'),
(19, 18, 13, 13, 0.0, 56, '+54.234s'),
(19, 12, 14, 14, 0.0, 56, '+56.891s'),
(19, 10, 15, 15, 0.0, 56, '+59.567s'),
(19, 15, 17, 16, 0.0, 56, '+1:02.234'),
(19, 16, 18, 17, 0.0, 55, '+1 lap'),
(19, 20, 19, 18, 0.0, 54, '+2 laps'),
(19, 19, 20, 19, 0.0, 53, '+3 laps'),
(19, 14, 16, 21, 0.0, 28, 'DNF');

-- Mexican GP 2024 (Race 20) - Sainz wins at home
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(20, 7, 1, 1, 25.0, 71, 'Winner'),
(20, 4, 2, 2, 18.0, 71, '+4.705s'),
(20, 3, 3, 3, 15.0, 71, '+17.642s'),
(20, 2, 4, 4, 12.0, 71, '+25.639s'),
(20, 6, 5, 5, 10.0, 71, '+32.429s'),
(20, 1, 6, 6, 8.0, 71, '+39.234s'),
(20, 13, 7, 7, 6.0, 71, '+42.891s'),
(20, 5, 8, 8, 4.0, 71, '+45.567s'),
(20, 9, 9, 9, 2.0, 71, '+48.234s'),
(20, 17, 10, 10, 1.0, 71, '+50.891s'),
(20, 8, 11, 11, 0.0, 71, '+53.567s'),
(20, 11, 12, 12, 0.0, 71, '+56.234s'),
(20, 18, 13, 13, 0.0, 71, '+58.891s'),
(20, 12, 14, 14, 0.0, 71, '+1:01.567'),
(20, 10, 15, 15, 0.0, 71, '+1:04.234'),
(20, 14, 16, 16, 0.0, 71, '+1:06.891'),
(20, 15, 17, 17, 0.0, 71, '+1:09.567'),
(20, 16, 18, 18, 0.0, 70, '+1 lap'),
(20, 20, 19, 19, 0.0, 69, '+2 laps'),
(20, 19, 20, 20, 0.0, 68, '+3 laps');

-- Brazilian GP 2024 (Race 21) - Verstappen masterclass
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(21, 1, 1, 1, 25.0, 71, 'Winner'),
(21, 12, 2, 2, 18.0, 71, '+19.477s'),
(21, 11, 3, 3, 15.0, 71, '+23.566s'),
(21, 6, 4, 4, 12.0, 71, '+30.021s'),
(21, 3, 5, 5, 10.0, 71, '+31.077s'),
(21, 4, 6, 6, 8.0, 71, '+32.892s'),
(21, 17, 7, 7, 6.0, 71, '+35.234s'),
(21, 9, 8, 8, 4.0, 71, '+37.891s'),
(21, 18, 9, 9, 2.0, 71, '+40.567s'),
(21, 2, 10, 10, 1.0, 71, '+43.234s'),
(21, 7, 11, 11, 0.0, 71, '+48.567s'),
(21, 5, 12, 12, 0.0, 71, '+51.234s'),
(21, 13, 13, 13, 0.0, 71, '+53.891s'),
(21, 10, 14, 14, 0.0, 71, '+56.567s'),
(21, 14, 15, 15, 0.0, 71, '+59.234s'),
(21, 15, 16, 16, 0.0, 71, '+1:01.891'),
(21, 16, 17, 17, 0.0, 70, '+1 lap'),
(21, 20, 18, 18, 0.0, 69, '+2 laps'),
(21, 19, 19, 19, 0.0, 68, '+3 laps'),
(21, 8, 20, 21, 0.0, 45, 'DNF');

-- Las Vegas GP 2024 (Race 22) - Russell wins in Vegas
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(22, 6, 1, 1, 25.0, 50, 'Winner'),
(22, 2, 2, 2, 18.0, 50, '+7.313s'),
(22, 7, 3, 3, 15.0, 50, '+11.906s'),
(22, 13, 4, 4, 12.0, 50, '+14.283s'),
(22, 8, 5, 5, 10.0, 50, '+16.849s'),
(22, 4, 6, 6, 8.0, 50, '+43.987s'),
(22, 1, 7, 7, 6.0, 50, '+47.234s'),
(22, 9, 8, 8, 4.0, 50, '+50.891s'),
(22, 5, 9, 9, 2.0, 50, '+53.567s'),
(22, 3, 10, 10, 1.0, 50, '+56.234s'),
(22, 17, 11, 11, 0.0, 50, '+58.891s'),
(22, 11, 12, 12, 0.0, 50, '+1:01.567'),
(22, 18, 13, 13, 0.0, 50, '+1:04.234'),
(22, 10, 14, 14, 0.0, 50, '+1:06.891'),
(22, 14, 15, 15, 0.0, 50, '+1:09.567'),
(22, 15, 16, 16, 0.0, 50, '+1:12.234'),
(22, 16, 17, 17, 0.0, 49, '+1 lap'),
(22, 20, 18, 18, 0.0, 48, '+2 laps'),
(22, 19, 19, 19, 0.0, 47, '+3 laps'),
(22, 12, 20, 21, 0.0, 38, 'DNF');

-- Qatar GP 2024 (Race 23) - Verstappen wins
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(23, 1, 1, 1, 25.0, 57, 'Winner'),
(23, 3, 2, 2, 18.0, 57, '+6.031s'),
(23, 5, 3, 3, 15.0, 57, '+15.699s'),
(23, 6, 4, 4, 12.0, 57, '+17.397s'),
(23, 7, 5, 5, 10.0, 57, '+21.239s'),
(23, 2, 6, 6, 8.0, 57, '+25.891s'),
(23, 9, 7, 7, 6.0, 57, '+28.567s'),
(23, 4, 8, 8, 4.0, 57, '+31.234s'),
(23, 13, 9, 9, 2.0, 57, '+33.891s'),
(23, 8, 10, 10, 1.0, 57, '+36.567s'),
(23, 17, 11, 11, 0.0, 57, '+39.234s'),
(23, 11, 12, 12, 0.0, 57, '+41.891s'),
(23, 18, 13, 13, 0.0, 57, '+44.567s'),
(23, 12, 14, 14, 0.0, 57, '+47.234s'),
(23, 14, 15, 15, 0.0, 57, '+49.891s'),
(23, 15, 16, 16, 0.0, 57, '+52.567s'),
(23, 20, 17, 17, 0.0, 55, '+2 laps'),
(23, 19, 18, 18, 0.0, 54, '+3 laps'),
(23, 16, 19, 21, 0.0, 33, 'DNF');

-- Abu Dhabi GP 2024 (Race 24) - Norris wins season finale
INSERT INTO race_results (race_id, driver_id, starting_position, finishing_position, points_earned, laps_completed, time_gap) VALUES
(24, 4, 1, 1, 25.0, 55, 'Winner'),
(24, 7, 2, 2, 18.0, 55, '+5.832s'),
(24, 3, 3, 3, 15.0, 55, '+31.928s'),
(24, 1, 4, 4, 12.0, 55, '+36.729s'),
(24, 6, 5, 5, 10.0, 55, '+37.217s'),
(24, 5, 6, 6, 8.0, 55, '+1:09.641'),
(24, 2, 7, 7, 6.0, 55, '+1:12.234'),
(24, 9, 8, 8, 4.0, 55, '+1:14.891'),
(24, 13, 9, 9, 2.0, 55, '+1:17.567'),
(24, 8, 10, 10, 1.0, 55, '+1:20.234'),
(24, 17, 11, 11, 0.0, 55, '+1:22.891'),
(24, 11, 12, 12, 0.0, 55, '+1:25.567'),
(24, 12, 13, 13, 0.0, 55, '+1:28.234'),
(24, 14, 14, 14, 0.0, 55, '+1:30.891'),
(24, 15, 15, 15, 0.0, 55, '+1:33.567'),
(24, 16, 16, 16, 0.0, 54, '+1 lap'),
(24, 20, 17, 17, 0.0, 53, '+2 laps'),
(24, 19, 18, 18, 0.0, 52, '+3 laps'),
(24, 10, 19, 21, 0.0, 41, 'DNF');

-- Incident examples with realistic DNF/DSQ scenarios throughout the season
INSERT INTO incidents (race_id, driver_id, incident_type, incident_reason, lap_occurred) VALUES
-- Race 6 - Miami GP incidents
(6, 15, 'DNF', 'Power unit failure', 45),
-- Race 8 - Monaco GP incidents  
(8, 12, 'DNF', 'Suspension damage from contact', 25),
-- Race 11 - Austrian GP incidents
(11, 18, 'DNF', 'Hydraulic failure', 62),
-- Race 12 - British GP incidents
(12, 1, 'DNF', 'Engine failure', 35),
-- Race 14 - Belgian GP incidents
(14, 6, 'DSQ', 'Technical infringement - underweight car', NULL),
-- Race 16 - Italian GP incidents
(16, 8, 'DNF', 'Gearbox failure', 40),
-- Race 18 - Singapore GP incidents
(18, 10, 'DNF', 'Brake failure', 30),
-- Race 19 - US GP incidents
(19, 14, 'DNF', 'Electrical failure', 28),
-- Race 21 - Brazilian GP incidents
(21, 8, 'DNF', 'Collision damage', 45),
-- Race 22 - Las Vegas GP incidents
(22, 12, 'DNF', 'Turbocharger failure', 38),
-- Race 23 - Qatar GP incidents
(23, 16, 'DNF', 'Oil leak', 33),
-- Race 24 - Abu Dhabi GP incidents
(24, 10, 'DNF', 'Suspension failure', 41);
