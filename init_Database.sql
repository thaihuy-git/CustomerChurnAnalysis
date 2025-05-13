--=========================================== CHECK EXISTING DATABASE and CREATE DATABASE
IF NOT EXISTS (
        SELECT 1
        FROM sys.databases
        WHERE name = 'TelecomCompany'
        )
BEGIN
    CREATE DATABASE TelecomCompany
END
GO

USE TelecomCompany
GO


--=========================================== CREATE TABLES
IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'CustomerChurn'
            AND type = 'U'
        )
BEGIN
    CREATE TABLE CustomerChurn (
        CustomerId VARCHAR(10),
        Gender VARCHAR(6),
		Age INT,
		Married VARCHAR(5),
		Dependents INT,
		City NVARCHAR(50),
		ZipCode INT,
		Latitude FLOAT,
		Longtitude FLOAT,
		Referrals INT,
		TenureInMonths INT,
		Offer NVARCHAR(50),
		PhoneService VARCHAR(5),
		AvgMonthlyLongDistanceCharges DECIMAL(10,2),
		MultipleLines VARCHAR(5),
		InternetService VARCHAR(5),
		InternetType NVARCHAR(50),
		AvgMonthlyGBDownload FLOAT,
		OnlineSecurity VARCHAR(5),
		OnlineBackup VARCHAR(5),
		DeviceProtectionPlan VARCHAR(5),
		PremiumTechSupport VARCHAR(5),
		StreamingTV VARCHAR(5),
		StreamingMovies VARCHAR(5),
		StreamingMusic VARCHAR(5),
		UnlimitedData VARCHAR(5),
		[Contract] NVARCHAR(100),
		PaperlessBilling VARCHAR(5),
		PaymentMethod NVARCHAR(50),
		MonthlyCharge DECIMAL(10,2),
		TotalCharges DECIMAL(20,2),
		TotalRefunds DECIMAL(20,2),
		TotalExtraDataCharges DECIMAL(20,2),
		TotalLongDistanceCharges DECIMAL(20,2),
		TotalRevenue DECIMAL(20,2),
		CustomerStatus VARCHAR(50),
		ChurnCategory NVARCHAR(100),
		ChurnReason NVARCHAR(500)
        );

	CREATE CLUSTERED COLUMNSTORE INDEX CustomerChurn_cci ON CustomerChurn;
END;

--============================== INSERT DATA INTO CustomerChurn TABLE
--User BULK INSERT statement to insert the dataset
BULK INSERT CustomerChurn
FROM 'D:\Projects\ChurnAnalysis\Data\telecom_customer_churn.csv'
WITH(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2
);

-- Check data
Select * from CustomerChurn;

select count(*) from CustomerChurn;

