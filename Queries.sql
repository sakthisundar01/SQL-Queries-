----QUERIES

1)--- Renaming Column name
SELECT Phone_Number AS Mobile_Number 
FROM Cars24Customerdata;


2)--- Replacing the Empty records with 'NULL'
SELECT NULLIF(Selling_Price,'') AS 'Selling_Price'
FROM CARS24ID;


3)--- Concatinating first name and last name as fullname
Select First_Name + ' ' + Last_Name As FullName 
from Cars24CustomerData


4)--- Group by statement using Car_ID, Payment_ID with Aggregate function of MAX.
SELECT Car_ID, Payment_ID, Max(Amount_Paid) AS Max_Amount_Paid
FROM Cars24Payment
GROUP BY Car_ID, Payment_ID


5)--- Inner Join on Tables Cars24Customer and Cars24Payment, depending on Amount Paid with Names.
SELECT Cars24Customerdata.First_Name, Cars24Customerdata.Last_Name, Cars24Payment.Amount_Paid
FROM Cars24Customerdata
INNER JOIN Cars24Payment
ON Cars24Customerdata.Customer_ID = Cars24Payment.Customer_ID;


6)--- To Find out Top 20 Customers who have made the most Purchases with the Cars24
SELECT TOP 20 First_Name, COUNT(*) AS TotalPurchases 
FROM  Cars24Customerdata
GROUP BY First_Name
ORDER BY TotalPurchases DESC;


7)---Subqueries Showing Car_ID with the > order amount along side of aggregate function of Min Received Amount.
SELECT Car_ID, Order_Amount, Received_Amount
FROM Cars24OrderData
WHERE Order_Amount > (
  SELECT Min(Received_Amount)
  FROM Cars24OrderData
);

8)---Inner Join on Tables Cars24CustomerData and Cars24TestDrive, to display the location of the testdrive.
SELECT Cars24Customerdata.First_Name, Cars24Customerdata.Last_Name, Cars24Customerdata.Customer_City, Cars24TestDrive.Test_Drive_ID
FROM Cars24Customerdata
INNER JOIN Cars24TestDrive
ON Cars24Customerdata.Customer_ID = Cars24TestDrive.Customer_ID;


9)----Retrieve the Car_Model, Car_Model_Year, and Selling_Price of all cars that are currently available and have a Selling_Price greater than 300,000.
SELECT Car_Model, Car_Model_Year, Selling_Price 
FROM CARS24ID 
WHERE Status = 'Available' AND CAST(Selling_Price AS INT) > 300000;


10)----Retrieve the Car_Model, Car_Model_Year, and Owner of all cars that have been sold and were owned by customers who live in the city 'Mumbai'.
SELECT Car_Model, Car_Model_Year, Owner, Customer_City, [Status] 
FROM CARS24ID
INNER JOIN Cars24TestDrive ON CARS24ID.Car_ID = Cars24TestDrive.Car_ID
INNER JOIN Cars24Customerdata ON Cars24TestDrive.Customer_ID = Cars24Customerdata.Customer_ID
WHERE Status = 'Sold Out' AND Customer_City = 'Mumbai';


11)----Retrieve the details of all customers who have placed orders, but not yet verified their accounts, ordered by customer ID in ascending order:
SELECT Customer_ID, First_Name, Last_Name, Phone_Number, Customer_Address, Customer_City, Date_of_Birth, Gender
FROM Cars24Customerdata
WHERE Customer_Verified = 'Pending'
	AND Customer_ID IN (
		SELECT Customer_ID
		FROM Cars24OrderData
	)
ORDER BY Customer_ID ASC;


12)----Retrieve the Car_Model, Car_Model_Year, and Owner of all cars that have been sold and were owned by females.
SELECT Car_Model, Car_Model_Year, Owner 
FROM CARS24ID 
INNER JOIN Cars24TestDrive ON CARS24ID.Car_ID = Cars24TestDrive.Car_ID
INNER JOIN Cars24Customerdata ON Cars24TestDrive.Customer_ID = Cars24Customerdata.Customer_ID
WHERE [Status] = 'Sold Out' and Gender = 'Female';

