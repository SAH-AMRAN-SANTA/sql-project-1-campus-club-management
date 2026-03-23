DROP DATABASE IF EXISTS campus_club_management; 
CREATE DATABASE campus_club_management; 
USE campus_club_management;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    course VARCHAR(100) NOT NULL,
    year_level INT NOT NULL
);

CREATE TABLE clubs (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    club_name VARCHAR(100) UNIQUE NOT NULL,
    category VARCHAR(50) NOT NULL,
    founded_year INT NOT NULL
);

CREATE TABLE memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    club_id INT NOT NULL,
    join_date DATE NOT NULL,
    role VARCHAR(50) DEFAULT 'Member',
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (club_id) REFERENCES clubs (club_id)
);

CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    club_id INT NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    max_capacity INT NOT NULL,
    FOREIGN KEY (club_id) REFERENCES clubs (club_id)
);

CREATE TABLE registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    student_id INT NOT NULL,
    registration_date DATE NOT NULL,
    attendance_status VARCHAR(20) DEFAULT 'Registered',
    FOREIGN KEY (event_id) REFERENCES events (event_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

CREATE VIEW event_summary AS
SELECT 
    e.event_id,
    e.event_name,
    c.club_name,
    e.event_date,
    e.location,
    e.max_capacity,
    COUNT(r.registration_id) AS total_registrations
FROM events e
JOIN clubs c ON e.club_id = c.club_id
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_id, e.event_name, c.club_name, e.event_date, e.location, e.max_capacity;