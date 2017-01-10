
CREATE FUNCTION Total_bill 
RETURNS int  
AS  
BEGIN
    DECLARE @Total int, 
       
 
    SELECT 
    
    @Total = SUM(Doctor_fee.consultationFee,Doctor_fee.feePerCall,Drug_fee.drugPrice,Test_fee.testFee,Scan_fee.scanFee,Surgury_fee.surguryFee,Room_fee.roomPrice) AS 'Total'  
    FROM BILLS AS    
    INNER JOIN R_doctorConsultfee ON BILLS.invoiceID = Doctor_fee.invoiceID
    INNER JOIN OC_doctorconsultfee ON BILLS.invoiceID = Doctor_fee.invoiceID
    INNER JOIN Drug_fee ON BILLS.invoiceID = Drug_fee.invoiceID  
    INNER JOIN Test_fee ON BILLS.invoiceID = Test_fee.invoiceID  
    INNER JOIN Scan_fee ON BILLS.invoiceID = Scan_fee.invoiceID
    INNER JOIN Surgury_fee ON BILLS.invoiceID = Surgury_fee.invoiceID  
    INNER JOIN Room_fee ON BILLS.invoiceID = Room_fee.invoiceID
    
    RETURN @Total
END 


--GETTING VALUE FROM THE R_doctorConsultfee--

SELECT consultationFee FROM R_doctorConsultfee 
where 


--GETTING VALUE FROM THE OC_doctorconsultfee--

SELECT consultationFee,feeperCall FROM OC_doctorconsultfee 
where 


--GETTING VALUE FROM THE Drug_fee--

SELECT SUM(drugPrice) FROM Drug_fee 
where startDate Between /*user input*/ and /*user input + 30 days */
AND paymentStatus = 'Y' AND admittedTransaction = 'N'

--GETTING VALUE FROM THE Test_fee--

SELECT  SUM(testFee) FROM Test_fee 
where testDate Between /*user input*/ and /*user input + 30 days */
AND paymentStatus = 'Y' AND admittedTransaction = 'N'


--GETTING VALUE FROM THE Scan_fee--

SELECT  SUM(scanFee) FROM Scan_fee 
where scanDate Between /*user input*/ and /*user input + 30 days */
AND paymentStatus = 'Y' AND admittedTransaction = 'N'


--GETTING VALUE FROM THE surgeryFee--

SELECT  SUM(surgeryFee) FROM Surgery_fee 
where /*date*/ Between /*user input*/ and /*user input + 30 days */
AND paymentStatus = 'Y' AND admittedTransaction = 'N'


SELECT  SUM(roomPrice) FROM Room_fee 
where /*date*/ Between /*user input*/ and /*user input + 30 days */
AND paymentStatus = 'Y' AND admittedTransaction = 'N'

--------------------------functions-------------------------------------
CREATE FUNCTION drugIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfDrugPrice money;
     @sumOfDrugPrice =  SELECT SUM(drugPrice) FROM Drug_fee 
                        where startDate Between @date1 and @date2
                        AND paymentStatus = 'Y' AND admittedTransaction = 'N'
    RETURNS @sumOfDrugPrice
END

CREATE FUNCTION drugIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfDrugPrice money;
     @sumOfDrugPrice =  SELECT  SUM(testFee) FROM Test_fee 
                        where testDate Between @date1 and @date2
                        AND paymentStatus = 'Y' AND admittedTransaction = 'N'

    RETURNS @sumOfDrugPrice
END

