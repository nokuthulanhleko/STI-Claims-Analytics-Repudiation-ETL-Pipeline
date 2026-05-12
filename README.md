STI-Claims-Analytics-Repudiation-ETL-Pipeline

🚧 Project Status: In Progress

## Overview

In this project, I am building an end-to-end insurance claims analytics and repudiation pipeline focused on the South African STI Personal Claims environment.

The purpose of this project is to simulate a real-world data engineering solution that ingests raw insurance claims data, transforms it through ETL processes, stores it in a structured SQL Server data warehouse, and delivers analytical insights through Power BI dashboards and reporting.

This project is specifically focused on understanding why claims are repudiated within the short-term insurance industry and how insurers can use data engineering and analytics to improve operational decision-making, fraud monitoring, claims analysis, and risk management.

Through this solution, I aim to analyse and identify:

* Claims repudiation drivers
* Policy wording and exclusion impacts
* Over cover-limit and underinsured claims
* Fraud risk indicators
* Driver eligibility compliance
* Claims trends and operational performance patterns
* High-risk customer and claims behaviour

This project forms part of my transition into Data Engineering and reflects my strong interest in:

* Insurance analytics
* ETL pipeline development
* Data warehousing
* Production-style data engineering solutions
* Business intelligence and reporting

## Business Problem

Within the South African short-term insurance industry, claims repudiation remains one of the biggest operational and customer experience challenges within Personal Lines claims environments.

Insurance companies process large volumes of motor, household contents, buildings, and all-risk claims daily, but many claims are repudiated or partially rejected due to:

* Fraud indicators
* Missing supporting documentation
* Driver eligibility issues
* Policy exceeding cover limits
* Non-disclosure
* Non-compliance with policy wording and underwriting conditions


Through my experience within the insurance industry, I recognised that insurers often struggle to clearly identify and analyse the root causes behind repudiated claims because operational claims data is usually fragmented across multiple systems and stored in inconsistent formats.

I also recognised the importance of understanding policy wording within the claims process. Many repudiations occur because policyholders do not fully understand:


* Their cover limits
* Policy exclusions
* Additional excess structures
* Underinsurance impacts
* Specified item requirements
* Driver limitations and endorsements

Claims that exceed policy limits or fall outside insured events often create disputes, operational inefficiencies, and increased financial risk exposure.

The purpose of this project is to build a modern data engineering and analytics pipeline that investigates why claims are repudiated within the South African STI Personal Claims environment.

Using ETL processes, SQL Server, star schema modelling, analytical SQL views, and Power BI dashboards, I aim to transform raw claims data into meaningful business intelligence that provides insight into:


* Common repudiation reasons
* Policy wording impacts
* Over cover-limit and underinsured claims
* Fraud risk patterns
* Driver eligibility compliance
* Claims trends and operational performance
* High-risk customer behaviour
* Claims decision-making patterns


This project simulates how modern data engineering solutions can help insurers improve claims analytics, strengthen fraud monitoring, better understand repudiation drivers, and support operational and risk management decision-making.

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

* fact_claims

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
