/* 
===============================
CREATE DATABASE AND SCHEMA
===============================
Script Purpose:
  Create a new database named 'DataWarehouse', after checking if the database exists. 
  The database is dropped and recreated if it already exists. Also, the script sets up three schemas
  within the database: Bronze, Silver, and Gold.

WARNING:
Running this script will drop the entire DataWarehouse database if it already exists.
All data in the database will be permanently deleted. So, proceed with caution.
Ensure you have proper backup before running this script.

*/

-- Create Database 'Data Warehouse'

USE master;

--check if the data warehouse database exist
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER ROLLBACK IMMEDIATE;
  DROP DATABASE DateWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

--Create schema for each layer
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO


