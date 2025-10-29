-- Recommended indexes for optimizing query performance.

-- Index on User table for searching by name.
CREATE INDEX idx_user_name ON User(first_name, last_name);

-- Index on Property table for searching by host.
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on Property table for searching by location.
CREATE INDEX idx_property_location ON Property(location);

-- Index on Booking table for filtering by date ranges.
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
