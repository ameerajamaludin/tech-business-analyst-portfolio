# Tech Business Analyst Portfolio

A portfolio documenting my hands-on development in **technical business analysis, system analysis, product thinking, data, APIs, JavaScript, and Agentic AI**.

This repository combines structured learning with applied projects and case studies to demonstrate how technical concepts can be used to analyse business problems, define requirements, understand system behaviour, and support product decisions.

---

## About This Repository

As a Business Analyst, understanding the business problem is only part of the job. Modern digital products also require an understanding of the systems, data, integrations, and technical constraints behind them.

I created this repository to strengthen and demonstrate my ability to work across the gap between **business needs and technical implementation**.

My focus areas are:

* SQL and relational databases
* Data analysis for business decisions
* REST APIs and system integrations
* JSON and data structures
* JavaScript and application logic
* Agentic AI and AI-assisted workflows
* System analysis and requirements engineering
* Product analysis and product thinking

The repository contains both **learning exercises** and **independent applied projects**.

> Course exercises are kept under `learning/`, while independently developed portfolio work is kept under `projects/` and `case-studies/`.

---

## Portfolio Overview

| Area                   | Learning                                                              | Applied Work                       |
| ---------------------- | --------------------------------------------------------------------- | ---------------------------------- |
| 🗄️ **SQL & Database** | freeCodeCamp Relational Databases, DataCamp SQL for Business Analysts | Customer Order Analytics           |
| 🔌 **API Analysis**    | freeCodeCamp Back End Development and APIs                            | Order Management API Analysis      |
| 🟨 **JavaScript**      | freeCodeCamp JavaScript                                               | Refund Eligibility Checker         |
| 🤖 **Agentic AI**      | Kaggle 5-Day AI Agents Intensive with Google                          | Business Analyst Copilot           |
| ⚙️ **System Analysis** | Requirements and system analysis practice                             | Returns & Refund Management System |
| 📱 **Product**         | Product analysis practice                                             | Self-Service Support Portal        |

---

## 01 — SQL & Database

**Goal:** Develop a deeper understanding of relational databases and use SQL to answer real business questions.

### Learning

**freeCodeCamp — Relational Databases**

Topics include:

* Bash and command-line fundamentals
* PostgreSQL
* Relational database concepts
* Database creation and modification
* Primary and foreign keys
* SQL queries
* Bash scripting
* Git

Certification projects include:

* Celestial Bodies Database
* World Cup Database
* Salon Appointment Scheduler
* Periodic Table Database
* Number Guessing Game

**DataCamp — SQL for Business Analysts**

Focus areas include using SQL for:

* Business reporting
* Data exploration
* Data validation
* Customer analysis
* KPI analysis
* Business decision-making

### Applied Project

#### Customer Order Analytics

A fictional e-commerce dataset used to investigate business questions such as:

* How is revenue changing over time?
* Which products generate the most revenue?
* Who are the most valuable customers?
* What is the repeat purchase rate?
* Which products have high refund rates?
* What factors contribute to cancellations and refunds?

The project demonstrates the progression from:

**Business Question → SQL Query → Data Analysis → Insight → Recommendation**

---

## 02 — API Analysis

**Goal:** Understand how applications and systems communicate and how a Business Analyst can contribute to API requirements and integration design.

### Learning

**freeCodeCamp — Back End Development and APIs**

Focus areas include:

* REST APIs
* HTTP
* JSON
* Request and response structures
* Backend services
* API endpoints
* Node.js
* Express

### Applied Project

#### Order Management API Analysis

A case study documenting an API for an e-commerce order management system.

The analysis covers:

* Business and functional requirements
* API endpoints
* HTTP methods
* Request and response payloads
* HTTP status codes
* Validation rules
* Business rules
* Error handling
* Authentication and authorization considerations
* Edge cases
* API test scenarios
* OpenAPI documentation

Example domain:

```text
Customer
   ↓
Order
   ├── Payment
   ├── Shipment
   └── Refund
```

The purpose is not only to build an API, but to demonstrate how business requirements can be translated into an **API contract between systems**.

---

## 03 — JavaScript

**Goal:** Develop enough programming knowledge to understand application logic and communicate more effectively with engineering teams.

### Learning

**freeCodeCamp — JavaScript**

Focus areas include:

* Variables and data types
* Arrays and objects
* Functions
* Conditional logic
* Loops
* Data transformation
* Object-oriented programming
* Functional programming
* Algorithms
* Asynchronous JavaScript

### Applied Project

#### Refund Eligibility Checker

A small application that translates documented business rules into executable logic.

Example:

```text
Business Requirement
        ↓
Business Rule
        ↓
JavaScript Logic
        ↓
Expected Result
        ↓
Test Case
```

The application evaluates factors such as:

* Order status
* Delivery date
* Refund request date
* Product category
* Refund reason
* Item condition

This project demonstrates how requirements and business rules eventually become application behaviour.

---

## 04 — Agentic AI

