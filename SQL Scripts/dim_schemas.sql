CREATE SCHEMA dim;
GO

CREATE SCHEMA fact;
GO

CREATE SCHEMA etl;
GO

USE sti_claims_dw;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dim')
BEGIN
    EXEC('CREATE SCHEMA dim');
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'fact')
BEGIN
    EXEC('CREATE SCHEMA fact');
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'etl')
BEGIN
    EXEC('CREATE SCHEMA etl');
END
GO

SELECT name 
FROM sys.schemas
WHERE name IN ('dim', 'fact', 'etl');