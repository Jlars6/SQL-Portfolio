-- Project summary: Identify suspicious transactions from January 2024 in financial data using anomaly detection. 
-- Output should be a flagged dataset with potential fraud cases and supporting metrics.

CREATE TABLE transactions (
    Transaction_ID NUMBER(4) NOT NULL,
    Account_ID VARCHAR(4) NOT NULL,
    Transaction_Date DATE NOT NULL,
    Amount DECIMAL(10,2),
    Transaction_Type VARCHAR(16),
    Merchant VARCHAR(30),
    TX_Location VARCHAR(30),
    Fraud_Flag NUMBER(1) NOT NULL,    
    CONSTRAINT transactions_pk PRIMARY KEY (Transaction_ID)
);

INSERT ALL
    INTO transactions (
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Amount,
    Transaction_Type,
    Merchant,
    TX_Location,
    Fraud_Flag
    )
    VALUES (
    1001,
    'A123',
    '01-15-2024',
    1500.00,
    'Purchase',
    'LuxuryCars Inc',
    'New York, NY',
    0
    )
    INTO transactions (
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Amount,
    Transaction_Type,
    Merchant,
    TX_Location,
    Fraud_Flag
    )
    VALUES (
    1002,
    'A123',
    '01-16-2024',
    10000.00,
    'Withdrawal',
    'ATM',
    'Los Angeles, CA',
    1
    )
    INTO transactions (
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Amount,
    Transaction_Type,
    Merchant,
    TX_Location,
    Fraud_Flag
    )
    VALUES (
    1003,
    'A456',
    '01-18-2024',
    20.00,
    'Purchase',
    'Coffee Shop',
    'Seattle, WA',
    0
    )
    INTO transactions (
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Amount,
    Transaction_Type,
    Merchant,
    TX_Location,
    Fraud_Flag
    )
    VALUES (
    1004,
    'A789',
    '01-23-2024',
    5000.00,
    'Wire Transfer',
    'NA',
    'Miami, FL',
    1
    )
    INTO transactions (
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Amount,
    Transaction_Type,
    Merchant,
    TX_Location,
    Fraud_Flag
    )
    VALUES (
    1005,
    'A123',
    '01-22-2024',
    750.00,
    'Purchase',
    'Jewelry Mart',
    'Chicago, IL',
    0
    )
SELECT * FROM DUAL;

CREATE TABLE Account_Details (
    Account_ID VARCHAR(4) NOT NULL,
    Customer_Name VARCHAR(50) NOT NULL,
    Account_Type VARCHAR(20) NOT NULL,
    Account_Open_Date DATE NOT NULL,
    Credit_Limit DECIMAL(14,2),
    Region VARCHAR(16),
    CONSTRAINT acct_details_pk PRIMARY KEY (Account_ID)
);

INSERT ALL
    INTO Account_Details (
    Account_ID,
    Customer_Name,
    Account_Type,
    Account_Open_Date,
    Credit_Limit,
    Region
    )
    VALUES (
    'A123',
    'John Doe',
    'Credit Card',
    '05-01-2020',
    15000.00,
    'East Coast'
    )
    INTO Account_Details (
    Account_ID,
    Customer_Name,
    Account_Type,
    Account_Open_Date,
    Credit_Limit,
    Region
    )
    VALUES (
    'A456',
    'Jane Smith',
    'Debit Card',
    '11-15-2019',
    0,
    'Pacific NW'
    )
    INTO Account_Details (
    Account_ID,
    Customer_Name,
    Account_Type,
    Account_Open_Date,
    Credit_Limit,
    Region
    )
    VALUES (
    'A789',
    'Robert Brown',
    'Savings',
    '06-30-2018',
    0,
    'Southeast'
    )
SELECT * FROM DUAL;

WITH Account_Stats AS (
    SELECT 
        Account_ID,
        ROUND(AVG(Amount),2) AS Avg_Amount,
        ROUND(STDDEV(Amount),2) AS Std_Dev_Amount
    FROM 
        Transactions
    GROUP BY 
        Account_ID
)
SELECT 
    t.Transaction_ID,
    t.Account_ID,
    t.Amount,
    a.Avg_Amount,
    a.Std_Dev_Amount,
    CASE 
        WHEN t.Amount > (a.Avg_Amount + 3 * a.Std_Dev_Amount) THEN 'Suspicious'
        ELSE 'Normal'
    END AS Transaction_Status
FROM 
    Transactions t
JOIN 
    Account_Stats a
ON 
    t.Account_ID = a.Account_ID;
    
-- Results: no suspicious activity found within data and account activity.