**Goal:** Explore how AI agents can support Business Analysis workflows while maintaining appropriate human review and validation.

### Learning

**Kaggle — 5-Day AI Agents Intensive with Google**

Focus areas include concepts such as:

* AI agents
* Tools
* Agent workflows
* Context
* Agent evaluation
* Security
* Multi-agent systems
* Agent-to-agent communication

### Applied Project

#### Business Analyst Copilot

An experimental agentic workflow designed to assist with Business Analysis activities.

Potential capabilities include:

```text
Meeting Transcript
        ↓
BA Copilot
        │
        ├── Requirements Analysis
        ├── User Story Generation
        ├── API Analysis
        ├── Business Rule Extraction
        └── Requirements Review
        ↓
Human BA Review
        ↓
Approved Deliverables
```

The project explores how AI can assist rather than replace the analyst, with emphasis on **human review, traceability, evaluation, and responsible AI usage**.

---

## 05 — System Analysis

**Goal:** Demonstrate end-to-end system analysis beyond individual technical components.

### Case Study

#### Returns & Refund Management System

A fictional case study analysing the redesign of a returns and refund process involving customers, customer service, warehouse operations, finance, payment systems, and order management.

Artefacts may include:

* Problem statement
* Project scope
* Stakeholder analysis
* As-Is process
* Pain-point analysis
* To-Be process
* Functional requirements
* Non-functional requirements
* Business rules
* User stories
* Acceptance criteria
* Data model
* API integrations
* Process diagrams
* Sequence diagrams
* Exception scenarios
* Test scenarios

The objective is to demonstrate the ability to move from:

**Business Problem → Process Analysis → Requirements → System Design Considerations → Validation**

---

## 06 — Product Case Studies

**Goal:** Demonstrate product thinking alongside traditional Business Analysis.

### Case Study

#### Self-Service Customer Support Portal

A fictional product case study exploring how self-service capabilities could reduce avoidable customer support contacts while improving the customer experience.

The case study explores:

* Product problem
* User problems
* Personas
* User journeys
* Opportunity identification
* Solution hypotheses
* Product requirements
* User stories
* Acceptance criteria
* Feature prioritisation
* MVP definition
* Success metrics
* Product roadmap
* Wireframes

Potential capabilities include:

* Order tracking
* Refund tracking
* Invoice downloads
* Account management
* Knowledge base
* Support requests

The focus is on answering:

> **What problem should we solve, for whom, what should we build first, and how will we know whether it worked?**

---

## Repository Structure

```text
tech-business-analyst-portfolio/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── 01-sql-database/
│   ├── README.md
│   ├── learning/
│   │   ├── freecodecamp/
│   │   └── datacamp/
│   └── projects/
│
├── 02-api-analysis/
│   ├── README.md
│   ├── learning/
│   │   └── freecodecamp/
│   └── projects/
│
├── 03-javascript/
│   ├── README.md
│   ├── learning/
│   │   └── freecodecamp/
│   └── projects/
│
├── 04-agentic-ai/
│   ├── README.md
│   ├── learning/
│   │   └── kaggle-ai-agents/
│   └── projects/
│
├── 05-system-analysis/
│   ├── README.md
│   └── case-studies/
│
├── 06-product-case-studies/
│   ├── README.md
│   └── case-studies/
│
└── assets/
    ├── diagrams/
    ├── screenshots/
    └── images/
```

---

## How the Portfolio Connects

Rather than treating each skill as an isolated subject, the projects are designed to demonstrate how they connect in a real digital product environment.

```text
                        BUSINESS PROBLEM
                               │
                               ↓
                       SYSTEM ANALYSIS
                               │
                ┌──────────────┼──────────────┐
                ↓              ↓              ↓
             DATABASE         APIs       BUSINESS RULES
                │              │              │
               SQL            JSON        JavaScript
                │              │              │
                └──────────────┼──────────────┘
                               ↓
                        DIGITAL PRODUCT
                               │
                               ↓
                         PRODUCT ANALYSIS
                               │
                               ↓
                          AGENTIC AI
```

This allows the portfolio to demonstrate both **business analysis thinking and technical understanding**.

---

## Learning Philosophy

My objective is not simply to complete courses or collect certifications.

For each subject, I aim to follow:

```text
Learn
  ↓
Practice
  ↓
Build
  ↓
Document
  ↓
Analyse
  ↓
Reflect
```

Coursework provides the foundation.

Independent projects demonstrate application.

Case studies demonstrate how those skills can be combined to solve business and product problems.

---

## Status

🚧 **Work in progress**

This repository is being developed progressively as I complete the learning modules and build the associated projects.

Documentation, projects, diagrams, and case studies will continue to be added and refined.

---

## Disclaimer

The portfolio projects and case studies in this repository are created for learning and demonstration purposes.

Unless explicitly stated otherwise, organisations, datasets, business scenarios, requirements, processes, and product decisions presented in the case studies are fictional or simulated and do not represent confidential information from current or previous employers.
