-- Project summary: provide real-world use cases for SQL within the DeFi industry. Create applicable sample tables and provide solutions to example requests.
-- Case #1: Transaction Transparency and Auditing.
-- Questions: 1) retrieve all completed transactions, sorted by timestamp. 2) Calculate the total amount of completed deposits in USD.

-- Case #2: Smart Contract Performance Tracking
-- Questions: 1) Identify the average execution of all active smart contracts. 2) Find the total gas used by smart contracts on Ethereum.

-- Case #3: Asset Tokenization Management
-- Questions: 1) Retrieve all tokenized real estate assets owned by owner_ID: 201. 2) Find the highest price paid for a tokenized asset in the transactions table. 

-- Case #4: Decentralized Finance (DeFi) Analytics
-- Questions: 1) Find the total volume of swaps in the transactions table for the Uniswap platform. 2) Retrieve the liquidity pool with the highest APR.


-- Transactions table for Case #: 1
CREATE TABLE transactions (
    transaction_id NUMBER(2) NOT NULL,
    user_id NUMBER(4) NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    status VARCHAR(16) NOT NULL,
    CONSTRAINT txid_pk PRIMARY KEY (transaction_id)
);
INSERT ALL 
    INTO transactions (
        transaction_id,
        user_id,
        amount,
        currency,
        timestamp,
        transaction_type,
        status
    )
    VALUES (
        1,
        101,
        500.00,
        'USD',
        (TO_TIMESTAMP('2024-12-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS')),
        'Deposit',
        'Complete'
    )
    INTO transactions (
        transaction_id,
        user_id,
        amount,
        currency,
        timestamp,
        transaction_type,
        status
    )
    VALUES (
        2,
        102,
        200.00,
        'EUR',
        (TO_TIMESTAMP('2024-12-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS')),
        'Withdrawal',
        'Complete'
    )
    INTO transactions (
        transaction_id,
        user_id,
        amount,
        currency,
        timestamp,
        transaction_type,
        status
    )
    VALUES (
        3,
        101,
        150.00,
        'USD',
        (TO_TIMESTAMP('2024-12-01 12:15:00', 'YYYY-MM-DD HH24:MI:SS')),
        'Transfer',
        'Pending'
    )
    INTO transactions (
        transaction_id,
        user_id,
        amount,
        currency,
        timestamp,
        transaction_type,
        status
    )
    VALUES (
        4,
        103,
        300.00,
        'GBP',
        (TO_TIMESTAMP('2024-12-01 13:45:00', 'YYYY-MM-DD HH24:MI:SS')),
        'Deposit',
        'Complete'
    )
    INTO transactions (
        transaction_id,
        user_id,
        amount,
        currency,
        timestamp,
        transaction_type,
        status
    )
    VALUES (
        5,
        104,
        400.00,
        'USD',
        (TO_TIMESTAMP('2024-12-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS')),
        'Withdrawal',
        'Failed'
    )
    SELECT * FROM DUAL;

-- Question 1 Solution:
SELECT transaction_id, user_id, amount, currency, timestamp
FROM transactions
WHERE status = 'Complete'
ORDER BY timestamp;

-- Question 2 Solution:
SELECT SUM(amount) AS Total_Amt
FROM transactions
WHERE currency = 'USD' AND transaction_type = 'Deposit' AND status = 'Complete';

-- Smart Contracts table for case #: 2
CREATE TABLE smart_contracts (
    contract_id NUMBER(2) NOT NULL,
    platform VARCHAR(16) NOT NULL,
    contract_type CHAR(16) NOT NULL,
    executions NUMBER(8) NOT NULL,
    avg_execution_time DECIMAL(6,2),
    gas_used NUMBER(20) NOT NULL,
    status CHAR(12) NOT NULL,
    CONSTRAINT contractID_pk PRIMARY KEY (contract_id)
);
INSERT ALL 
    INTO smart_contracts (
        contract_id,
        platform,
        contract_type,
        executions,
        avg_execution_time,
        gas_used,
        status
    )
    VALUES (
        1,
        'Ethereum',
        'Loan',
        250,
        0.15,
        20000,
        'Active'
    )
    INTO smart_contracts (
        contract_id,
        platform,
        contract_type,
        executions,
        avg_execution_time,
        gas_used,
        status
    )
    VALUES (
        2,
        'Polygon',
        'Swap',
        100,
        0.10,
        12000,
        'Inactive'
    )
    INTO smart_contracts (
        contract_id,
        platform,
        contract_type,
        executions,
        avg_execution_time,
        gas_used,
        status
    )
    VALUES (
        3,
        'Ethereum',
        'Loan',
        300,
        0.20,
        25000,
        'Active'
    )
    INTO smart_contracts (
        contract_id,
        platform,
        contract_type,
        executions,
        avg_execution_time,
        gas_used,
        status
    )
    VALUES (
        4,
        'Binance Smart',
        'Insurance',
        50,
        0.25,
        15000,
        'Active'
    )
    INTO smart_contracts (
        contract_id,
        platform,
        contract_type,
        executions,
        avg_execution_time,
        gas_used,
        status
    )
    VALUES (
        5,
        'Ethereum',
        'Staking',
        400,
        0.12,
        18000,
        'Inactive'
    )
    SELECT * FROM DUAL;
    
