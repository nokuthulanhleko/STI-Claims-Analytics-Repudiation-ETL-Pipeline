
---sp load dim policy

CREATE OR ALTER PROCEDURE etl.sp_load_dim_policy
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_policy
    (
        PolicyID, CoverageType_Policy, PremiumAmount
    )
    SELECT DISTINCT
        TRY_CONVERT(INT, s.PolicyID),
        s.CoverageType_Policy,
        TRY_CONVERT(DECIMAL(18,2), s.PremiumAmount)
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE TRY_CONVERT(INT, s.PolicyID) IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM dim.dim_policy p
          WHERE p.PolicyID = TRY_CONVERT(INT, s.PolicyID)
            AND ISNULL(p.CoverageType_Policy, '') = ISNULL(s.CoverageType_Policy, '')
            AND ISNULL(p.PremiumAmount, 0) = ISNULL(TRY_CONVERT(DECIMAL(18,2), s.PremiumAmount), 0)
      );
END;
GO


