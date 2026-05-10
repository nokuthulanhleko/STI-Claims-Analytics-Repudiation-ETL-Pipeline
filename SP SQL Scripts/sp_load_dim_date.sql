

---sp load dim date
CREATE OR ALTER PROCEDURE etl.sp_load_dim_date
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_date
    (
        DateKey, FullDate, DayNumber, MonthNumber, MonthName, QuarterNumber, YearNumber
    )
    SELECT DISTINCT
        CONVERT(INT, FORMAT(TRY_CONVERT(DATE, s.ClaimDate), 'yyyyMMdd')) AS DateKey,
        TRY_CONVERT(DATE, s.ClaimDate) AS FullDate,
        DAY(TRY_CONVERT(DATE, s.ClaimDate)) AS DayNumber,
        MONTH(TRY_CONVERT(DATE, s.ClaimDate)) AS MonthNumber,
        DATENAME(MONTH, TRY_CONVERT(DATE, s.ClaimDate)) AS MonthName,
        DATEPART(QUARTER, TRY_CONVERT(DATE, s.ClaimDate)) AS QuarterNumber,
        YEAR(TRY_CONVERT(DATE, s.ClaimDate)) AS YearNumber
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE TRY_CONVERT(DATE, s.ClaimDate) IS NOT NULL
      AND NOT EXISTS
      (
          SELECT 1
          FROM dim.dim_date d
          WHERE d.FullDate = TRY_CONVERT(DATE, s.ClaimDate)
      );
END;
GO