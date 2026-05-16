
---Create dim_driver

---create dim_fraud

USE sti_claims_dw;
GO

CREATE TABLE dim.dim_fraud
(
    FraudKey INT IDENTITY(1,1) PRIMARY KEY,
    FraudScore INT,
    FraudRiskScore INT
);
GO