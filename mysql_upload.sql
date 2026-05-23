CREATE DATABASE retail_analytics;

USE retail_analytics;
CREATE TABLE retail_transactions (
    CustomerID INT,
    ProductID VARCHAR(10),
    Quantity INT,
    Price FLOAT,
    TransactionDate DATETIME,
    PaymentMethod VARCHAR(50),
    StoreLocation VARCHAR(100),
    ProductCategory VARCHAR(100),
    DiscountApplied FLOAT,
    TotalAmount FLOAT,
    Month INT,
    Year INT,
    DayName VARCHAR(20)
)

for i, row in df.iterrows():

    values = (
        int(row['CustomerID']),
        row['ProductID'],
        int(row['Quantity']),
        float(row['Price']),
        row['TransactionDate'].to_pydatetime(),
        row['PaymentMethod'],
        row['StoreLocation'],
        row['ProductCategory'],
        float(row['DiscountApplied(%)']),
        float(row['TotalAmount']),
        int(row['Month']),
        int(row['Year']),
        row['DayName']
    )

    cursor.execute(sql, values)

conn.commit()

print("Data inserted successfully")
 
 SELECT ROUND(SUM(TotalAmount),2) AS Total_Revenue
FROM retail_transactions;

SELECT COUNT(*) AS Total_Orders
FROM retail_transactions;

SELECT ROUND(AVG(TotalAmount),2) AS Avg_Transaction
FROM retail_transactions;

SELECT ProductCategory,
       ROUND(SUM(TotalAmount),2) AS Revenue
FROM retail_transactions
GROUP BY ProductCategory
ORDER BY Revenue DESC;

SELECT StoreLocation,
       ROUND(SUM(TotalAmount),2) AS Revenue
FROM retail_transactions
GROUP BY StoreLocation
ORDER BY Revenue DESC;

SELECT PaymentMethod,
       COUNT(*) AS Total_Transactions
FROM retail_transactions
GROUP BY PaymentMethod
ORDER BY Total_Transactions DESC;

SELECT Month,
       ROUND(SUM(TotalAmount),2) AS Revenue
FROM retail_transactions
GROUP BY Month
ORDER BY Month;

SELECT CustomerID,
       ROUND(SUM(TotalAmount),2) AS Total_Spent
FROM retail_transactions
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;