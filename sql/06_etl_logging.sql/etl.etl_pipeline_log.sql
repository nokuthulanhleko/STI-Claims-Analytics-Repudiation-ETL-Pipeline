---pipeline log test

EXEC etl.sp_run_claims_pipeline;
GO

SELECT *
FROM etl.etl_pipeline_log
ORDER BY LogID DESC;