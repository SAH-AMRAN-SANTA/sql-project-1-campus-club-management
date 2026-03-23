INSERT INTO students (first_name, last_name, email, course, year_level) VALUES
('Sah', 'Santa', 'sah.santa@example.com', 'Information Technology', 2),
('Ava', 'Rahman', 'ava.rahman@example.com', 'Business Information Systems', 1),
('Noah', 'Karim', 'noah.karim@example.com', 'Cybersecurity', 3),
('Mia', 'Hasan', 'mia.hasan@example.com', 'Software Engineering', 2),
('Liam', 'Chowdhury', 'liam.chowdhury@example.com', 'Data Analytics', 1),
('Emma', 'Islam', 'emma.islam@example.com', 'Information Technology', 3);

INSERT INTO clubs (club_name, category, founded_year) VALUES
('Coding Club', 'Technology', 2020),
('Robotics Society', 'Engineering', 2019),
('Business Leaders Club', 'Business', 2021),
('Cyber Security Circle', 'Technology', 2022);

INSERT INTO memberships (student_id, club_id, join_date, role) VALUES
(1, 1, '2026-01-15', 'Member'),
(1, 4, '2026-02-01', 'Member'),
(2, 3, '2026-01-20', 'Secretary'),
(3, 4, '2026-01-25', 'President'),
(4, 1, '2026-02-10', 'Vice President'),
(5, 1, '2026-02-12', 'Member'),
(6, 2, '2026-02-15', 'Member');

INSERT INTO events (club_id, event_name, event_date, location, max_capacity) VALUES
(1, 'Intro to SQL Workshop', '2026-04-05', 'Room A101', 50),
(1, 'Python for Beginners', '2026-04-20', 'Lab 3', 40),
(2, 'Robotics Demo Day', '2026-04-12', 'Engineering Hall', 60),
(3, 'Startup Pitch Night', '2026-04-25', 'Business Centre', 80),
(4, 'Cyber Awareness Seminar', '2026-04-18', 'Auditorium', 100);

INSERT INTO registrations (event_id, student_id, registration_date, attendance_status) VALUES
(1, 1, '2026-03-20', 'Attended'),
(1, 4, '2026-03-21', 'Attended'),
(1, 5, '2026-03-22', 'Registered'),
(2, 1, '2026-03-25', 'Registered'),
(3, 6, '2026-03-24', 'Attended'),
(4, 2, '2026-03-26', 'Registered'),
(5, 1, '2026-03-27', 'Registered'),
(5, 3, '2026-03-27', 'Attended');