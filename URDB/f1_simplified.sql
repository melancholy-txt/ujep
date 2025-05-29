-- Simplified F1 Database Schema
-- Removed unnecessary relations and redundancies

CREATE TABLE `countries` (
  `country_id` INT PRIMARY KEY AUTO_INCREMENT,
  `country_name` VARCHAR(100) UNIQUE NOT NULL,
  `country_code` VARCHAR(3) UNIQUE NOT NULL,
  `continent` ENUM ('North America', 'South America', 'Europe', 'Asia', 'Africa', 'Oceania') NOT NULL,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `drivers` (
  `driver_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `country_id` INT NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `driver_number` INT,
  `championships_won` INT DEFAULT 0,
  `career_starts` INT DEFAULT 0,
  `career_wins` INT DEFAULT 0,
  `career_podiums` INT DEFAULT 0,
  `career_points` DECIMAL(5,1) DEFAULT 0,
  `is_active` BOOLEAN DEFAULT true,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `team_principals` (
  `principal_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `country_id` INT NOT NULL,
  `date_of_birth` DATE,
  `years_of_experience` INT DEFAULT 0,
  `previous_teams` TEXT,
  `is_active` BOOLEAN DEFAULT true,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `teams` (
  `team_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_name` VARCHAR(100) UNIQUE NOT NULL,
  `full_name` VARCHAR(150),
  `base_location` VARCHAR(100),
  `principal_id` INT,
  `founded_year` INT,
  `championships_won` INT DEFAULT 0,
  `total_wins` INT DEFAULT 0,
  `total_podiums` INT DEFAULT 0,
  `total_points` DECIMAL(5,1) DEFAULT 0,
  `is_active` BOOLEAN DEFAULT true,
  `team_color` VARCHAR(7),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `tracks` (
  `track_id` INT PRIMARY KEY AUTO_INCREMENT,
  `track_name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  `country_id` INT NOT NULL,
  `track_length_km` DECIMAL(5,3) NOT NULL,
  `number_of_turns` INT NOT NULL,
  `first_grand_prix_year` INT,
  `is_active` BOOLEAN DEFAULT true,
  `track_type` ENUM ('permanent', 'street', 'temporary') DEFAULT 'permanent',
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `seasons` (
  `season_id` INT PRIMARY KEY AUTO_INCREMENT,
  `year` INT UNIQUE NOT NULL,
  `number_of_races` INT NOT NULL,
  `season_start_date` DATE,
  `season_end_date` DATE,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `races` (
  `race_id` INT PRIMARY KEY AUTO_INCREMENT,
  `season_id` INT NOT NULL,
  `track_id` INT NOT NULL,
  `race_name` VARCHAR(100) NOT NULL,
  `race_date` DATE NOT NULL,
  `race_time` TIME,
  `round_number` INT NOT NULL,
  `total_laps` INT NOT NULL,
  `weather_conditions` ENUM ('Clear', 'Partly Cloudy', 'Overcast', 'Sunny', 'Rain', 'Hot', 'Variable', 'Hot & Humid', 'Cool') DEFAULT 'Clear',
  `safety_cars` INT DEFAULT 0,
  `red_flags` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `team_drivers` (
  `team_driver_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `contract_start_date` DATE,
  `contract_end_date` DATE,
  `is_reserve_driver` BOOLEAN DEFAULT false,
  `salary_millions` DECIMAL(5,2),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `race_results` (
  `result_id` INT PRIMARY KEY AUTO_INCREMENT,
  `race_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `starting_position` INT NOT NULL,
  `finishing_position` INT, -- NULL for DNF
  `points_earned` DECIMAL(4,1) DEFAULT 0,
  `laps_completed` INT NOT NULL,
  `race_time` TIME,
  `time_gap` VARCHAR(20),
  `fastest_lap_time` TIME,
  `pit_stops` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `incidents` (
  `incident_id` INT PRIMARY KEY AUTO_INCREMENT,
  `race_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `incident_type` ENUM('DNF', 'DSQ') NOT NULL,
  `incident_reason` VARCHAR(200) NOT NULL,
  `lap_occurred` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `engines` (
  `engine_id` INT PRIMARY KEY AUTO_INCREMENT,
  `manufacturer` VARCHAR(50) NOT NULL,
  `engine_name` VARCHAR(100) NOT NULL,
  `engine_type` VARCHAR(50),
  `horsepower` INT,
  `is_active` BOOLEAN DEFAULT true,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `team_engines` (
  `team_engine_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `engine_id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `is_manufacturer_team` BOOLEAN DEFAULT false,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- Indexes
CREATE UNIQUE INDEX `unique_season_round` ON `races` (`season_id`, `round_number`);
CREATE UNIQUE INDEX `unique_driver_season` ON `team_drivers` (`driver_id`, `season_id`, `is_reserve_driver`);
CREATE UNIQUE INDEX `unique_race_driver` ON `race_results` (`race_id`, `driver_id`);
CREATE UNIQUE INDEX `unique_team_season_engine` ON `team_engines` (`team_id`, `season_id`);
CREATE UNIQUE INDEX `unique_incident` ON `incidents` (`race_id`, `driver_id`, `incident_type`);

-- Foreign Keys
ALTER TABLE `drivers` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);
ALTER TABLE `team_principals` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);
ALTER TABLE `teams` ADD FOREIGN KEY (`principal_id`) REFERENCES `team_principals` (`principal_id`);
ALTER TABLE `tracks` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);
ALTER TABLE `races` ADD FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`);
ALTER TABLE `races` ADD FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`);
ALTER TABLE `team_drivers` ADD FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
ALTER TABLE `team_drivers` ADD FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);
ALTER TABLE `team_drivers` ADD FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`);
ALTER TABLE `race_results` ADD FOREIGN KEY (`race_id`) REFERENCES `races` (`race_id`);
ALTER TABLE `race_results` ADD FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);
ALTER TABLE `incidents` ADD FOREIGN KEY (`race_id`) REFERENCES `races` (`race_id`);
ALTER TABLE `incidents` ADD FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);
ALTER TABLE `team_engines` ADD FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
ALTER TABLE `team_engines` ADD FOREIGN KEY (`engine_id`) REFERENCES `engines` (`engine_id`);
ALTER TABLE `team_engines` ADD FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`);
