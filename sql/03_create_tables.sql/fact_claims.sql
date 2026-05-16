
---Create dim_driver

---create fact_claims

USE sti_claims_dw;
GO

CREATE TABLE fact.fact_claims
(
    ClaimFactKey INT IDENTITY(1,1) PRIMARY KEY,
    ClaimID INT NOT NULL,

    DateKey INT NOT NULL,
    PolicyKey INT NOT NULL,
    CoverageKey INT NOT NULL,
    ClaimStatusKey INT NOT NULL,
    DriverKey INT NULL,
    FraudKey INT NULL,

    ClaimAmount DECIMAL(18,2),
    ApprovedAmount DECIMAL(18,2),
    AdditionalExcessAmount DECIMAL(18,2),
    PayoutRatio DECIMAL(10,4),

    ForcedEntryFlag VARCHAR(10),
    ProofOfOwnershipFlag VARCHAR(10),

    RepudiatedFlag BIT,
    ApprovedFlag BIT,
    PartialPayoutFlag BIT,

    LoadDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (DateKey) REFERENCES dim.dim_date(DateKey),
    FOREIGN KEY (PolicyKey) REFERENCES dim.dim_policy(PolicyKey),
    FOREIGN KEY (CoverageKey) REFERENCES dim.dim_coverage(CoverageKey),
    FOREIGN KEY (ClaimStatusKey) REFERENCES dim.dim_claim_status(ClaimStatusKey),
    FOREIGN KEY (DriverKey) REFERENCES dim.dim_driver(DriverKey),
    FOREIGN KEY (FraudKey) REFERENCES dim.dim_fraud(FraudKey)
);
GO