
---vw_claims_summary

CREATE OR ALTER VIEW dbo.vw_claims_summary
AS
SELECT
    f.ClaimFactKey,
    f.ClaimID,
    d.FullDate,
    d.MonthName,
    d.MonthNumber,
    d.QuarterNumber,
    d.YearNumber,
    p.PolicyID,
    p.CoverageType_Policy,
    p.PremiumAmount,
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
    fr.FraudScore,
    fr.FraudRiskScore,
    f.ClaimAmount,
    f.ApprovedAmount,
    f.AdditionalExcessAmount,
    f.PayoutRatio,
    f.ForcedEntryFlag,
    f.ProofOfOwnershipFlag,
    f.RepudiatedFlag,
    f.ApprovedFlag,
    f.PartialPayoutFlag,
    f.LoadDate
FROM fact.fact_claims f
LEFT JOIN dim.dim_date d 
    ON f.DateKey = d.DateKey
LEFT JOIN dim.dim_policy p 
    ON f.PolicyKey = p.PolicyKey
LEFT JOIN dim.dim_coverage c 
    ON f.CoverageKey = c.CoverageKey
LEFT JOIN dim.dim_claim_status cs 
    ON f.ClaimStatusKey = cs.ClaimStatusKey
LEFT JOIN dim.dim_driver dr 
    ON f.DriverKey = dr.DriverKey
LEFT JOIN dim.dim_fraud fr 
    ON f.FraudKey = fr.FraudKey;
GO