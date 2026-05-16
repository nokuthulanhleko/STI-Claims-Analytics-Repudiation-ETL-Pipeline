
---vw_fraud analysis

CREATE OR ALTER VIEW dbo.vw_fraud_analysis
AS
SELECT
    f.ClaimID,
    d.FullDate,
    d.MonthName,
    d.YearNumber,
    c.CoverageType,
    c.Peril,
    cs.ClaimStatus,
    fr.FraudScore,
    fr.FraudRiskScore,
    f.ClaimAmount,
    f.ApprovedAmount,
    f.PayoutRatio,
    f.RepudiatedFlag,

    CASE
        WHEN fr.FraudRiskScore >= 80 THEN 'High Risk'
        WHEN fr.FraudRiskScore >= 50 THEN 'Medium Risk'
        WHEN fr.FraudRiskScore IS NULL THEN 'Unknown'
        ELSE 'Low Risk'
    END AS FraudRiskBand,

    CASE
        WHEN fr.FraudRiskScore >= 80 THEN 1 ELSE 0
    END AS HighFraudRiskFlag
FROM fact.fact_claims f
LEFT JOIN dim.dim_date d
    ON f.DateKey = d.DateKey
LEFT JOIN dim.dim_coverage c
    ON f.CoverageKey = c.CoverageKey
LEFT JOIN dim.dim_claim_status cs
    ON f.ClaimStatusKey = cs.ClaimStatusKey
LEFT JOIN dim.dim_fraud fr
    ON f.FraudKey = fr.FraudKey;
GO