/*
================================================================================
Quality checks
================================================================================
Script Purpose:
This script performs various quality checks to ensure data consistency, accuracy, 
and standardization across the "silver" schemas. It includes checks for:
	- Null values or duplicate primary keys.
	- Unwanted spaces in string fields.
	- Data standardization and consistency.
	- Invalid date ranges and ordering.
	- Data consistency between related fields.

Usage Notes:
	- Run these checks after loading the silver layer.
	- Investigate and resolve any discrepancies found during the checks.
================================================================================
*/
--==================================
-- Checking 'Silver.crm_cust-info'
--==================================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

SELECT
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- check for unwanted spaces
-- expectation: No Results
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

-- final look of Silver.crm_cust-info
SELECT * FROM silver.crm_cust_info

--==================================
-- Checking 'silver.crm_prd_info'
--==================================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

SELECT
    prd_id,
    COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted spaces prd_nm
-- Expectation: No Results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or Negative Numbers
-- Expectation: No Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 or prd_cost IS NULL

-- Data standardization & Consistancy
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- check for invalid date orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- final look of silver.crm_prd_info
SELECT * FROM silver.crm_prd_info

--====================================
-- Checking 'silver.crm_sales_details'
--====================================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

SELECT 
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check data consistancy: Between Sales, Qty, & Price
-- >> Sales = Qty. * Price
-- >> Value must not be Null, Zero or Negative
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

-- final check
SELECT * FROM silver.crm_sales_details

--================================
-- Checking 'silver.erp_cust_az12'
--================================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

-- DOB
SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Gender
SELECT DISTINCT gen
FROM silver.erp_cust_az12

-- check the data qulity on Silver layer table
SELECT * FROM silver.erp_cust_az12

--===============================
-- Checking 'silver.erp_loc_a101'
--===============================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

--Recheck the correctiveness of the inserted data
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

-- check the data qulity on Silver layer table
SELECT * FROM silver.erp_loc_a101


--=================================
-- Checking 'silver.erp_px_cat_g1v2'
--=================================
-- Check for NULLS or DUplicates in Primary Key
-- Expectation: No Results

--Check @ silver table
SELECT * FROM silver.erp_px_cat_g1v2
