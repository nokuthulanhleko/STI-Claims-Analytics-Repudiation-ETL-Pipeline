
---sp load fact claims
CREATE OR ALTER PROCEDURE etl.sp_load_fact_claims
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO fact.fact_claims
    (
        ClaimID,
        DateKey,
        PolicyKey,
        CoverageKey,
        ClaimStatusKey,
        DriverKey,
        FraudKey,
        ClaimAmount,
        ApprovedAmount,
        AdditionalExcessAmount,
        PayoutRatio,
        ForcedEntryFlag,
        ProofOfOwnershipFlag,
        RepudiatedFlag,
        ApprovedFlag,
        PartialPayoutFlag
    )
    SELECT
        TRY_CONVERT(INT, s.ClaimID),
        d.DateKey,
        p.PolicyKey,
        c.CoverageKey,
        cs.ClaimStatusKey,
        dr.DriverKey,
        f.FraudKey,
        TRY_CONVERT(DECIMAL(18,2), s.ClaimAmount),
        TRY_CONVERT(DECIMAL(18,2), s.ApprovedAmount),
        TRY_CONVERT(DECIMAL(18,2), s.AdditionalExcessAmount),
        TRY_CONVERT(DECIMAL(10,4), s.PayoutRatio),
        s.ForcedEntryFlag,
        s.ProofOfOwnershipFlag,

        CASE WHEN s.ClaimStatus = 'Repudiated' THEN 1 ELSE 0 END,
        CASE WHEN s.ClaimStatus = 'Approved' THEN 1 ELSE 0 END,
        CASE WHEN s.ClaimStatus LIKE 'Partial%' THEN 1 ELSE 0 END

    FROM sti_claims_staging.dbo.sti_claims_raw s

    INNER JOIN dim.dim_date d
        ON d.FullDate = TRY_CONVERT(DATE, s.ClaimDate)

    INNER JOIN dim.dim_policy p
        ON p.PolicyID = TRY_CONVERT(INT, s.PolicyID)
       AND ISNULL(p.CoverageType_Policy, '') = ISNULL(s.CoverageType_Policy, '')
       AND ISNULL(p.PremiumAmount, 0) = ISNULL(TRY_CONVERT(DECIMAL(18,2), s.PremiumAmount), 0)

    INNER JOIN dim.dim_coverage c
        ON ISNULL(c.CoverageType, '') = ISNULL(s.CoverageType, '')
       AND ISNULL(c.Peril, '') = ISNULL(s.Peril, '')

    INNER JOIN dim.dim_claim_status cs
        ON cs.ClaimStatus = s.ClaimStatus

    LEFT JOIN dim.dim_driver dr
        ON ISNULL(dr.DriverType, '') = ISNULL(s.DriverType, '')
       AND ISNULL(dr.DriverAge, -1) = ISNULL(TRY_CONVERT(INT, s.DriverAge), -1)
       AND ISNULL(dr.LicenseValid, '') = ISNULL(s.LicenseValid, '')
       AND ISNULL(dr.UsageType, '') = ISNULL(s.UsageType, '')
       AND ISNULL(dr.IncidentDriverAge, -1) = ISNULL(TRY_CONVERT(INT, s.IncidentDriverAge), -1)
       AND ISNULL(dr.IncidentDriverLicenseYears, -1) = ISNULL(TRY_CONVERT(DECIMAL(5,2), s.IncidentDriverLicenseYears), -1)
       AND ISNULL(dr.IncidentDriverListedFlag, '') = ISNULL(s.IncidentDriverListedFlag, '')
       AND ISNULL(dr.DriverEligibilityFlag, '') = ISNULL(s.DriverEligibilityFlag, '')
       AND ISNULL(dr.AdditionalExcessFlag, '') = ISNULL(s.AdditionalExcessFlag, '')
       AND ISNULL(dr.DriverEligibilityReason, '') = ISNULL(s.DriverEligibilityReason, '')

    LEFT JOIN dim.dim_fraud f
        ON ISNULL(f.FraudScore, -1) = ISNULL(TRY_CONVERT(INT, s.FraudScore), -1)
       AND ISNULL(f.FraudRiskScore, -1) = ISNULL(TRY_CONVERT(INT, s.FraudRiskScore), -1)

    WHERE TRY_CONVERT(INT, s.ClaimID) IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM fact.fact_claims fc
          WHERE fc.ClaimID = TRY_CONVERT(INT, s.ClaimID)
      );
END;
GO