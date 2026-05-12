STI-Claims-Analytics-Repudiation-ETL-Pipeline

🚧 Project Status: In Progress

## Overview

In this project, I am building an end-to-end insurance claims analytics and repudiation pipeline designed to simulate a real-world data engineering solution within the short-term insurance industry.

The goal of this project is to ingest raw insurance claims data, transform it through ETL processes, store it in a structured SQL Server data warehouse, and generate analytical insights through Power BI dashboards and reporting.

Through this solution, I aim to analyse and identify key insurance risk and operational patterns, including:

* Claim repudiation drivers
* Fraud risk indicators
* Driver eligibility compliance
* Claims trends and operational performance patterns

This project forms part of my transition into Data Engineering and reflects my strong interest in:

* Insurance analytics
* ETL pipeline development
* Data warehousing
* Production-style data engineering solutions

----
## Business Problem

In the insurance industry, claims repudiation is one of the biggest operational and customer experience challenges. Insurance companies process thousands of claims daily, but many claims are declined or partially rejected due to policy breaches, fraud indicators, missing documentation, driver eligibility issues, or non-compliance with policy terms.

Through my experience in insurance operations, I noticed that insurers often struggle to clearly identify and analyse the root causes behind claim repudiations because the data is usually spread across multiple operational systems and stored in inconsistent formats.

This creates several business challenges, including:

* Limited visibility into why claims are repudiated
* Difficulty identifying fraud patterns and suspicious claims
* Inconsistent driver and policy validation processes
* Poor tracking of repudiation trends across products and claim types
* Limited operational reporting for claims decision-making
* Difficulty analysing risk exposure and claims behaviour

The purpose of this project is to build an end-to-end data engineering and analytics pipeline that investigates why claims are repudiated by transforming raw insurance claims data into a structured SQL Server data warehouse for analytical reporting.

Using ETL processes, star schema modelling, analytical SQL views, and Power BI dashboards, I aim to provide insights into:

* The most common repudiation reasons
* Fraud risk indicators
* Driver eligibility compliance
* Policy breach trends
* Operational claims performance
* High-risk claims patterns

This project simulates how insurance companies can use modern data engineering solutions to improve claims analysis, strengthen fraud detection, and support better operational and risk management decision-making.

----

## Project Objectives

* Build a structured SQL Server data warehouse using a star schema model
* Develop reusable ETL stored procedures for data transformation
* Simulate real-world insurance repudiation business rules
* Create analytical views for reporting and KPI analysis
* Automate the pipeline using SSIS and SQL Server Agent
* Deliver interactive Power BI dashboards for claims analysis
* Solution Architecture

CSV Dataset → SQL Server Staging → ETL Stored Procedures → Star Schema Data Warehouse → Analytical SQL Views → Power BI Dashboard

----
## Data Warehouse Design
Fact Table

fact_claims

Key metrics include:

* Claim Amount
* Approved Amount
* Excess Amount
* Repudiation Status
* Fraud Risk Score
* Claim Outcome
* Claim Processing Time
----
## Dimension Tables

* dim_customer
* dim_policy
* dim_driver
* dim_vehicle
* dim_claim_status
* dim_fraud
* dim_date

The warehouse follows a star schema design to support efficient analytical querying and reporting.

----
## Work Completed So Far

* CSV claims dataset ingested into SQL Server staging environment
* Staging tables successfully created and validated
* Data warehouse schemas (dim, fact, etl) implemented
* Star schema foundation designed for analytical reporting
* Dimension tables developed for claims analytics
* Fact table designed to support repudiation analysis
* ETL stored procedures created for dimension and fact loading
* Master ETL orchestration procedure developed
* Initial data validation and reconciliation checks in development
* KPI analytical SQL views currently in development
* GitHub repository structured for version control and portfolio presentation
----
## Planned Enhancements & Next Steps
Claims Repudiation Business Rules

Implementation of advanced insurance validation logic, including:

* Forced entry validation for burglary-related claims
* Proof of ownership verification
* Driver licence and eligibility validation
* Young/inexperienced driver excess validation
* Fraud risk scoring and suspicious claim detection
----
## Pipeline Enhancements

* ETL logging and audit framework
* Error handling and pipeline monitoring
* Incremental loading strategies
* SSIS pipeline automation
* SQL Server Agent scheduling
* Performance optimisation and indexing
----
## Analytics & Reporting

* Analytical SQL views for KPI reporting
* Power BI claims analytics dashboard
* Repudiation trend analysis
* Fraud monitoring visuals
* Operational performance metrics
----
## Future Improvements

* Azure Data Factory orchestration version
* CI/CD pipeline integration using GitHub Actions
* Cloud migration architecture
* Production-ready monitoring framework
----
## Tech Stack

* SQL Server	Data warehouse & database management
* T-SQL	ETL logic & transformations
* SSIS	ETL automation
* Power BI	Dashboarding & reporting
* Git & GitHub	Version control
* SQL Server Agent	Pipeline scheduling
----
## Key Data Engineering Concepts Demonstrated

* ETL Pipeline Development
* Data Warehousing
* Star Schema Modelling
* SQL Stored Procedures
* Data Validation & Reconciliation
* Incremental Load Concepts
* Pipeline Orchestration
* Insurance Analytics
* Claims Repudiation Logic
* Analytical Reporting
* Project Status
-----
This project is actively being developed and continuously enhanced with additional ETL automation, analytical reporting, and production-style data engineering components.
