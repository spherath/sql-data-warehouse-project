/*
=============================================================================
Quality Check
=============================================================================
Script Purpose:
  This script performs quality check to validate the integrity, consistancy,
  and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate key in dimension tables.
    - Referantial integrity between fact and demension tables.
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
  HAVING COUNT(*) =>1;

  -- Check for unique info.
  SELECT DISTINCT gender FROM gold.dim_customers
 
