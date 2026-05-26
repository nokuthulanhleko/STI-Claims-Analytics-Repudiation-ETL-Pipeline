STI-Claims-Analytics-Repudiation-ETL-Pipeline

🚧 Project Status: In Progress

# STI Claims Analytics & Repudiation ETL Pipeline

## Project Overview

I designed and built an end-to-end data engineering and analytics pipeline focused on analysing insurance claims outcomes within the South African short-term insurance industry.

The primary goal of this project is to identify and analyse the key drivers that contribute to insurance claim repudiations.

Within short-term insurance environments, claims are often repudiated due to multiple operational, compliance, underwriting, and policy-related factors. One of the major business challenges insurers face is understanding why claims are rejected and how these repudiation trends impact both operational efficiency and customer experience.

This project specifically focuses on identifying repudiation drivers such as:

* Lack of visible signs of forced entry for burglary claims
* Missing proof of ownership documentation
* Driver eligibility and policy compliance issues
* Fraud risk indicators
* Policy wording understanding and customer awareness challenges

A particularly important consideration included in this project is the impact of policy wording and policyholder understanding on repudiation outcomes.

Insurance policy documents are often lengthy, technical, and difficult for customers to fully understand. In many cases, policyholders may not fully understand:

* Specific policy exclusions
* Driver eligibility requirements
* Excess structures
* Proof of ownership requirements
* Claims validation conditions such as visible signs of forced entry

This lack of understanding can contribute significantly to repudiated claims and customer dissatisfaction.

The purpose of this project was therefore not only to build a technical ETL pipeline, but also to create a business-focused analytical solution capable of helping insurers better understand the operational and behavioural drivers behind claim repudiations.

The solution transforms raw operational claims data into a structured analytical platform capable of supporting:

* Claims analysis
* Repudiation monitoring
* Fraud risk identification
* Driver eligibility validation
* Operational reporting and KPI tracking
* Trend analysis and business intelligence reporting

The project simulates a production-style insurance analytics environment using:

* SQL Server staging databases
* ETL stored procedures
* Star schema data warehousing
* Analytical SQL reporting views
* Automated ETL execution
* Power BI dashboards and KPI reporting

---

# Problem Statement

Insurance companies process large volumes of claims data across multiple product lines and risk categories. However, raw claims data is often fragmented, operationally focused, and difficult to analyse effectively.

This creates several business challenges:

* Limited visibility into why claims are approved, partially paid, or repudiated
* Difficulty identifying fraud indicators and high-risk claims
* Poor monitoring of policy compliance requirements
* Limited understanding of repudiation trends and operational risk patterns
* Manual and time-consuming analytical processes
* Customer dissatisfaction caused by misunderstanding policy wording and exclusions

Many repudiated claims are not necessarily caused by fraud alone, but rather by operational and compliance issues such as:

* Failure to meet policy conditions
* Unlisted or ineligible drivers
* Missing proof of ownership
* Lack of visible signs of forced entry
* Customers misunderstanding policy wording and exclusions

Without structured analytical models and reporting capabilities, insurers struggle to identify these trends, improve operational visibility, and make data-driven decisions.

This project was designed to solve that challenge by building a scalable ETL pipeline and analytical warehouse capable of transforming raw claims data into actionable business intelligence.

---

#  Architectural Overview




Architecture Diagram

<img width="3141" height="130" alt="Architectural Flow Diagram" src="https://github.com/user-attachments/assets/40f7a315-0e6e-424f-9957-2e695d7b9f5d" />


---

# Dataset Details

The dataset simulates short-term insurance claims across multiple insurance products and claim outcomes.

### Dataset Characteristics

* Approximately 2,000 insurance claim records

 Multiple claim outcomes:
* Approved
* Partially Approved
* Repudiated
* Motor and non-motor claims included
* Fraud scoring indicators included
* Driver eligibility logic included
* Claims validation and compliance indicators included

---

## Dataset Categories

### Policy Information

* PolicyID
* CoverageType
* PremiumAmount

### Claims Information

* ClaimID
* ClaimAmount
* ApprovedAmount
* ClaimStatus
* PayoutRatio

### Driver Information

* DriverType
* DriverEligibilityFlag
* LicenseValid
* IncidentDriverAge
* AdditionalExcessFlag

### Fraud Information

* FraudScore
* FraudRiskScore

### Compliance Information

* ForcedEntryFlag
* ProofOfOwnershipFlag

---

# Star Schema Design

The warehouse was designed using a dimensional modelling approach to support scalable analytics and reporting.

<img width="588" height="559" alt="Star Schema" src="https://github.com/user-attachments/assets/0458b8d2-67d4-4923-b06c-cf7cf0b243c4" />

---

## Fact Table

### `fact.fact_claims`

The fact table stores transactional claim measures and operational metrics.

### Measures

* ClaimAmount
* ApprovedAmount
* AdditionalExcessAmount
* PayoutRatio
* RepudiatedFlag
* ApprovedFlag
* PartialPayoutFlag

### Foreign Keys

* DateKey
* PolicyKey
* CoverageKey
* ClaimStatusKey
* DriverKey
* FraudKey

---

## Dimension Tables

### `dim.dim_date`

Stores reporting calendar attributes.

### `dim.dim_policy`

Stores policy and premium information.

### `dim.dim_coverage`

Stores coverage types and insured perils.

### `dim.dim_claim_status`

Stores claims outcome classifications.

### `dim.dim_driver`

Stores driver eligibility and compliance information.

### `dim.dim_fraud`

Stores fraud scoring and risk indicators.

---

# ETL Pipeline Design

The ETL process was built using SQL Server stored procedures.

### Key ETL Responsibilities

