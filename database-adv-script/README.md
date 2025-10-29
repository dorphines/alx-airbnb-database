# Task 0: Write Complex Queries with Joins

This directory contains the solution for Task 0 of the `querying_tasks` project.

## `joins_queries.sql`

This SQL script contains three queries that demonstrate the use of different types of joins:

1.  **INNER JOIN**: Retrieves all bookings along with the details of the user who made each booking.
2.  **LEFT JOIN**: Lists all properties and their corresponding reviews. Properties without any reviews are also included.
3.  **FULL OUTER JOIN**: Shows a combined list of all users and all bookings, including users who have never made a booking and bookings that may not be associated with a user.

---

# Task 1: Practice Subqueries

This section covers the solution for Task 1.

## `subqueries.sql`

This SQL script includes two queries that demonstrate the use of subqueries:

1.  **Non-Correlated Subquery**: Retrieves all properties that have an average rating greater than 4.0.
2.  **Correlated Subquery**: Lists all users who have made more than three bookings.

---

# Task 2: Apply Aggregations and Window Functions

This section covers the solution for Task 2.

## `aggregations_and_window_functions.sql`

This SQL script demonstrates the use of aggregation and window functions:

1.  **Aggregation**: Calculates the total number of bookings for each user using `COUNT` and `GROUP BY`.
2.  **Window Function**: Ranks properties based on the total number of bookings they have received, using the `RANK()` window function.

---

# Task 3: Implement Indexes for Optimization

This section covers the solution for Task 3.

## `database_index.sql`

This file contains `CREATE INDEX` statements for adding new indexes to the database to improve query performance.

## `index_performance.md`

This markdown file explains the rationale behind the chosen indexes and describes how their performance impact would be measured using `EXPLAIN` and `ANALYZE`.

---

# Task 4: Optimize Complex Queries

This section covers the. solution for Task 4.

## `performance.sql`

This file contains a complex query that has been refactored for better performance.

## `optimization_report.md`

This markdown file provides an analysis of the initial complex query and explains the optimizations applied in the refactored version.

---

# Task 5: Partitioning Large Tables

This section covers the solution for Task 5.

## `partitioning.sql`

This SQL script provides an example of how to partition the `Booking` table by `start_date` using PostgreSQL syntax.

## `partition_performance.md`

This markdown file explains the benefits of partitioning the `Booking` table and the performance improvements that can be expected.

---

# Task 6: Monitor and Refine Database Performance

This section covers the solution for Task 6.

## `performance_monitoring.md`

This markdown file provides a comprehensive guide on how to monitor database performance using tools like `EXPLAIN ANALYZE`, identify bottlenecks, and implement improvements.

---

# Task 7: Manual Review

This task involves a manual review of the work done in the previous tasks. The goal is to ensure that the SQL queries are correct, efficient, and well-documented, and that the performance optimization strategies are sound.

The review process should cover:
-   **Correctness**: Do the queries produce the correct results?
-   **Efficiency**: Are the queries optimized? Are indexes used effectively?
-   **Readability**: Is the SQL code easy to read and understand?
-   **Documentation**: Is the documentation clear and comprehensive?

This step is crucial for ensuring the quality of the database scripts and performance tuning.
