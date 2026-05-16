
---coveragetype_claims_totals
SELECT 
    c.CoverageType,
    COUNT(*) AS TotalClaims,
    SUM(CASE WHEN d.DriverType IS NULL THEN 1 ELSE 0 END) AS MissingDriverType
FROM fact.fact_claims f
LEFT JOIN dim.dim_driver d
    ON f.DriverKey = d.DriverKey
LEFT JOIN dim.dim_coverage c
    ON f.CoverageKey = c.CoverageKey
GROUP BY c.CoverageType;