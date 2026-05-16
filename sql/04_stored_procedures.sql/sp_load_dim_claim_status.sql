
---sp load claim status
CREATE OR ALTER PROCEDURE etl.sp_load_dim_claim_status
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_claim_status
    (
        ClaimStatus
    )
    SELECT DISTINCT
        s.ClaimStatus
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE s.ClaimStatus IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM dim.dim_claim_status cs
          WHERE cs.ClaimStatus = s.ClaimStatus
      );
END;
GO
