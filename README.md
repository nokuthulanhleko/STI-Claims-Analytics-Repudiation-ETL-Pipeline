# STI-Claims-Analytics-Repudiation-ETL-Pipeline

🚧 **Status: In Progress**



---

## Overview

I am currently building an end-to-end **data engineering pipeline** to analyse insurance claims data, with a focus on identifying **claim repudiation drivers**.

This project will transform raw claims data into a structured **data warehouse** and deliver insights through Power BI.

---

## Problem Statement

Insurance companies often struggle to understand why claims are approved, partially paid, or repudiated due to unstructured data and lack of analytical models.

This project aims to solve that by building a scalable pipeline that enables:

* Clear visibility into claim outcomes
* Identification of repudiation drivers
* Fraud risk analysis
* Driver eligibility compliance monitoring

---

## Planned Architecture

CSV Dataset → Staging → ETL Stored Procedures → Data Warehouse → Power BI

##  Work Completed So Far

* Staging table created and data loaded
* Warehouse schemas (dim, fact, etl) created
* Dimension tables designed
* Fact table designed
* Stored procedures development in progress

---

##  Planned Features

* Claims repudiation business rules:

  * Forced entry validation (burglary claims)
  * Proof of ownership checks
  * Driver eligibility validation
  * Fraud risk scoring

* Star schema data model

* Automated ETL pipeline

* Power BI dashboard

---

##  Tech Stack

* SQL Server
* T-SQL
* Power BI (planned)
* SSIS (planned automation)

---

##  Next Steps

* Complete ETL stored procedures
* Load fact table
* Implement repudiation logic
* Build Power BI dashboard
* Add automation layer (SSIS / ADF)

---

##  About Me

I am an aspiring **Data Engineer** focused on building real-world data pipelines, with a strong interest in **insurance analytics**.

---

## 📌 Note

This project is actively being developed and will be updated as new components are completed.
