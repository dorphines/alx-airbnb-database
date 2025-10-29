-- This script demonstrates how to partition the Booking table by start_date.
-- The syntax is for PostgreSQL. Other databases have different syntax.

-- First, we would create a new partitioned table.
CREATE TABLE Booking_partitioned (
    booking_id UUID,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Then, we create partitions for different date ranges.
-- For example, creating partitions for each year.
CREATE TABLE Booking_y2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_y2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_y2026 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- After creating the partitioned table and its partitions,
-- you would migrate the data from the old Booking table to the new one.
-- INSERT INTO Booking_partitioned SELECT * FROM Booking;

-- Finally, you would replace the old table with the new one.
-- ALTER TABLE Booking RENAME TO Booking_old;
-- ALTER TABLE Booking_partitioned RENAME TO Booking;

-- Note: The ENUM type might need to be handled properly during this migration,
-- depending on the database system.
