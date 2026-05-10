
---sp load dim fraud
CREATE OR ALTER PROCEDURE etl.sp_load_dim_fraud
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_fraud
    (
        FraudScore,
        FraudRiskScore
    )
    SELECT DISTINCT
        TRY_CONVERT(INT, s.FraudScore),
        TRY_CONVERT(INT, s.FraudRiskScore)
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE NOT EXISTS
    (
     SELECT 1
        FROM dim.dim_fraud f
        WHERE ISNULL(f.FraudScore, -1) = ISNULL(TRY_CONVERT(INT, s.FraudScore), -1)
          AND ISNULL(f.FraudRiskScore, -1) = ISNULL(TRY_CONVERT(INT, s.FraudRiskScore), -1)
    );
END;
GO