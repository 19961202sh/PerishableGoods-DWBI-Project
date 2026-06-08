CREATE TABLE Dim_Product(
	product_key INT IDENTITY(1,1) PRIMARY KEY,
	product_id NVARCHAR(50),
	product_name NVARCHAR(100),
	category NVARCHAR(50),
	spoilage_sensitivity FLOAT,
	start_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE Dim_Store(
	store_key INT IDENTITY(1,1) PRIMARY KEY,
	store_id NVARCHAR(50),
	region NVARCHAR(50)
);


CREATE TABLE Dim_Supplier (
    supplier_key INT IDENTITY(1,1) PRIMARY KEY,
    supplier_id NVARCHAR(50),
    supplier_score FLOAT,
    start_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE Dim_Storage (
    storage_key INT IDENTITY(1,1) PRIMARY KEY,
    storage_temp FLOAT,
    temp_deviation FLOAT,
    handling_score FLOAT,
    packaging_score FLOAT
);

CREATE TABLE Dim_Date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT,
    day_of_week INT,
    is_weekend BIT,
    quarter INT,
    week_of_year INT
);


CREATE TABLE Fact_Transaction (
    fact_id INT IDENTITY(1,1) PRIMARY KEY,
    
    product_key INT,
    store_key INT,
    supplier_key INT,
    date_key INT,
    storage_key INT,

    units_sold INT,
    units_wasted INT,
    
    base_price FLOAT,
    cost_price FLOAT,
    selling_price FLOAT,

    revenue FLOAT,
    profit FLOAT,
    waste_cost FLOAT,

    expiration_date DATE,

    FOREIGN KEY (product_key) REFERENCES Dim_Product(product_key),
    FOREIGN KEY (store_key) REFERENCES Dim_Store(store_key),
    FOREIGN KEY (supplier_key) REFERENCES Dim_Supplier(supplier_key),
    FOREIGN KEY (date_key) REFERENCES Dim_Date(date_key),
    FOREIGN KEY (storage_key) REFERENCES Dim_Storage(storage_key)
);


ALTER TABLE Dim_Product 
ADD CONSTRAINT DF_Product_start DEFAULT GETDATE() FOR start_date;

ALTER TABLE Dim_Product 
ADD CONSTRAINT DF_Product_iscurrent DEFAULT 1 FOR is_current;

ALTER TABLE Dim_Supplier 
ADD CONSTRAINT DF_Supplier_start DEFAULT GETDATE() FOR start_date;

ALTER TABLE Dim_Supplier 
ADD CONSTRAINT DF_Supplier_iscurrent DEFAULT 1 FOR is_current;



SELECT COUNT(*) AS Product_Dimension FROM Dim_Product;
SELECT COUNT(*) AS Supplier_Dimension FROM Dim_Supplier;
SELECT COUNT(*) AS Store_Dimension FROM Dim_Store;
SELECT COUNT(*) AS Date_Dimension FROM Dim_Date;
SELECT COUNT(*) AS Storage_Dimension FROM Dim_Storage;
SELECT COUNT(*) AS Fact_Transaction FROM Fact_Transaction;




select * from dbo.Dim_Product
SELECT COUNT(*) AS Product_Dimension FROM Dim_Product;

SELECT * FROM Dim_Supplier;
SELECT COUNT(*) FROM Dim_Supplier;

select* from dbo.Dim_Store
SELECT COUNT(*) FROM Dim_Store;

SELECT * FROM Dim_Storage;
SELECT COUNT(*) FROM Dim_Storage;

select * from dbo.Dim_Date
SELECT COUNT(*) FROM Dim_Date;

select * from Fact_Transaction
SELECT COUNT(*) FROM Fact_Transaction;

drop table Fact_Transaction

truncate table Fact_Transaction
truncate table Dim_Product
truncate table Dim_Storage
truncate table Dim_Store
truncate table Dim_Supplier
truncate table Dim_Date


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

SELECT COUNT(*) FROM Fact_Lookup_Errors;
select * from Fact_Lookup_Errors





