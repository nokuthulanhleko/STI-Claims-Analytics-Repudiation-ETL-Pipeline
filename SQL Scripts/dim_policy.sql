
---Create Staging Table

USE sti_claims_staging;
GO

IF OBJECT_ID('stg.sti_claims_raw', 'U') IS NOT NULL
    DROP TABLE sti_claims_staging.sti_claims_raw;
GO


USE sti_claims_dw
GO

---Create dim_policy

CREATE TABLE dim.dim_policy
(
    PolicyKey INT IDENTITY(1,1) PRIMARY KEY,
    PolicyID INT NOT NULL,
    CoverageType_Policy VARCHAR(100),
    PremiumAmount DECIMAL(18,2)
);
GO