# Project Documentation

This document outlines the steps taken to complete the database design and scripting tasks for the ALX Airbnb project.

## Task 1: Project Setup

I started by understanding the project structure and the tasks outlined in the `datascape_tasks` file.

## Task 2: ER Diagram

I created an Entity-Relationship Diagram (ERD) to visualize the database schema. The ERD is located in the `ERD/requirements.md` file.

## Task 3: Database Normalization

I normalized the database to 3NF to ensure data integrity and reduce redundancy. The normalization details are available in the `normalization.md` file.

## Task 4: Database Schema (DDL)

I wrote the SQL Data Definition Language (DDL) scripts to create the database schema. The `schema.sql` file in the `database-script-0x01` directory contains the `CREATE TABLE` statements for all the entities.

## Task 5: Database Seeding

I populated the database with sample data using SQL `INSERT` statements. The `seed.sql` file in the `database-script-0x02` directory contains the sample data.

## Task 6: Version Control

I committed all the changes to the Git repository and pushed them to the `origin/main` branch.

### Commit and Push

1.  **Checked Git Status:** I used `git status` to view the changes.
2.  **Staged Changes:** I used `git add .` to stage all the new and modified files.
3.  **Committed Changes:** I committed the changes with the message "feat: Complete database design and scripting tasks".
4.  **Pulled from Remote:** I encountered an issue while pushing and resolved it by pulling and rebasing from the remote branch using `git pull --rebase origin main`.
5.  **Pushed to Remote:** I successfully pushed the changes to the remote repository using `git push origin main`.
