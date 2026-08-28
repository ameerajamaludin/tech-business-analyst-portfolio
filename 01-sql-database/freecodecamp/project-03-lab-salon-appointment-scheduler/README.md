# Salon Appointment Scheduler

A command-line salon appointment booking system built with **PostgreSQL, SQL, and Bash** as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-salon-appointment-scheduler/lab-salon-appointment-scheduler).

The application allows customers to select a salon service, identifies returning customers using their phone number, registers new customers, and stores appointment details in a PostgreSQL database.

## Project Overview

The goal of this project was to build a simple appointment scheduling system while practicing relational database design and integrating PostgreSQL with a Bash application.

The project involves:

* Designing a relational database for salon services, customers, and appointments
* Creating primary and foreign key relationships
* Retrieving database records through Bash
* Accepting and validating user input
* Registering new customers
* Recognizing returning customers
* Creating appointments linked to customers and services

## Database Structure

The database contains three main tables:

### `services`

Stores the salon services available for booking.

| Column       | Description                                        |
| ------------ | -------------------------------------------------- |
| `service_id` | Primary key and unique identifier for each service |
| `name`       | Name of the salon service                          |

### `customers`

Stores customer information.

| Column        | Description                                         |
| ------------- | --------------------------------------------------- |
| `customer_id` | Primary key and unique identifier for each customer |
| `phone`       | Customer's unique phone number                      |
| `name`        | Customer's name                                     |

### `appointments`

Stores scheduled salon appointments.

| Column           | Description                                            |
| ---------------- | ------------------------------------------------------ |
| `appointment_id` | Primary key and unique identifier for each appointment |
| `customer_id`    | Foreign key referencing the customer                   |
| `service_id`     | Foreign key referencing the selected service           |
| `time`           | Appointment time                                       |

## Database Relationships

```text
customers
└── customer_id (PK)
        │
        └────< appointments.customer_id (FK)

services
└── service_id (PK)
        │
        └────< appointments.service_id (FK)
```

A customer can have multiple appointments, and a service can be associated with multiple appointments.

The `appointments` table connects customers and services through foreign keys.

## How It Works

When `salon.sh` is executed, the application follows this booking flow:

1. Retrieves the available services from PostgreSQL.
2. Displays the services as a numbered menu.
3. Prompts the user to select a service.
4. Checks whether the selected service exists.
5. Requests the customer's phone number.
6. Searches for an existing customer using that phone number.
7. If the customer does not exist, asks for their name and creates a new customer record.
8. Retrieves the customer's ID.
9. Requests the desired appointment time.
10. Creates an appointment linking the customer and selected service.
11. Displays a booking confirmation.

If an invalid service is selected, the application returns the user to the service menu.

## Example Interaction

```text
~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?

1) Cut
2) Color
3) Perm
4) Style
5) Trim

1

What's your phone number?
555-555-5555

I don't have a record for that phone number, what's your name?
Jane

What time would you like your Cut, Jane?
10:30

I have put you down for a Cut at 10:30, Jane.
```

Returning customers do not need to provide their name again because the application retrieves their customer record using their phone number.

## Bash and PostgreSQL Integration

The Bash application communicates with PostgreSQL using the `psql` command-line interface.

```bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
```

SQL queries can then be executed directly from the script:

```bash
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
```

This allows the application to dynamically retrieve and modify database records based on user input.

## Technologies

* PostgreSQL
* SQL
* Bash
* Git
* GitHub

## Project Files

```text
salon-appointment-scheduler/
├── salon.sh
├── salon.sql
└── README.md
```

### `salon.sh`

Contains the command-line application logic, including:

* Service selection
* Input handling
* Customer lookup
* Customer registration
* Appointment creation
* Booking confirmation

### `salon.sql`

PostgreSQL database dump containing the database schema, relationships, constraints, and project data.

## What I Learned

Through this project, I practiced:

* Designing relational database schemas
* Creating PostgreSQL tables
* Defining primary and foreign keys
* Creating relationships between tables
* Applying database constraints
* Writing `SELECT` and `INSERT` queries
* Querying PostgreSQL from Bash
* Capturing SQL query results in Bash variables
* Reading and processing user input
* Using Bash conditional statements
* Using loops to process query results
* Building reusable Bash functions
* Validating user selections
* Creating records based on application input
* Connecting command-line application logic with a relational database

## Key Takeaway

This project helped demonstrate how a relational database can support application logic rather than being used only for standalone SQL queries.

The Bash script acts as the application layer, while PostgreSQL stores and manages persistent data about services, customers, and appointments.

Separating these entities into related tables reduces unnecessary duplication and allows appointments to reference existing customers and services through foreign keys.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements were provided by freeCodeCamp.
