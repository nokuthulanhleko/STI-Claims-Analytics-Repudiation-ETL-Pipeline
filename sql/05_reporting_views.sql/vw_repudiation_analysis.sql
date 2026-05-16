

--- vw_repudiation analysis

USE sti_claims_dw;
GO

CREATE OR ALTER VIEW dbo.vw_repudiation_analysis
AS
SELECT
    f.ClaimID,
    d.FullDate,
    d.MonthName,
    d.YearNumber,
    c.CoverageType,
    c.Peril,
    cs.ClaimStatus,
    f.ClaimAmount,
    f.ApprovedAmount,
    f.PayoutRatio,
    f.ForcedEntryFlag,
    f.ProofOfOwnershipFlag,
    f.RepudiatedFlag,
    f.PartialPayoutFlag,

    CASE 
        WHEN c.CoverageType = 'Contents'
         AND c.Peril LIKE '%Burglary%'
         AND ISNULL(f.ForcedEntryFlag, '') IN ('N', 'No')
        THEN 1 ELSE 0
    END AS ForcedEntryRepudiationFlag,

    CASE
        WHEN ISNULL(f.ProofOfOwnershipFlag, '') IN ('N', 'No')
        THEN 1 ELSE 0
    END AS ProofOfOwnershipIssueFlag,

    CASE
        WHEN c.CoverageType = 'Contents'
         AND c.Peril LIKE '%Burglary%'
         AND ISNULL(f.ForcedEntryFlag, '') IN ('N', 'No')
        THEN 'Contents burglary: no visible signs of forced entry'

        WHEN ISNULL(f.ProofOfOwnershipFlag, '') IN ('N', 'No')
        THEN 'Missing proof of ownership'

        WHEN f.RepudiatedFlag = 1
        THEN 'Other repudiation reason'

        ELSE 'Approved or partially approved'
    END AS RepudiationReason
FROM fact.fact_claims f
LEFT JOIN dim.dim_date d
    ON f.DateKey = d.DateKey
LEFT JOIN dim.dim_coverage c
    ON f.CoverageKey = c.CoverageKey
LEFT JOIN dim.dim_claim_status cs
    ON f.ClaimStatusKey = cs.ClaimStatusKey;
GO