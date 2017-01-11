
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

----------------------------------------------------------------------------

CREATE FUNCTION SurgeryDetailsWithinThePeriods
(@fDate DATETIME,@lDate DATETIME)
RETURNS TABLE
AS

    RETURN
    (SELECT * FROM MH_SURGERY 
    WHERE timeScheduled 
    BETWEEN @fDate AND @lDate)
	

SELECT  * FROM dbo.SurgeryDetailsWithinThePeriods('20170101 10:00:00 AM','20170101 11:00:00 AM');
    
--------------------------------------------------------------------------

CREATE FUNCTION MH_ScanDetailsWithinThePeriods
(@fDate DATE,@lDate DATE)
RETURNS TABLE
AS


    RETURN
    (SELECT * FROM MH_Scan 
    WHERE scanDate 
    BETWEEN  @fDate AND @lDate )

SELECT * FROM dbo.MH_ScanDetailsWithinThePeriods('20160101','20170301');
---------------------------------------------------------------------------     
   
CREATE FUNCTION MH_PrescriptionDetailsWithinThePeriods
(@fDate DATE,@lDate DATE)
RETURNS TABLE
AS
    RETURN
    (SELECT * FROM mh_Prescription 
    WHERE  startDate
    BETWEEN  @fDate AND @lDate) 

SELECT * FROM dbo.MH_PrescriptionDetailsWithinThePeriods('20160101','20170301');
     
     
-------------------------------------------------------------------------------

CREATE FUNCTION MH_consultationDetailsWithinThePeriods
(@fDate DATE,@lDate DATE)
RETURNS TABLE
AS
    RETURN
    (SELECT * FROM MH_consultation 
    WHERE  consultationDate
    BETWEEN  @fDate AND @lDate )

SELECT * FROM dbo.MH_consultationDetailsWithinThePeriods('20160101','20170301');
-------------------------------------------------------------------------------------

CREATE FUNCTION MH_TestDetailsWithinThePeriods
(@fDate DATE,@lDate DATE)
RETURNS TABLE
AS
    RETURN
    (SELECT * FROM MH_test 
    WHERE  testDate
    BETWEEN  @fDate AND @lDate) 

SELECT * FROM dbo.MH_TestDetailsWithinThePeriods('20160101','20170301');

-----------------------------------------------------------------------
CREATE FUNCTION MH_AdmissionDetailsWithinThePeriods
(@fDate DATE,@lDate DATE)
RETURNS TABLE
AS
    RETURN
    (SELECT * FROM MH_ADMISSION 
    WHERE  admissionDate
    BETWEEN  @fDate AND @lDate )

SELECT * FROM dbo.MH_AdmissionDetailsWithinThePeriods('20160101','20170301');
     
