# Salon Appointment Scheduler

A command-line salon appointment booking system built with **PostgreSQL, SQL, and Bash** as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-salon-appointment-scheduler/lab-salon-appointment-scheduler).

The application allows customers to select a salon service, identifies returning customers using their phone number, registers new customers, and stores appointment details in a PostgreSQL database.

## Project Overview

The goal of this project was to build a simple appointment scheduling system while practicing relational database design and integrating PostgreSQL with a Bash application.

The project involves:

* Designing a relational database for salon services, customers, and appointments
* Defining primary and foreign key relationships
* Retrieving database records through Bash
* Accepting and validating user input
* Registering new customers
* Recognizing returning customers
* Creating appointments linked to customers and services

## Database Structure

The database contains three tables:

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

The `appointments` table connects customers and services through foreign keys:

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

A customer can have multiple appointments, while each appointment belongs to one customer.

A service can also be associated with multiple appointments, while each appointment references one service.

This allows customer and service information to be stored separately and reused across multiple appointment records.

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

The overall application flow can be represented as:

```text
Start
  │
  ↓
Display services
  │
  ↓
Select service
  │
  ├── Invalid ──→ Display services again
  │
  ↓
Enter phone number
  │
  ↓
Search for customer
  │
  ├── New customer ──→ Enter name ──→ Create customer
  │
  └── Returning customer
  │
  ↓
Enter appointment time
  │
  ↓
Create appointment
  │
  ↓
Display confirmation
```

## Example Interaction

An example booking for a new customer:

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

Returning customers do not need to provide their name again because the application retrieves their existing customer record using their phone number.

## Bash and PostgreSQL Integration

The Bash application communicates with PostgreSQL using the `psql` command-line interface.

The connection command is stored in a Bash variable:

```bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
```

SQL queries can then be executed directly from the script:

```bash
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
```

This allows the Bash application to retrieve and modify PostgreSQL records dynamically based on user input.

The application can therefore be viewed as two connected layers:

```text
Bash Application
    │
    ├── User input
    ├── Application logic
    └── Output
          │
          ↓
PostgreSQL Database
    │
    ├── services
    ├── customers
    └── appointments
```

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

The main lesson from this project was understanding how a relational database can support application logic rather than being used only for standalone SQL queries.

The Bash script acts as the application layer, handling user interaction and the booking process, while PostgreSQL stores persistent information about services, customers, and appointments.

Instead of storing all booking information together, the database separates the entities into related tables:

```text
customers
    │
    └── customer_id
            ↓
       appointments
            ↑
    ┌── service_id
    │
services
```

An appointment therefore does not need to duplicate the customer's name, phone number, or service name. It references the corresponding customer and service records through foreign keys.

This reduces unnecessary duplication and allows existing customer and service records to be reused across multiple appointments.

This project helped reinforce how **relational database design, SQL queries, Bash scripting, user input, and application logic can work together in a simple interactive application**.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements were provided by freeCodeCamp.
