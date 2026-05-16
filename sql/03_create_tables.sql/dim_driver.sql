
---Create dim_driver

USE sti_claims_dw;
GO

CREATE TABLE dim.dim_driver
(
    DriverKey INT IDENTITY(1,1) PRIMARY KEY,
    DriverType VARCHAR(100),
    DriverAge INT,
    LicenseValid VARCHAR(10),
    UsageType VARCHAR(100),
    IncidentDriverAge INT,
    IncidentDriverLicenseYears DECIMAL(5,2),
    IncidentDriverListedFlag VARCHAR(10),
    DriverEligibilityFlag VARCHAR(10),
    AdditionalExcessFlag VARCHAR(10),
    DriverEligibilityReason VARCHAR(255)
);
GO