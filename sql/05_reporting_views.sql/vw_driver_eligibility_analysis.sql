
---vw_driver eligibility analysis

CREATE OR ALTER VIEW dbo.vw_driver_eligibility_analysis
AS
SELECT
    f.ClaimID,
    d.FullDate,
    d.MonthName,
    d.YearNumber,
    c.CoverageType,
    c.Peril,
    cs.ClaimStatus,
    dr.DriverType,
    dr.DriverAge,
    dr.LicenseValid,
    dr.UsageType,
    dr.IncidentDriverAge,
    dr.IncidentDriverLicenseYears,
    dr.IncidentDriverListedFlag,
    dr.DriverEligibilityFlag,
    dr.AdditionalExcessFlag,
    dr.DriverEligibilityReason,
    f.AdditionalExcessAmount,
    f.ClaimAmount,
    f.ApprovedAmount,
    f.RepudiatedFlag,

    CASE
        WHEN ISNULL(dr.DriverEligibilityFlag, '') IN ('N', 'No')
        THEN 1 ELSE 0
    END AS DriverRepudiationRiskFlag
FROM fact.fact_claims f
LEFT JOIN dim.dim_date d
    ON f.DateKey = d.DateKey
LEFT JOIN dim.dim_coverage c
    ON f.CoverageKey = c.CoverageKey
LEFT JOIN dim.dim_claim_status cs
    ON f.ClaimStatusKey = cs.ClaimStatusKey
LEFT JOIN dim.dim_driver dr
    ON f.DriverKey = dr.DriverKey;
GO