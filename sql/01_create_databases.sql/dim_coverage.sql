
---Create Staging Table

USE sti_claims_staging;
GO

IF OBJECT_ID('stg.sti_claims_raw', 'U') IS NOT NULL
    DROP TABLE sti_claims_staging.sti_claims_raw;
GO


USE sti_claims_dw
GO

---Create dim_coverage

CREATE TABLE dim.dim_coverage
(
    CoverageKey INT IDENTITY(1,1) PRIMARY KEY,
    CoverageType VARCHAR(100),
    Peril VARCHAR(100)
);
GO