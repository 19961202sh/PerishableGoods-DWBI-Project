select * from dbo.TransactionData

select * from dbo.Dim_Date

SELECT product_id, COUNT(*)
FROM Dim_Product
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT product_id, product_name, start_date, end_date, is_current
FROM Dim_Product

--accumulative table update
SELECT fact_id, accm_txn_create_time, accm_txn_complete_time, txn_process_time_hours
FROM Fact_Transaction

SELECT * FROM dbo.Fact_Lookup_Errors;




-- View all dimension tables
SELECT * FROM Dim_Product;
SELECT * FROM Dim_Store;
SELECT * FROM Dim_Supplier;
SELECT * FROM Dim_Storage;
SELECT * FROM Dim_Date;

-- View fact table
SELECT * FROM Fact_Transaction;

-- Check if all foreign keys in fact table exist in dimensions

SELECT *
FROM Fact_Transaction f
LEFT JOIN Dim_Product p ON f.Product_key = p.Product_key
WHERE p.Product_key IS NULL;

-- Check duplicate product_id (SCD Type 2 behavior)

SELECT product_id, COUNT(*) AS record_count
FROM Dim_Product
GROUP BY product_id
HAVING COUNT(*) > 1;

-- View historical records

SELECT product_id, product_name, start_date, end_date, is_current
FROM Dim_Product
ORDER BY product_id, start_date;

-- Check for duplicate dates

SELECT full_date, COUNT(*)
FROM Dim_Date
GROUP BY full_date
HAVING COUNT(*) > 1;

-- Count records in each table

SELECT COUNT(*) AS Product_Count FROM Dim_Product;
SELECT COUNT(*) AS Store_Count FROM Dim_Store;
SELECT COUNT(*) AS Supplier_Count FROM Dim_Supplier;
SELECT COUNT(*) AS Fact_Count FROM Fact_Transaction;


-- View error table

SELECT * FROM Fact_Lookup_Errors;

-- Check specific invalid txn_id

SELECT *
FROM Fact_Lookup_Errors
WHERE txn_id = 999999;


-- View lifecycle columns - Accumulative table

SELECT fact_id, accm_txn_create_time, accm_txn_complete_time, txn_process_time_hours
FROM Fact_Transaction;

-- Check only completed transactions

SELECT *
FROM Fact_Transaction
WHERE accm_txn_complete_time IS NOT NULL;

-- Validate calculated process time

SELECT 
fact_id,
accm_txn_create_time,
accm_txn_complete_time,
DATEDIFF(HOUR, accm_txn_create_time, accm_txn_complete_time) AS Calculated_Hours,
txn_process_time_hours
FROM Fact_Transaction
WHERE accm_txn_complete_time IS NOT NULL;