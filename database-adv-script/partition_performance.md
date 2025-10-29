# Task 5: Partitioning Large Tables

This document explains the implementation of table partitioning on the `Booking` table and the expected performance improvements.

## Partitioning Strategy

The `Booking` table is partitioned by `RANGE` on the `start_date` column. This is an effective strategy because many queries on the `Booking` table are likely to involve filtering by a date range. For example, users might search for bookings within a specific month or quarter.

The partitioning is demonstrated in the `partitioning.sql` file, using a PostgreSQL-like syntax. The script creates a new partitioned table and defines several partitions, each corresponding to a year.

## How Partitioning Improves Performance

When a table is partitioned, the database stores the data in separate physical locations (the partitions). When a query with a `WHERE` clause on the partition key (`start_date` in this case) is executed, the database's query planner can perform "partition pruning."

**Partition Pruning:**

This means the planner can identify which specific partitions contain the data that could satisfy the query, and it will only scan those partitions, ignoring all the others.

**Example Query:**

```sql
SELECT *
FROM Booking
WHERE start_date >= '2025-06-01' AND start_date < '2025-07-01';
```

**Without Partitioning:**

The database would have to scan the entire `Booking` table to find the bookings in June 2025.

**With Partitioning:**

The query planner knows that all data for June 2025 resides in the `Booking_y2025` partition. It will scan only that partition, which is much smaller than the entire table. This results in a dramatic reduction in I/O and a significant speedup in query execution time.

## Observed Improvements

By implementing partitioning on the `Booking` table based on `start_date`, we would observe the following improvements for date-range queries:

-   **Faster Query Response Times**: Queries filtering by `start_date` will be significantly faster due to partition pruning.
-   **Improved Scalability**: As the `Booking` table grows, query performance for date-range queries will remain relatively stable because the database will only scan the relevant partitions.
-   **Easier Data Management**: Partitioning can simplify maintenance tasks like archiving or deleting old data. For example, to delete all bookings from 2024, you could simply drop the `Booking_y2024` partition, which is much faster than a `DELETE` statement.

In summary, partitioning the `Booking` table is a powerful technique for managing large datasets and ensuring high-performance queries.
