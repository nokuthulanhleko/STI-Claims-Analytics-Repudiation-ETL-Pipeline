
---row count
SELECT COUNT(*) AS DateRows FROM dim.dim_date;
SELECT COUNT(*) AS PolicyRows FROM dim.dim_policy;
SELECT COUNT(*) AS CoverageRows FROM dim.dim_coverage;
SELECT COUNT(*) AS ClaimStatusRows FROM dim.dim_claim_status;
SELECT COUNT(*) AS DriverRows FROM dim.dim_driver;
SELECT COUNT(*) AS FraudRows FROM dim.dim_fraud;
SELECT COUNT(*) AS FactRows FROM fact.fact_claims;

