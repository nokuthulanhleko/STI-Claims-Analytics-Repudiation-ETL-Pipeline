
---test scripts
SELECT * FROM dbo.vw_kpi_overview;
SELECT TOP 20 * FROM dbo.vw_repudiation_analysis;
SELECT TOP 20 * FROM dbo.vw_driver_eligibility_analysis;
SELECT TOP 20 * FROM dbo.vw_fraud_analysis;
SELECT TOP 20 * FROM dbo.vw_monthly_claim_trends
ORDER BY YearNumber, MonthNumber;