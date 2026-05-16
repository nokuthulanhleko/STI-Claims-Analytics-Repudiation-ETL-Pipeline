
---sp run claims pipeline
CREATE OR ALTER PROCEDURE etl.sp_run_claims_pipeline
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartTime DATETIME = GETDATE();

    BEGIN TRY

        INSERT INTO etl.etl_pipeline_log
        (
            PipelineName,
            ProcedureName,
            StartTime,
            Status
        )
        VALUES
        (
            'STI Claims ETL Pipeline',
            'etl.sp_run_claims_pipeline',
            @StartTime,
            'Running'
        );

        BEGIN TRANSACTION;

            EXEC etl.sp_load_dim_date;

            EXEC etl.sp_load_dim_policy;

            EXEC etl.sp_load_dim_coverage;

            EXEC etl.sp_load_dim_claim_status;

            EXEC etl.sp_load_dim_driver;

            EXEC etl.sp_load_dim_fraud;

            EXEC etl.sp_load_fact_claims;

        COMMIT TRANSACTION;

        UPDATE etl.etl_pipeline_log
        SET
            EndTime = GETDATE(),
            Status = 'Success',
            RowsProcessed =
            (
                SELECT COUNT(*)
                FROM fact.fact_claims
            )
        WHERE LogID =
        (
            SELECT MAX(LogID)
            FROM etl.etl_pipeline_log
        );

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        UPDATE etl.etl_pipeline_log
        SET
            EndTime = GETDATE(),
            Status = 'Failed',
            ErrorMessage = ERROR_MESSAGE()
        WHERE LogID =
        (
            SELECT MAX(LogID)
            FROM etl.etl_pipeline_log
        );

        THROW;

    END CATCH
END;
GO