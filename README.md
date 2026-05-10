STI-Claims-Analytics-Repudiation-ETL-Pipeline

🚧 Project Status: In Progress

## Overview

This project is an end-to-end insurance claims analytics and repudiation pipeline designed to simulate a real-world data engineering solution within the short-term insurance industry.

The goal of the project is to ingest raw insurance claims data, transform it through an ETL process, store it in a structured SQL Server data warehouse, and generate analytical insights through Power BI.

The solution focuses specifically on identifying:

* Claim repudiation drivers
* Fraud risk indicators
* Driver eligibility compliance
* Claims trends and operational risk patterns

This project is being developed as part of my transition into Data Engineering, with a strong focus on insurance analytics and production-style ETL design.

----
## Business Problem

Insurance companies process large volumes of claims data daily, but raw operational datasets are often fragmented, inconsistent, and difficult to analyse effectively.

This creates challenges such as:

* Limited visibility into why claims are repudiated
* Difficulty identifying fraudulent behaviour
* Inconsistent driver validation processes
* Lack of analytical reporting for operational decision-making

This project aims to solve these challenges by building a scalable analytics pipeline that transforms raw claims data into meaningful business intelligence.

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
