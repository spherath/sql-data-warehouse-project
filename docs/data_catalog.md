# Data Catalogue / Dictionary for Gold Layer

### Overview

The Gold Layer is the business level data representation, structure to support analytical and reporting use cases. It consists of dimension tables and fact tables for specific business metrics. 

1.	gold.dim_customers
•	Purpose: Stores customer details enriched with demographic and geographic data.

•	Columns:

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| customer_key| INT | Surrogate key uniquely identifying each customer record in the dimension table.|
| customer_id |	INT | Unique numerical identifier assigned to each customer.|
|customer_number |	NVARCHAR(50) |	Alphanumeric identifier representing the customer, used for tracking and referencing.|
|first_name |	NVARCHAR(50) |	The customer's first name, as recoded in the system.|
|last_name |	NVARCHAR(50) |	The customer's last name, or family name.|
|country |	NVARCHAR(50) |	The residing country of the customer (Ex. 'Germany').|
|marital_status |	NVARCHAR(50) |	The marital status of the customer (Ex. 'Married', 'Single').|
|gender |	NVARCHAR(50) |	The gender of the customer (Ex. 'Male', 'Female', 'n/a').|
|birthdate |	DATE |	The customer's date of birth, formatted as YYYY-MM-DD (Ex. 1971-10-06).|
|create_date |	DATE |	The date and time when the customer record was created in the system.|

