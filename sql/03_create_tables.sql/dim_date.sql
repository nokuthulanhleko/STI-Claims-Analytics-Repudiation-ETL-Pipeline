
---Create Staging Table

USE sti_claims_staging;
GO

IF OBJECT_ID('stg.sti_claims_raw', 'U') IS NOT NULL
    DROP TABLE sti_claims_staging.sti_claims_raw;
GO


USE sti_claims_dw;
GO

---Create dim_date

CREATE TABLE dim.dim_date
(
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayNumber INT,
    MonthNumber INT,
    MonthName VARCHAR(20),
    QuarterNumber INT,
    YearNumber INT
);
GO