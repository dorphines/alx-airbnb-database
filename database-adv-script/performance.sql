-- Refactored query to retrieve specific booking details for confirmed bookings.
-- This query is more efficient as it selects fewer columns and filters by status.
SELECT
    b.booking_id,
    b.start_date,
    u.first_name,
    p.name AS property_name,
    pay.amount
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed';