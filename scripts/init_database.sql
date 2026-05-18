/*
=======================================
Create Database and Schemas
=======================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database existed, it would be deleted and recreated. Additionally, the script sets up three schemas
  within the database: 'bronz', 'silver' and 'gold'.

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All the data in the 'DataWarehouse' database will be permanently deleted. Proceed with caution and 
  ensure you have proper backups before running this script
*/
