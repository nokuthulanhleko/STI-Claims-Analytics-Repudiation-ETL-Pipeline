
---sp load dim claim status
CREATE OR ALTER PROCEDURE etl.sp_load_dim_driver
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dim.dim_driver
    (
        DriverType,
        DriverAge,
        LicenseValid,
        UsageType,
        IncidentDriverAge,
        IncidentDriverLicenseYears,
        IncidentDriverListedFlag,
        DriverEligibilityFlag,
        AdditionalExcessFlag,
        DriverEligibilityReason
    )
      SELECT DISTINCT
        s.DriverType,
        TRY_CONVERT(INT, s.DriverAge),
        s.LicenseValid,
        s.UsageType,
        TRY_CONVERT(INT, s.IncidentDriverAge),
        TRY_CONVERT(DECIMAL(5,2), s.IncidentDriverLicenseYears),
        s.IncidentDriverListedFlag,
        s.DriverEligibilityFlag,
        s.AdditionalExcessFlag,
        s.DriverEligibilityReason
    FROM sti_claims_staging.dbo.sti_claims_raw s
    WHERE NOT EXISTS
    (
            SELECT 1
        FROM dim.dim_driver d
        WHERE ISNULL(d.DriverType, '') = ISNULL(s.DriverType, '')
          AND ISNULL(d.DriverAge, -1) = ISNULL(TRY_CONVERT(INT, s.DriverAge), -1)
          AND ISNULL(d.LicenseValid, '') = ISNULL(s.LicenseValid, '')
          AND ISNULL(d.UsageType, '') = ISNULL(s.UsageType, '')
          AND ISNULL(d.IncidentDriverAge, -1) = ISNULL(TRY_CONVERT(INT, s.IncidentDriverAge), -1)
          AND ISNULL(d.IncidentDriverLicenseYears, -1) = ISNULL(TRY_CONVERT(DECIMAL(5,2), s.IncidentDriverLicenseYears), -1)
          AND ISNULL(d.IncidentDriverListedFlag, '') = ISNULL(s.IncidentDriverListedFlag, '')
          AND ISNULL(d.DriverEligibilityFlag, '') = ISNULL(s.DriverEligibilityFlag, '')
          AND ISNULL(d.AdditionalExcessFlag, '') = ISNULL(s.AdditionalExcessFlag, '')
          AND ISNULL(d.DriverEligibilityReason, '') = ISNULL(s.DriverEligibilityReason, '')
    );
END;
GO