-- Project summary: create a table for, and analyze 2024 sales trends for a mid-size Vegan makeup company and answer below questions.
 
-- 1. Which product categories performed the best over the year? 
-- 2. Are there any seasonal trends in sales?
-- 3. How do "New" vs. "Returning" customers contribute to overall sales? What is the average order value (AOV) for different customer types?
-- 4. Which regions are driving the highest revenue, and through which sales channels?
-- 5. Are there products that are underperforming despite being priced higher? What is the gross margin for the top-selling products?

CREATE TABLE makeup_sales(
    order_ID NUMBER(3) NOT NULL,
    sales_date DATE NOT NULL,
    product_name VARCHAR(30) NOT NULL,
    product_category VARCHAR(15) NOT NULL,
    units_sold NUMBER(4),
    unit_price DECIMAL(10,2) NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,
    region VARCHAR(10) NOT NULL,
    channel VARCHAR(10) NOT NULL,
    customer_type VARCHAR(10) NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY (order_ID)
);

INSERT ALL
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        101,
        '01-05-2024',
        'Vegan Lipstick',
        'Makeup',
        100,
        20.00,
        2000.00,
        'East',
        'Online',
        'New'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        102,
        '02-14-2024',
        'Vegan Eyeliner',
        'Makeup',
        150,
        15.00,
        2250.00,
        'West',
        'Retail',
        'Returning'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        103,
        '03-10-2024',
        'Cruelty-Free Moisturizer',
        'Skincare',
        200,
        30.00,
        6000.00,
        'Central',
        'Online',
        'New'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        104,
        '04-22-2024',
        'Vegan Foundation',
        'Makeup',
        50,
        25.00,
        1250.00,
        'South',
        'Retail',
        'Returning'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        105,
        '05-30-2024',
        'Natural Hair Serum',
        'Haircare',
        75,
        35.00,
        2625.00,
        'East',
        'Online',
        'New'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        106,
        '06-12-2024',
        'Vegan Lip Balm',
        'Skincare',
        300,
        10.00,
        3000.00,
        'North',
        'Online',
        'Returning'
    )
    INTO makeup_sales (
        order_ID,
        sales_date,
        product_name,
        product_category,
        units_sold,
        unit_price,
        revenue,
        region,
        channel,
        customer_type
    )
    VALUES (
        107,
        '07-18-2024',
        'Cruelty-Free Shampoo',
        'Haircare',
        250,
        15.00,
        3750.00,
        'West',
        'Retail',
        'Returning'
    )
SELECT * FROM DUAL;

-- Solution 1, data to be represented as a Bar Chart:
SELECT 
    product_category, 
    product_name, 
    SUM(revenue) AS Total_Revenue 
FROM 
    makeup_sales
GROUP BY 
    product_category, product_name
ORDER BY 
    Total_Revenue DESC;
    
-- Solution 2: data to be represented as a Line Chart:
SELECT 
    sales_date AS Month, 
    SUM(revenue) AS Monthly_Revenue 
FROM 
    makeup_sales
GROUP BY 
    sales_date
ORDER BY 
    sales_date;

-- Solution 3, data to be represented as a Pie Chart:
SELECT 
    customer_type, 
    COUNT(DISTINCT order_ID) AS Orders, 
    SUM(revenue) AS Total_Revenue, 
    ROUND(AVG(revenue),2) AS Average_Order_Value 
FROM 
    makeup_sales
GROUP BY 
    customer_type;
    
-- Solution 4, data to be represented as a Stacked Bar Chart:
SELECT 
    region, 
    channel, 
    SUM(revenue) AS Total_Revenue 
FROM 
    makeup_sales
GROUP BY 
    region, channel
ORDER BY 
    Total_Revenue DESC;
    
-- Solution 5, data to be represented as a Scatter Plot:
SELECT 
    product_category, 
    SUM(revenue) AS Total_Revenue, 
    SUM(unit_price) AS Total_Cost, 
    ROUND((SUM(revenue) - SUM(unit_price)) / SUM(revenue) * 100, 2) AS Gross_Margin 
FROM 
    makeup_sales
GROUP BY 
    product_category
ORDER BY 
    Gross_Margin ASC;
