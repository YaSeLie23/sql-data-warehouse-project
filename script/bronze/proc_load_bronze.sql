/*
==========================================================================================================================================
Stored Procedure: Load Bronze Layer (Source --> Bronze)
===========================================================================================================================================
Script Purpose:
This procedure loads data into the 'bronze' schema from external CSV files.
It performs:
1. Truncates the bronze tables before loading data.
2. Uses the `BULK INSERT' to load data from CSV files into bronze tables.

Parameters:
    None.
      This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

Note:
    The BULK INSERT paths are based on where you saved the datasets in which folder.
    Change them to the folder where you saved the datasets.
=====================================================================================================================================
*/

EXEC bronze.load_bronze;
--Create stored procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=================================';

		PRINT '----------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '----------------------------------';

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.crm_cust_info<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>>Full Load data: bronze.crm_cust_info<<';
		--Full load the data in table bronze.crm_cut_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';
		--SELECT COUNT(*) FROM bronze.crm_cust_info;

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.crm_prd_info<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>Inserting data into: bronze.crm_prd_info<<';
		--Full load the data in table bronze.crm_prd_info
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';
		--SELECT * FROM bronze.crm_prd_info;
		--SELECT COUNT(*) FROM bronze.crm_prd_info;

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.crm_sales_details<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>Inserting data into: bronze.crm_sales_details<<';
		--Full load the data in table bronze.crm_prd_info
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';

		--SELECT * FROM bronze.crm_sales_details;
		--SELECT COUNT(*) FROM bronze.crm_sales_details;

		PRINT '-----------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------';

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.erp_cust_az12<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>>Inserting data into: bronze.erp_cust_az12<<';
		--Full load the data in table bronze.erp_cust_az12
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';

		--SELECT * FROM bronze.erp_cust_az12;
		--SELECT COUNT(*) FROM bronze.erp_cust_az12;

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.erp_loc_a101<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>>Inserting data into: bronze.erp_loc_a101<<';
		--Full load the data in table bronze.erp_loc_a101
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';

		--SELECT * FROM bronze.erp_loc_a101;
		--SELECT COUNT(*) FROM bronze.erp_loc_a101;

		SET @start_time = GETDATE();
		PRINT '>>Truuncating CRM Table: bronze.erp_px_cat_g1v2<<';
		--data quality: if there is a duplicate, truncate and load the table
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>>Inserting data into: bronze.erp_px_cat_g1v2<<';
		--Full load the data in table bronze.erp_loc_a101
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Yassmin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------------------------------------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT '=============================================================================================';
		PRINT 'LOADING BRONZE LAYER COMPLETED';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '=================================================================================================';
	END TRY
	BEGIN CATCH
		PRINT '================================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '================================================================';
	END CATCH
END
--SELECT * FROM bronze.erp_px_cat_g1v2;
--SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;


