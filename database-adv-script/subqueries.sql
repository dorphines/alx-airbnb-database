-- 1. Find all properties with an average rating greater than 4.0 using a non-correlated subquery.
SELECT
    p.property_id,
    p.name,
    p.description,
    p.location
FROM
    Property p
WHERE
    p.property_id IN (
        SELECT
            r.property_id
        FROM
            Review r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

-- 2. Find users who have made more than 3 bookings using a correlated subquery.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    User u
WHERE
    (
        SELECT
            COUNT(b.booking_id)
        FROM
            Booking b
        WHERE
            b.user_id = u.user_id
    ) > 3;
