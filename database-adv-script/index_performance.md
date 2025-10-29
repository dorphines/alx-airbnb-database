# Task 3: Implement Indexes for Optimization

This document outlines the strategy for implementing indexes to optimize database query performance for the Airbnb database.

## Identified Columns for Indexing

Based on common query patterns, the following columns were identified as candidates for indexing to improve performance:

-   **`User(first_name, last_name)`**: Queries that filter or sort by user names will be significantly faster. A composite index is created for cases where users are looked up by both first and last names.
-   **`Property(host_id)`**: Joining `Property` and `User` tables on `host_id` will be more efficient. This is a common operation to find properties belonging to a specific host.
-   **`Property(location)`**: Searching for properties in a specific location is a primary use case for the application. Indexing this column will speed up location-based searches.
-   **`Booking(start_date, end_date)`**: Queries that filter bookings by a date range (e.g., finding all bookings in the next month) will see a substantial performance improvement.

## SQL `CREATE INDEX` Commands

The following SQL commands are saved in `database_index.sql` to create the new indexes:

```sql
-- Index on User table for searching by name.
CREATE INDEX idx_user_name ON User(first_name, last_name);

-- Index on Property table for searching by host.
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on Property table for searching by location.
CREATE INDEX idx_property_location ON Property(location);

-- Index on Booking table for filtering by date ranges.
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
```

## Performance Measurement (`EXPLAIN` / `ANALYZE`)

To measure the impact of these indexes, one would use the `EXPLAIN` or `ANALYZE` command on a query before and after creating the index.

**Example Analysis:**

Consider a query to find all bookings within a specific date range:

```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date >= '2025-11-01' AND end_date <= '2025-11-30';
```

**Before Indexing:**

The query plan would likely show a "Sequential Scan" on the `Booking` table. This means the database has to read through every single row to find the matching bookings, which is very inefficient for large tables.

**After Indexing:**

After creating the `idx_booking_dates` index, the query plan would change to an "Index Scan" or "Bitmap Index Scan". The database can use the index to directly locate the rows that match the date range, drastically reducing the number of rows that need to be read and resulting in a much faster query.

Similar improvements would be observed for queries filtering by user names, property locations, or joining on `host_id`.
