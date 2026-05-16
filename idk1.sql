
select * from customer_address;

select * from customer_address;

select * from transactions;

drop table transactions;


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    transaction_date DATE,
    online_order BOOLEAN,
    order_status VARCHAR(20),
    brand VARCHAR(50),
    product_line VARCHAR(100),
    product_class VARCHAR(100),
    product_size VARCHAR(50),
    list_price FLOAT,
    standard_cost FLOAT,
    product_first_sold_date DATE
);
select * from transactions;