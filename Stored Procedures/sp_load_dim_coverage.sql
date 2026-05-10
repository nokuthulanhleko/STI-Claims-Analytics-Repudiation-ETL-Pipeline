
---sp load dim coverage
CREATE OR ALTER PROCEDURE etl.sp_load_dim_coverage
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_coverage
    (
        CoverageType, Peril
    )
    SELECT DISTINCT
        s.CoverageType,
        s.Peril
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE s.CoverageType IS NOT NULL
      AND s.Peril IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM dim.dim_coverage c
          WHERE ISNULL(c.CoverageType, '') = ISNULL(s.CoverageType, '')
            AND ISNULL(c.Peril, '') = ISNULL(s.Peril, '')
      );
END;
GO



