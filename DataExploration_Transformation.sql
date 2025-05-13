--====================== Check dupplicates:
Select cc.CustomerId, Count(cc.CustomerID)
From CustomerChurn cc
Group By cc.CustomerId
Having Count(cc.CustomerID) > 1;

---> There is no dupplicate.

--====================== Check NULL values:
Select 
    SUM(Case When cc.CustomerId IS NULL Then 1 Else 0 End) as null_CustomerId,
    SUM(Case When cc.Age IS NULL Then 1 Else 0 End) AS null_Age,
    SUM(Case When cc.Gender IS NULL Then 1 Else 0 End) AS null_Gender,
    SUM(Case When cc.Married IS NULL Then 1 Else 0 End) AS null_Married,
    SUM(Case When cc.Dependents IS NULL Then 1 Else 0 End) AS null_Dependents,
    SUM(Case When cc.City IS NULL Then 1 Else 0 End) AS null_City,
    SUM(Case When cc.ZipCode IS NULL Then 1 Else 0 End) AS null_ZipCode,
    SUM(Case When cc.Latitude IS NULL Then 1 Else 0 End) AS null_Latitude,
    SUM(Case When cc.Longtitude IS NULL Then 1 Else 0 End) AS null_Longtitude,
    SUM(Case When cc.Referrals IS NULL Then 1 Else 0 End) AS null_Referrals,
    SUM(Case When cc.TenureInMonths IS NULL Then 1 Else 0 End) AS null_TenureInMonths,
    SUM(Case When cc.Offer IS NULL Then 1 Else 0 End) AS null_Offer,
    SUM(Case When cc.PhoneService IS NULL Then 1 Else 0 End) AS null_PhoneService,
    SUM(Case When cc.AvgMonthlyLongDistanceCharges IS NULL Then 1 Else 0 End) AS null_AvgMonthlyLongDistanceCharges,
    SUM(Case When cc.MultipleLines IS NULL Then 1 Else 0 End) AS null_MultipleLines,
    SUM(Case When cc.InternetService IS NULL Then 1 Else 0 End) AS null_InternetService,
    SUM(Case When cc.InternetType IS NULL and cc.InternetService IS NOT NULL Then 1 Else 0 End) AS null_InternetType,
    SUM(Case When cc.AvgMonthlyGBDownload IS NULL Then 1 ELSE 0 End) AS null_AvgMonthlyGBDownload,
    SUM(Case When cc.OnlineSecurity IS NULL Then 1 Else 0 End) AS null_OnlineSecurity,
    SUM(Case When cc.OnlineBackup IS NULL Then 1 Else 0 End) AS null_OnlineBackup,
    SUM(Case When cc.DeviceProtectionPlan IS NULL Then 1 Else 0 End) AS null_DeviceProtectionPlan,
    SUM(Case When cc.PremiumTechSupport IS NULL Then 1 Else 0 End) AS null_PremiumTechSupport,
    SUM(Case When cc.StreamingTV IS NULL Then 1 Else 0 End) AS null_StreamingTV,
    SUM(Case When cc.StreamingMovies IS NULL Then 1 Else 0 End) AS null_StreamingMovies,
    SUM(Case When cc.StreamingMusic IS NULL Then 1 Else 0 End) AS null_StreamingMusic,
    SUM(Case When cc.UnlimitedData IS NULL Then 1 Else 0 End) AS null_UnlimitedData,
    SUM(Case When cc.Contract IS NULL Then 1 Else 0 End) AS null_Contract,
    SUM(Case When cc.PaperlessBilling IS NULL Then 1 Else 0 End) AS null_PaperlessBilling,
    SUM(Case When cc.PaymentMethod IS NULL Then 1 Else 0 End) AS null_PaymentMethod,
    SUM(Case When cc.MonthlyCharge IS NULL Then 1 Else 0 End) AS null_MonthlyCharge,
    SUM(Case When cc.TotalCharges IS NULL Then 1 Else 0 End) AS null_TotalCharges,
    SUM(Case When cc.TotalRefunds IS NULL Then 1 Else 0 End) AS null_TotalRefunds,
	SUM(Case When cc.TotalExtraDataCharges IS NULL Then 1 Else 0 End) AS null_TotalExtraDataCharges,
	SUM(Case When cc.TotalLongDistanceCharges IS NULL Then 1 Else 0 End) AS null_TotalLongDistanceCharges,
	SUM(Case When cc.TotalRevenue IS NULL Then 1 Else 0 End) AS null_TotalRevenue,
	SUM(Case When cc.CustomerStatus IS NULL Then 1 Else 0 End) AS null_CustomerStatus,
	SUM(Case When cc.ChurnCategory IS NULL and cc.CustomerStatus = 'Churned' Then 1 Else 0 End) AS null_ChurnCategory,
	SUM(Case When cc.ChurnReason IS NULL and cc.CustomerStatus = 'Churned' Then 1 Else 0 End) AS null_ChurnReason
FROM CustomerChurn cc;

--====================== Show lists of values:
Select distinct Gender from CustomerChurn;

Select distinct Married from CustomerChurn;

Select distinct City from CustomerChurn order by City;

Select distinct Offer from CustomerChurn;

Select distinct PhoneService from CustomerChurn;

Select distinct MultipleLines from CustomerChurn;

Select distinct InternetService from CustomerChurn;

Select distinct InternetType from CustomerChurn;

Select distinct OnlineSecurity from CustomerChurn;

Select distinct OnlineBackup from CustomerChurn;

Select distinct DeviceProtectionPlan from CustomerChurn;

Select distinct PremiumTechSupport from CustomerChurn;

Select distinct StreamingTV from CustomerChurn;

Select distinct StreamingMovies from CustomerChurn;

Select distinct StreamingMusic from CustomerChurn;

Select distinct UnlimitedData from CustomerChurn;

Select distinct Contract from CustomerChurn;

Select distinct PaperlessBilling from CustomerChurn;

Select distinct PaymentMethod from CustomerChurn;

Select distinct CustomerStatus from CustomerChurn;

Select distinct ChurnCategory from CustomerChurn;

Select distinct ChurnReason from CustomerChurn;

------ Check records that have InternetService = 'Yes' but InternetType IS NULL:
Select * From CustomerChurn Where InternetService = 'Yes' and InternetType IS NULL;
--> There is no record


--====================== Transform data
--------- Update NULL values of 'Yes/No' fields to 'No'
Update CustomerChurn Set MultipleLines = 'No' Where MultipleLines IS NULL;

Update CustomerChurn Set OnlineSecurity = 'No' Where OnlineSecurity IS NULL;

Update CustomerChurn Set OnlineBackup = 'No' Where OnlineBackup IS NULL;

Update CustomerChurn Set DeviceProtectionPlan = 'No' Where DeviceProtectionPlan IS NULL;

Update CustomerChurn Set PremiumTechSupport = 'No' Where PremiumTechSupport IS NULL;

Update CustomerChurn Set StreamingTV = 'No' Where StreamingTV IS NULL;

Update CustomerChurn Set StreamingMovies = 'No' Where StreamingMovies IS NULL;

Update CustomerChurn Set StreamingMusic = 'No' Where StreamingMusic IS NULL;

Update CustomerChurn Set UnlimitedData = 'No' Where UnlimitedData IS NULL;

Select * from CustomerChurn