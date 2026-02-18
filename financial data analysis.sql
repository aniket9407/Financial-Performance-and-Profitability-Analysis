CREATE DATABASE finance_project;
USE finance_project;

CREATE TABLE financial_data (
    segment VARCHAR(50),
    country VARCHAR(50),
    product VARCHAR(50),
    discount_band VARCHAR(20),
    units_sold INT,
    manufacturing_price DECIMAL(10,2),
    sale_price DECIMAL(10,2),
    gross_sales DECIMAL(15,2),
    discounts DECIMAL(15,2),
    sales DECIMAL(15,2),
    cogs DECIMAL(15,2),
    profit DECIMAL(15,2),
    date DATE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/financial_sample.csv'
INTO TABLE financial_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM financial_data;

## TOTAL REVENUE
SELECT ROUND(SUM(sales),2) AS total_revenue FROM financial_data;

## TOTAL PROFIT
SELECT ROUND(SUM(profit),2) AS total_profit FROM financial_data;

## PROFIT MARGIN %
SELECT ROUND(SUM(profit) * 100 / SUM(sales),2) AS profit_margin_percent
FROM financial_data;

## TOTAL UNITS SOLD
SELECT SUM(units_sold) AS total_units_sold
FROM financial_data;

## HIGHEST REVENUE COUNTRY
SELECT country, ROUND(SUM(sales),2) AS revenue 
FROM financial_data
GROUP BY country
ORDER BY revenue DESC LIMIT 1;

## WORST DISCOUNT BAND
SELECT discount_band, ROUND(SUM(profit),2) AS profit
FROM financial_data
GROUP BY discount_band
ORDER BY profit limit 1;