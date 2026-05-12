---check for missing dimensions
SELECT
    SUM(CASE WHEN DateKey IS NULL THEN 1 ELSE 0 END) AS MissingDateKey,
    SUM(CASE WHEN PolicyKey IS NULL THEN 1 ELSE 0 END) AS MissingPolicyKey,
    SUM(CASE WHEN CoverageKey IS NULL THEN 1 ELSE 0 END) AS MissingCoverageKey,
    SUM(CASE WHEN ClaimStatusKey IS NULL THEN 1 ELSE 0 END) AS MissingClaimStatusKey,
    SUM(CASE WHEN DriverKey IS NULL THEN 1 ELSE 0 END) AS MissingDriverKey,
    SUM(CASE WHEN FraudKey IS NULL THEN 1 ELSE 0 END) AS MissingFraudKey
FROM fact.fact_claims;