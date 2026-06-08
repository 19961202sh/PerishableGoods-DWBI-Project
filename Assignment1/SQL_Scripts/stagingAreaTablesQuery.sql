
CREATE TABLE stg_transaction (
    record_id INT,
    product_id VARCHAR(50),
    store_id VARCHAR(50),
    supplier_id VARCHAR(50),
    transaction_date DATE,
    expiration_date DATE,
    units_sold INT,
    units_wasted INT,
    revenue FLOAT,
    profit FLOAT,
    waste_cost FLOAT
);

ALTER TABLE stg_transaction
ADD base_price FLOAT,
    cost_price FLOAT,
    selling_price FLOAT;



CREATE TABLE stg_product_supplier (
    product_id VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    supplier_id VARCHAR(50),
    supplier_score FLOAT,
    spoilage_sensitivity FLOAT
);

CREATE TABLE stg_store (
    store_id VARCHAR(50),
    region VARCHAR(50)
);


CREATE TABLE stg_storage (
    storage_temp FLOAT,
    temp_deviation FLOAT,
    handling_score FLOAT,
    packaging_score FLOAT
);


CREATE TABLE stg_date (
    full_date DATE,
    day INT,
    month INT,
    year INT,
    day_of_week INT,
    is_weekend BIT
);








select * from stg_transaction
select * from stg_product_supplier
select * from stg_storage
select * from stg_store
select * from stg_date

truncate table stg_transaction
truncate table stg_product_supplier
truncate table stg_storage
truncate table stg_store
truncate table stg_date









