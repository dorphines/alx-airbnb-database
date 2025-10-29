# Task 4: Optimize Complex Queries

This report details the process of optimizing a complex query that retrieves booking information from the database.

## Initial Query

The initial query, saved in `performance.sql`, joins the `Booking`, `User`, `Property`, and `Payment` tables to gather comprehensive details for each booking.

```sql
-- Initial complex query to retrieve all booking details.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pay ON b.booking_id = pay.booking_id;
```

## Performance Analysis (`EXPLAIN`)

Running `EXPLAIN` on this query without proper indexes would reveal several performance bottlenecks:

1.  **Sequential Scans**: Without indexes on the foreign key columns (`b.user_id`, `b.property_id`, `pay.booking_id`), the database would perform full table scans for each join operation, which is highly inefficient.
2.  **Join Order**: The database query planner might not choose the optimal join order, leading to large intermediate result sets.

Even with the indexes from `schema.sql` (`idx_booking_user_id`, `idx_booking_property_id`, `idx_payment_booking_id`), the query can still be improved. For example, if we only need a subset of columns, selecting all columns is wasteful.

## Refactored and Optimized Query

The query can be refactored for performance. The optimization strategy depends on the specific use case.

**Scenario 1: We need all the information.**

In this case, the joins are necessary. The best optimization is to ensure all join keys are indexed. The `schema.sql` and our `database_index.sql` have already addressed this. The query is already reasonably optimized if indexes are present.

**Scenario 2: We only need a summary.**

If we only need a count of bookings or aggregated data, we can rewrite the query to avoid fetching all columns.

**Scenario 3: Reducing query complexity.**

If the application can make separate, smaller queries, it might be more performant than one large join. For example, fetch the booking details first, and then fetch user and property details on demand.

For this report, we will assume the initial query is necessary and focus on ensuring the correct indexes are in place. The indexes on `Booking(user_id)`, `Booking(property_id)`, and `Payment(booking_id)` are critical.

Here is a slightly refactored version that assumes we only need specific fields for a report. This reduces the amount of data transferred.

```sql
-- Refactored query to retrieve specific booking details.
-- This version is more efficient if only these fields are needed.
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
```

This refactored query also adds a `WHERE` clause, which is common in real-world scenarios. An index on `Booking(status)` would further optimize this query.