-- Question 1 Solution:
SELECT AVG(avg_execution_time) AS Avg_Execution_Time
FROM smart_contracts
WHERE status = 'Active';

-- Question 2 Solution:
SELECT SUM(gas_used) AS Total_Gas
FROM smart_contracts
WHERE contract_type = 'Loan' AND platform = 'Ethereum';

-- Smart Contracts tables for case #: 3
CREATE TABLE tokenized_assets (
    asset_id NUMBER(3) NOT NULL,
    owner_id NUMBER(4) NOT NULL,
    asset_type VARCHAR(16) NOT NULL,
    value DECIMAL(8,2) NOT NULL,
    token_id VARCHAR(8) NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    CONSTRAINT assetid_pk PRIMARY KEY (asset_id)
);
INSERT ALL
    INTO tokenized_assets (
        asset_id,
        owner_id,
        asset_type,
        value,
        token_id,
        time_stamp
    )
    VALUES (
        1,
        201,
        'Real Estate',
        500000.00,
        'TKN101',
        (TO_TIMESTAMP('2024-11-30 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO tokenized_assets (
        asset_id,
        owner_id,
        asset_type,
        value,
        token_id,
        time_stamp
    )
    VALUES (
        2,
        202,
        'Artwork',
        150000.00,
        'TKN102',
        (TO_TIMESTAMP('2024-11-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO tokenized_assets (
        asset_id,
        owner_id,
        asset_type,
        value,
        token_id,
        time_stamp
    )
    VALUES (
        3,
        201,
        'Real Estate',
        300000.00,
        'TKN103',
        (TO_TIMESTAMP('2024-11-30 11:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO tokenized_assets (
        asset_id,
        owner_id,
        asset_type,
        value,
        token_id,
        time_stamp
    )
    VALUES (
        4,
        203,
        'Bond',
        100000.00,
        'TKN104',
        (TO_TIMESTAMP('2024-11-30 12:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO tokenized_assets (
        asset_id,
        owner_id,
        asset_type,
        value,
        token_id,
        time_stamp
    )
    VALUES (
        5,
        204,
        'Stock',
        75000.00,
        'TKN105',
        (TO_TIMESTAMP('2024-11-30 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    SELECT * FROM DUAL; 

CREATE TABLE token_transactions (
    transaction_id NUMBER(2) NOT NULL,
    token_id VARCHAR(8) NOT NULL,
    buyer_id NUMBER(4),
    seller_id NUMBER(4) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    CONSTRAINT tx_id_pk PRIMARY KEY (transaction_id)
);
INSERT ALL
    INTO token_transactions (
        transaction_id,
        token_id,
        buyer_id,
        seller_id,
        price,
        time_stamp
    )
    VALUES (
        1,
        'TKN101',
        301,
        201,
        550000.00,
        (TO_TIMESTAMP('2024-12-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO token_transactions (
        transaction_id,
        token_id,
        buyer_id,
        seller_id,
        price,
        time_stamp
    )
    VALUES (
        2,
        'TKN102',
        302,
        202,
        160000.00,
        (TO_TIMESTAMP('2024-12-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO token_transactions (
        transaction_id,
        token_id,
        buyer_id,
        seller_id,
        price,
        time_stamp
    )
    VALUES (
        3,
        'TKN103',
        303,
        201,
        320000.00,
        (TO_TIMESTAMP('2024-12-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO token_transactions (
        transaction_id,
        token_id,
        buyer_id,
        seller_id,
        price,
        time_stamp
    )
    VALUES (
        4,
        'TKN104',
        304,
        203,
        110000.00,
        (TO_TIMESTAMP('2024-12-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO token_transactions (
        transaction_id,
        token_id,
        buyer_id,
        seller_id,
        price,
        time_stamp
    )
    VALUES (
        5,
        'TKN105',
        305,
        204,
        80000.00,
        (TO_TIMESTAMP('2024-12-01 14:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
SELECT * FROM DUAL;

-- Question 1 Solution:
SELECT a.asset_id, a.owner_id, a.asset_type, a.token_id
FROM tokenized_assets a
WHERE asset_type = 'Real Estate' AND owner_id = 201;

-- Question 2 Solution:
SELECT MAX(price) AS Highest_Price
FROM token_transactions;

-- Smart Contracts tables for case #: 4
CREATE TABLE liq_pools (
    pool_id NUMBER(3) NOT NULL,
    platform VARCHAR(24) NOT NULL,
    token_pair VARCHAR(12) NOT NULL,
    total_liquidity DECIMAL(12,2) NOT NULL,
    volume_24h DECIMAL(12,2) NOT NULL,
    apr DECIMAL(6,2) NOT NULL,
    CONSTRAINT pool_pk PRIMARY KEY (pool_id)
);
INSERT ALL
    INTO liq_pools (
        pool_id,
        platform,
        token_pair,
        total_liquidity,
        volume_24h,
        apr
    )
    VALUES (
        1,
        'Uniswap',
        'ETH/USDC',
        1000000.00,
        500000.00,
        5.0
    )
    INTO liq_pools (
        pool_id,
        platform,
        token_pair,
        total_liquidity,
        volume_24h,
        apr
    )
    VALUES (
        2,
        'PancakeSwap',
        'BNB,USDT',
        800000.00,
        300000.00,
        4.5
    )
    INTO liq_pools (
        pool_id,
        platform,
        token_pair,
        total_liquidity,
        volume_24h,
        apr
    )
    VALUES (
        3,
        'Curve',
        'DAI/USDC',
        1200000.00,
        600000.00,
        6.0
    )
    INTO liq_pools (
        pool_id,
        platform,
        token_pair,
        total_liquidity,
        volume_24h,
        apr
    )
    VALUES (
        4,
        'SushiSwap',
        'BTC/ETH',
        1500000.00,
        700000.00,
        5.5
    )
    INTO liq_pools (
        pool_id,
        platform,
        token_pair,
        total_liquidity,
        volume_24h,
        apr
    )
    VALUES (
        5,
        'Uniswap',
        'LINK/ETH',
        600000.00,
        250000.00,
        4.0
    )
    SELECT * FROM DUAL;

CREATE TABLE liq_txn (
    transaction_id NUMBER(3) NOT NULL,
    pool_id NUMBER(3) NOT NULL,
    transaction_type CHAR(24) NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    CONSTRAINT transid_pk PRIMARY KEY (transaction_id)
);
INSERT ALL
    INTO liq_txn (
        transaction_id,
        pool_id,
        transaction_type,
        amount,
        time_stamp
    )
    VALUES (
       1,
       1,
       'Swap',
       10000.00,
       (TO_TIMESTAMP('2024-12-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO liq_txn (
        transaction_id,
        pool_id,
        transaction_type,
        amount,
        time_stamp
    )
    VALUES (
       2,
       2,
       'Add Liquidity',
       20000.00,
       (TO_TIMESTAMP('2024-12-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO liq_txn (
        transaction_id,
        pool_id,
        transaction_type,
        amount,
        time_stamp
    )
    VALUES (
       3,
       3,
       'Remove Liquidity',
       15000.00,
       (TO_TIMESTAMP('2024-12-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO liq_txn (
        transaction_id,
        pool_id,
        transaction_type,
        amount,
        time_stamp
    )
    VALUES (
       4,
       4,
       'Swap',
       30000.00,
       (TO_TIMESTAMP('2024-12-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    INTO liq_txn (
        transaction_id,
        pool_id,
        transaction_type,
        amount,
        time_stamp
    )
    VALUES (
       5,
       1,
       'Add Liquidity',
       50000.00,
       (TO_TIMESTAMP('2024-12-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    )
    SELECT * FROM DUAL;

-- Question 1 Solution:
SELECT SUM(l.amount) AS Total_Swap_Volume
FROM liq_pools p
INNER JOIN liq_txn l 
ON l.pool_id = p.pool_id
WHERE p.platform = 'Uniswap' AND l.transaction_type = 'Swap'; 

-- Question 2 Solution:
SELECT pool_id, platform, token_pair, apr
FROM liq_pools
WHERE apr = (SELECT MAX(apr) FROM liq_pools);