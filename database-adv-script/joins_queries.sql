-- 1. INNER JOIN to retrieve all bookings and the respective users who made them.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id;

-- 2. LEFT JOIN to retrieve all properties and their reviews, including properties with no reviews.
SELECT
    p.property_id,
    p.name AS property_name,
    r.rating,
    r.comment
FROM
    Property p
LEFT JOIN
    Review r ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN to retrieve all users and all bookings.
-- This query shows users who haven't made bookings and bookings that might not be linked to a user.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    User u
FULL OUTER JOIN
    Booking b ON u.user_id = b.user_id;
