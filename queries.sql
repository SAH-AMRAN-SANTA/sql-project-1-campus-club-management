-- Query 1: Display all data
SELECT * FROM students;
SELECT * FROM clubs;
SELECT * FROM memberships;
SELECT * FROM events;
SELECT * FROM registrations;

-- Query 2: Students and their clubs
SELECT 
    s.first_name,
    s.last_name,
    c.club_name,
    m.role
FROM memberships m
JOIN students s ON m.student_id = s.student_id
JOIN clubs c ON m.club_id = c.club_id;

-- Query 3: Events and clubs
SELECT 
    c.club_name,
    e.event_name,
    e.event_date
FROM events e
JOIN clubs c ON e.club_id = c.club_id;

-- Query 4: Members per club
SELECT 
    c.club_name,
    COUNT(m.student_id) AS total_members
FROM clubs c
LEFT JOIN memberships m ON c.club_id = m.club_id
GROUP BY c.club_name;

-- Query 5: Registrations per event
SELECT 
    e.event_name,
    COUNT(r.registration_id) AS total_registrations
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_name;

-- Query 6: Most popular club
SELECT 
    c.club_name,
    COUNT(m.student_id) AS member_count
FROM clubs c
JOIN memberships m ON c.club_id = m.club_id
GROUP BY c.club_name
ORDER BY member_count DESC
LIMIT 1;

-- Query 7: Remaining capacity
SELECT 
    e.event_name,
    e.max_capacity,
    COUNT(r.registration_id) AS current_registrations,
    (e.max_capacity - COUNT(r.registration_id)) AS remaining_slots
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_id, e.event_name, e.max_capacity;

-- Query 8: Students in multiple events
SELECT 
    s.first_name,
    s.last_name,
    COUNT(r.event_id) AS total_events
FROM students s
JOIN registrations r ON s.student_id = r.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(r.event_id) > 1;

-- Query 9: Attended students
SELECT 
    s.first_name,
    s.last_name
FROM registrations r
JOIN students s ON r.student_id = s.student_id
WHERE r.attendance_status = 'Attended';

-- Query 10: View output
SELECT * FROM event_summary;