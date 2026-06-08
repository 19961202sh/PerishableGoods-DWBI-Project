ALTER TABLE dbo.TransactionData
ADD base_price FLOAT,
    cost_price FLOAT,
    selling_price FLOAT;


select * from dbo.TransactionData


UPDATE t
SET 
    t.base_price = n.base_price,
    t.cost_price = n.cost_price,
    t.selling_price = n.selling_price
FROM dbo.TransactionData t
JOIN dbo.transaction_data_new n
ON t.record_id = n.record_id;


UPDATE dbo.TransactionData
SET 
    base_price = ROUND(base_price, 2),
    cost_price = ROUND(cost_price, 2),
    selling_price = ROUND(selling_price, 2),
    profit = ROUND(profit,2),
    waste_cost = ROUND(waste_cost,2),
    revenue = ROUND(revenue,2)




    CREATE TABLE Fact_Lookup_Errors (
    record_id INT,
    product_id VARCHAR(50),
    store_id VARCHAR(50),
    supplier_id VARCHAR(50),
    transaction_date DATE,
    ErrorSource NVARCHAR(50),
    ErrorCode INT,
    ErrorColumn INT
);


ALTER TABLE Fact_Lookup_Errors
ADD txn_id INT

ALTER TABLE Fact_Lookup_Errors
ADD accm_txn_complete_time DATETIME



ALTER TABLE Fact_Lookup_Errors
ADD error_reason NVARCHAR(100)



select * from dbo.Fact_Lookup_Errors
select count(*) from dbo.Fact_Lookup_Errors




ALTER TABLE Fact_Lookup_Errors
ALTER COLUMN ErrorSource NVARCHAR(50);

drop table Fact_Lookup_Errors








SELECT COUNT(*) FROM Dim_Product;
SELECT COUNT(*) FROM Dim_Store;
SELECT COUNT(*) FROM Dim_Supplier;
SELECT COUNT(*) FROM Dim_Storage;
SELECT COUNT(*) FROM Dim_Date;
SELECT COUNT(*) FROM Fact_Transaction;

SELECT TOP 10 * FROM Dim_Product;
SELECT TOP 10 * FROM Dim_Store;
SELECT TOP 10 * FROM Dim_Storage;
SELECT TOP 10 * FROM Dim_Supplier;
SELECT TOP 10 * FROM Dim_Date;
SELECT TOP 10 * FROM Fact_Transaction;

SELECT f.product_key
FROM Fact_Transaction f
LEFT JOIN Dim_Product d
ON f.product_key = d.product_key
WHERE d.product_key IS NULL;


SELECT * FROM Dim_Product
WHERE is_current = 0;


SELECT date_key, COUNT(*)
FROM Dim_Date
GROUP BY date_key
HAVING COUNT(*) > 1;


SELECT TOP 10 
    txn_id,
    accm_txn_create_time,
    accm_txn_complete_time,
    txn_process_time_hours
FROM Fact_Transaction;

SELECT COUNT(*) AS Pending_Transactions
FROM Fact_Transaction
WHERE accm_txn_complete_time IS NULL;

SELECT TOP 10 
    txn_id,
    DATEDIFF(HOUR, accm_txn_create_time, accm_txn_complete_time) AS Expected,
    txn_process_time_hours AS Actual
FROM Fact_Transaction;

SELECT txn_id, COUNT(*)
FROM Fact_Transaction
GROUP BY txn_id
HAVING COUNT(*) > 1;

SELECT * FROM Fact_Lookup_Errors