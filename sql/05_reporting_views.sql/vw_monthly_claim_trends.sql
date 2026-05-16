
---vw_monthly claim trends

CREATE OR ALTER VIEW dbo.vw_monthly_claim_trends
AS
SELECT
    d.YearNumber,
    d.MonthNumber,
    d.MonthName,
    COUNT(*) AS TotalClaims,
    SUM(f.ClaimAmount) AS TotalClaimAmount,
    SUM(f.ApprovedAmount) AS TotalApprovedAmount,
    SUM(CAST(f.RepudiatedFlag AS INT)) AS RepudiatedClaims,
    SUM(CAST(f.ApprovedFlag AS INT)) AS ApprovedClaims,
    SUM(CAST(f.PartialPayoutFlag AS INT)) AS PartialPayoutClaims,

    CAST(
        SUM(CAST(f.RepudiatedFlag AS INT)) * 1.0 / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,4)
    ) AS RepudiationRate,

    CAST(
        SUM(f.ApprovedAmount) * 1.0 / NULLIF(SUM(f.ClaimAmount), 0)
        AS DECIMAL(10,4)
    ) AS PayoutRatio
FROM fact.fact_claims f
LEFT JOIN dim.dim_date d
    ON f.DateKey = d.DateKey
GROUP BY
    d.YearNumber,
    d.MonthNumber,
    d.MonthName;
GO