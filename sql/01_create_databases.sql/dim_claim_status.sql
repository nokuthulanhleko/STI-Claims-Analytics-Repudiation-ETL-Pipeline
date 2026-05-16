
---Create Staging Table

USE sti_claims_staging;
GO

IF OBJECT_ID('stg.sti_claims_raw', 'U') IS NOT NULL
    DROP TABLE sti_claims_staging.sti_claims_raw;
GO


USE sti_claims_dw
GO

---Create dim_claim_status

CREATE TABLE dim.dim_claim_status
(
    ClaimStatusKey INT IDENTITY(1,1) PRIMARY KEY,
    ClaimStatus VARCHAR(50)
);
GO