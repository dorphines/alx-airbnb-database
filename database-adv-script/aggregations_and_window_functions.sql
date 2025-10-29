-- 1. Find the total number of bookings made by each user.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    User u
LEFT JOIN
    Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id,
    u.first_name,
    u.last_name
ORDER BY
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received.
WITH PropertyBookingCounts AS (
    SELECT
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS booking_count
    FROM
        Property p
    LEFT JOIN
        Booking b ON p.property_id = b.property_id
    GROUP BY
        p.property_id,
        p.name
)
SELECT
    property_id,
    name,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS property_rank
FROM
    PropertyBookingCounts
ORDER BY
    property_rank;
