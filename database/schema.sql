CREATE DATABASE IF NOT EXISTS campusconnect;

USE campusconnect;

CREATE TABLE IF NOT EXISTS students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
role ENUM('student', 'admin') DEFAULT 'student'
);

CREATE TABLE IF NOT EXISTS events (
event_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150) NOT NULL,
description TEXT,
category VARCHAR(50),
event_date DATETIME NOT NULL,
venue VARCHAR(150),
capacity INT NOT NULL DEFAULT 100,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS registrations (
registration_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
event_id INT NOT NULL,
registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
status ENUM('registered', 'cancelled') DEFAULT 'registered',
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (event_id) REFERENCES events(event_id),
UNIQUE (student_id, event_id)
);
