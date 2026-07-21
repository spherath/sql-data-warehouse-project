/*
=============================================================================
Quality Check
=============================================================================
Script Purpose:
  This script performs quality check to validate the integrity, consistency,
  and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate key in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks after the data loading from Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
=============================================================================
*/

--===========================================================================
--Checking 'gold.dim_customers'
--===========================================================================
-- Check for Uniqueness of Customer key in gold.dim_customers
-- Expectation: No results

SELECT
    customer_key,
    COUNT(*) AS duplicate_count
  FROM gold.dim_customers
  GROUP BY customer_key
  HAVING COUNT(*) >1;

--===========================================================================
--Checking 'gold.product_key'
--===========================================================================
-- Check for Uniqueness of Product key in gold.dim_customers
-- Expectation: No results
SELECT
    Product_key,
    COUNT(*) AS duplicate_count
  FROM gold.dim_products
  GROUP BY product_key
  HAVING COUNT(*) >1;

--===========================================================================
--Checking 'gold.fact_sales'
--===========================================================================
-- Check for data model connectivity between fact and dimensions

SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f. customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.Product_key IS NULL OR c.customer_key IS NULL

-- Check for unique info.
SELECT DISTINCT gender FROM gold.dim_customers

--===========================================================================
--Checking ' gold.dim_products'
--===========================================================================  
-- view
SELECT * FROM gold.dim_products

--===========================================================================
--Checking 'gold.fact_sales'
--===========================================================================
-- Check the quality
SELECT * FROM gold.fact_sales
 
