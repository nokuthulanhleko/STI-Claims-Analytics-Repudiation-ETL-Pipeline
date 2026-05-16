
---etl pipiline log
USE sti_claims_dw;
GO

CREATE TABLE etl.etl_pipeline_log
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,

    PipelineName VARCHAR(200),

    ProcedureName VARCHAR(200),

    StartTime DATETIME,

    EndTime DATETIME,

    Status VARCHAR(50),

    RowsProcessed INT,

    ErrorMessage VARCHAR(MAX),

    CreatedDate DATETIME DEFAULT GETDATE()
);
GO