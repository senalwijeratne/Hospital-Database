


SELECT SUM(a.consultationFee) FROM RESIDENT_DOCTOR a, MH_consultation b

where a.RdoctorID = b.RdoctorID AND consultationDate Between /*dadasda*/ and /* */ 
AND paymentStatus = 'Y' AND admittedTransaction = 'N'


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

CREATE FUNCTION ResidentDoctorIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfResidentDoctorIncome money;
    SET @sumOfResidentDoctorIncome =  (SELECT SUM(a.consultationFee) FROM RESIDENT_DOCTOR a, MH_consultation b
                                        where a.RdoctorID = b.RdoctorID AND b.consultationDate Between @date1 and @date2
                                        AND b.paymentStatus = 'Y' AND b.admittedTransaction = 'N')
    RETURN @sumOfResidentDoctorIncome
END

 
 
CREATE FUNCTION OnCallDoctorIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfOnCallDoctorIncome money;
    SET @sumOfOnCallDoctorIncome =  (SELECT SUM(a.consultationFee) FROM RESIDENT_DOCTOR a, MH_consultation b
                                        where a.RdoctorID = b.RdoctorID AND b.consultationDate Between @date1 and @date2
                                        AND b.paymentStatus = 'Y' AND b.admittedTransaction = 'N')
    RETURN @sumOfOnCallDoctorIncome
END

 
CREATE FUNCTION drugIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfDrugPrice money;
    SET @sumOfDrugPrice =  (SELECT SUM(drugPrice) FROM Drug_fee 
                        where startDate Between @date1 and @date2
                        AND paymentStatus = 'Y' AND admittedTransaction = 'N')
    RETURN @sumOfDrugPrice
END

CREATE FUNCTION TestIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfTestFee money;
    SET @sumOfTestFee =  (SELECT  SUM(testFee) FROM Test_fee 
                        where testDate Between @date1 and @date2
                        AND paymentStatus = 'Y' AND admittedTransaction = 'N')

    RETURN @sumOfTestFee
END



CREATE FUNCTION ScanIncomeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfScanFee money;
    SET @sumOfScanFee =  (SELECT  SUM(scanFee) FROM Scan_fee 
                        where scanDate Between @date1 and @date2
                        AND paymentStatus = 'Y' AND admittedTransaction = 'N')

    RETURN @sumOfScanFee
END



CREATE FUNCTION surgeryFeeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfsurgeryFee money;
    SET @sumOfsurgeryFee =  (SELECT  SUM(surgeryFee) FROM Surgery_fee 
                          where timeScheduled Between @date1  and @date1 
                          AND paymentStatus = 'Y' AND admittedTransaction = 'N')

    RETURN @sumOfsurgeryFee
END


CREATE FUNCTION roomFeeSummery
( @date1 date, @date2 date )
RETURNS money
AS
BEGIN
    declare @sumOfRoomFee money;
    SET @sumOfRoomFee =  (SELECT  SUM(totalRoomFee) FROM Room_fees 
                            where admissionDate Between @date1 and @date2
                            AND paymentStatus = 'Y' AND admittedTransaction = 'N')

    RETURN @sumOfRoomFee
END


