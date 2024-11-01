USE database_demo;

CREATE TABLE `host`(
	`id` INT PRIMARY KEY,
    `name` VARCHAR(45),
    `address` VARCHAR(45)
);

CREATE TABLE contractor(
	id INT PRIMARY KEY,
    `name` VARCHAR(255),
    `address` VARCHAR(255),
    `contractorcol` VARCHAR(45)
);

CREATE TABLE building(
	`id` INT PRIMARY KEY,
    `name` VARCHAR(45),
    `address` VARCHAR(45),
    `city` VARCHAR(45),
    `cost` FLOAT,
    `start` DATE,
    `host_id` INT,
    `contractor_id` INT,
    FOREIGN KEY (`host_id`) REFERENCES `host`(id),
    FOREIGN KEY (`contractor_id`) REFERENCES contractor(id)
);

CREATE TABLE worker(
	id INT PRIMARY KEY,
    `name` VARCHAR(45),
    birthday VARCHAR(45),
    `year` VARCHAR(45),
    skill VARCHAR(45)
);

CREATE TABLE architect(
	id INT PRIMARY KEY,
    `name` VARCHAR(255),
    sex TINYINT(1),
    birthday DATE,
    place VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE work(
	building_id INT,
    worker_id INT,
    `date` DATE,
    total VARCHAR(45),
    FOREIGN KEY (building_id) REFERENCES building(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE design(
	building_id INT,
    architect_id INT,
    benefit VARCHAR(45),
    FOREIGN KEY (building_id) REFERENCES building(id),
	FOREIGN KEY (architect_id) REFERENCES architect(id)
);