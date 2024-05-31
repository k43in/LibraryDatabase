# Library Management System

## Overview

The Library Management System is designed to streamline the management of library resources, enhance the user experience for staff, and improve the efficiency of library operations. This project leverages a structured database and a set of stored procedures to handle various aspects of library management, including book inventory, user accounts, borrowing, and returning books.

![image](https://github.com/k43in/LibraryDatabase/assets/118012788/78b116e4-9324-468e-b63e-6f374764b88f)


## Files

- **Create.sql**: This script contains SQL statements to create the necessary tables and define their structures. It includes the creation of primary keys, foreign keys, and other constraints to ensure data integrity.
  
- **Procedures.sql**: This file includes stored procedures that encapsulate reusable SQL code for various database operations. These procedures help in maintaining cleaner code and enhancing performance by reducing redundant SQL queries.

- **VIEWS.sql**: This script defines views that provide virtual tables representing the results of predefined queries. Views are used to simplify complex queries and provide an abstraction layer over the underlying tables.

- **test.sql**: Contains test data and queries to validate the database setup. This file ensures that the tables, procedures, and views are functioning correctly by running test cases and verifying their outputs.

## Getting Started

To set up the database, follow these steps:

1. **Create Tables**: Run the `Create.sql` script to create the necessary tables and their relationships.
2. **Define Views**: Execute the `VIEWS.sql` script to create views for simplified data access.
3. **Add Procedures**: Load the stored procedures by running the `Procedures.sql` script.
4. **Insert Test Data**: Populate the database with test data using the `test.sql` script and verify the setup.

## Requirements

- A SQL database management system (DBMS) such as MySQL, PostgreSQL, or SQL Server.
- A SQL client tool to execute the provided scripts.

## Usage

After setting up the database, you can interact with it using SQL queries to perform CRUD (Create, Read, Update, Delete) operations. The provided stored procedures and views will help in streamlining these interactions.

## Contributing