* Raw CSV ingestion into staging
* Data cleansing and transformation
* Data type conversion using `TRY_CONVERT`
* Surrogate key generation
* Business rule implementation
* Fact and dimension loading
* ETL orchestration and automation

---

## Master ETL Procedure


This procedure orchestrates the full warehouse loading process.

---

# Automation & Orchestration

The pipeline was enhanced with automated ETL execution and operational logging capabilities.

## SQL Server Agent Automation

The ETL pipeline is designed to support automated scheduling using SQL Server Agent.

Typical automation flow:





This enables:

* Automated warehouse refreshes
* Scheduled ETL execution
* Reduced manual intervention
* Consistent reporting availability
* Production-style orchestration workflows

---

## ETL Logging

An ETL logging framework was implemented to monitor pipeline execution.

### Logging Capabilities

* Pipeline execution tracking
* Start and end time monitoring
* Success and failure status tracking
* Error message logging
* Rows processed tracking

This improves operational observability and supports production-style monitoring practices.

<img width="1011" height="586" alt="etl sp_run_claims_pipeline" src="https://github.com/user-attachments/assets/3b27e7d7-8db1-4daa-9e2d-1df37ac9637e" />

---

# Insurance Business Rules Implemented

A major focus of the project was implementing realistic insurance claims validation and repudiation logic.

---

## Forced Entry Validation

Contents burglary claims require visible signs of forced entry.

Claims without forced entry indicators are flagged as potential repudiation risks.

---

## Proof of Ownership Validation

Claims missing proof of ownership documentation are flagged for operational review and repudiation analysis.

---

## Driver Eligibility Rules

Driver-related validation includes:

* Driver licence validity
* Driver listing requirements
* Driver age considerations
* Additional excess application

---

## Fraud Risk Monitoring

Fraud risk scoring was incorporated to identify:

* High-risk claims
* Suspicious claims behaviour
* Fraud-related repudiation risks

---

# Analytical SQL Views

Analytical SQL views were created to simplify reporting and Power BI dashboard development.

### Key Analytical Views

* vw_kpi_overview
* vw_claims_summary
* vw_repudiation_analysis
* vw_driver_eligibility_analysis
* vw_fraud_analysis
* vw_monthly_claim_trends

These views expose clean, analytics-ready datasets for KPI reporting and dashboard visualisation.

---

# Power BI Analysis

Power BI dashboards were designed to provide operational and executive-level insights into claims performance.

---

## Executive KPI Dashboard

Key metrics include:

* Total Claims
* Total Claim Amount
* Total Approved Amount
* Repudiation Rate
* Approval Rate
* Overall Payout Ratio

<img width="764" height="428" alt="Executive Overview" src="https://github.com/user-attachments/assets/8d6336b2-d3ea-4e10-bdba-b9853814037d" />

---

## Repudiation Analysis Dashboard

Focus areas include:

* Repudiation trends
* Forced entry repudiations
* Proof of ownership issues
* Claims by status
* Claims by peril

<img width="771" height="432" alt="Repudiation Analysis" src="https://github.com/user-attachments/assets/d4b198f6-b64b-43bd-a066-9b13cea2bcac" />

---

## Driver Eligibility Dashboard

Provides visibility into:

* Driver compliance
* Additional excess analysis
* Unlisted driver claims
* Driver repudiation risk

---

## Fraud Monitoring Dashboard

Highlights:

* Fraud risk score distribution
* High-risk claims
* Fraud-related repudiations
* Claim amount vs fraud score analysis

---

## Monthly Claims Trend Dashboard

Provides trend analysis for:

* Monthly claim volumes
* Monthly approved amounts
* Monthly repudiation rates
* Payout ratio trends

---

# Business Insights & Recommendations

The project generated several operational and strategic insights.

---

##  Key Business Insights

### Repudiation trends

Claims lacking visible signs of forced entry showed significantly higher repudiation rates within contents burglary claims.

### Driver compliance impact

Driver-related policy breaches contributed heavily to repudiated and partially approved motor claims.

### Fraud risk concentration

High fraud risk scores were associated with lower payout ratios and increased repudiation outcomes.

### Customer understanding challenges

Policy wording complexity and lack of customer understanding appeared to contribute to repudiation-related disputes and operational friction.

### Operational visibility

Analytical views and KPI dashboards significantly improved visibility into claims performance and operational trends.

---

# Recommendations

### Improve policy wording communication

Insurers should simplify policy wording and improve communication around policy exclusions, claims requirements, and repudiation conditions.

### Improve customer education

Policyholders should receive clearer guidance regarding:

* Forced entry requirements
* Driver eligibility rules
* Excess structures
* Proof of ownership requirements

### Strengthen fraud monitoring

High-risk fraud claims should trigger earlier investigation and review processes.

### Enhance underwriting controls

Driver eligibility validation should be strengthened during onboarding and policy renewals.

### Expand automation

The solution can be enhanced further using:

* SSIS orchestration
* SQL Server Agent scheduling
* Automated Power BI refresh workflows

### Implement incremental loading

Future versions should support incremental ETL processing for scalability and performance optimisation.

---

# Technologies Used

* SQL Server
* T-SQL
* Stored Procedures
* Star Schema Modelling
* Power BI
* SQL Server Agent
* Git & GitHub

---

# Key Data Engineering Concepts Demonstrated

* ETL Pipeline Development
* ETL Automation
* Dimensional Modelling
* Data Warehousing
* Analytical SQL Views
* Data Transformation & Cleansing
* Business Rule Implementation
* KPI Reporting
* Insurance Analytics

---

# Future Enhancements

Planned enhancements include:

* SSIS orchestration workflows
* Automated Power BI refresh scheduling
* Incremental ETL loading
* ETL monitoring dashboards
* Azure Data Factory integration
* Cloud migration concepts

---
