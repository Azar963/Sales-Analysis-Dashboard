use sales;

/* 1. show all customer records */
select * from customers;

/*  2. Show total number of customers*/
select count(*) from customers;

/*3. Show total number of markets*/
select count(*) from markets;

/* 4. Show total number of products */
select count(*) from products;

/* 5. Show all transactions */
select * from transactions;

/* 6. Show transactions for chennai market(market code for chennai is Mark001)*/
SELECT 
    *
FROM
    transactions
WHERE
    market_code = 'Mark001';

/* 7. Show transactions for Mumbai market (market code for mumbai is Mark002 */
SELECT 
    *
FROM
    transactions
WHERE
    market_code = 'Mark002';

/* 8.Show distrinct product codes that were sold in mumbai */
SELECT DISTINCT
    product_code
FROM
    transactions
WHERE
    market_code = 'Mark002';

/* 9. Show transactions where currency is US dollars */
select * from transactions where currency='USD';

/* 10.Show transactions in 2020 join by date table */
SELECT 
    transactions.*, date.*
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2019;

/* 11. Show total revenue in year 2019 */
SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2019
        AND transactions.currency = 'INR'
        OR transactions.currency = 'USD';

/*12. Show total revenue in year 2019, Febuary Month */
SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2019
        AND date.month_name = 'Febuary'
        AND (transactions.currency = 'INR'
        OR transactions.currency = 'USD');

/*13. Show total revenue in year 2019 in chennai */

SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2019
        AND transactions.market_code = 'Mark002';
