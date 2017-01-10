CREATE PROCEDURE HospitalIncomeCalculate(@FIRSTDATE  date,@SECONDDATE date)
AS BEGIN

declare @ResidentDoctorSummeryFull money;
declare @OnCallDoctorIncomeSummeryFull money;
declare @drugIncomeSummeryFull money;
declare @TestIncomeSummeryFull money;
declare @ScanIncomeSummeryFull money;
declare @surgeryFeeSummeryFull money;
declare @roomFeeSummeryFull money;

 SET @ResidentDoctorSummeryFull = dbo.ResidentDoctorIncomeSummery(@FIRSTDATE,@SECONDDATE);
 SET @OnCallDoctorIncomeSummeryFull = dbo.OnCallDoctorIncomeSummery(@FIRSTDATE,@SECONDDATE);
 SET @drugIncomeSummeryFull = dbo.drugIncomeSummery(@FIRSTDATE,@SECONDDATE);
 SET @TestIncomeSummeryFull = dbo.TestIncomeSummery(@FIRSTDATE,@SECONDDATE);
 SET @ScanIncomeSummeryFull = dbo.ScanIncomeSummery(@FIRSTDATE,@SECONDDATE);
 SET @surgeryFeeSummeryFull = dbo.surgeryFeeSummery(@FIRSTDATE,@SECONDDATE);
 SET @roomFeeSummeryFull = dbo.roomFeeSummery(@FIRSTDATE,@SECONDDATE);

    SELECT @ResidentDoctorSummeryFull AS ResidentDoctor,@OnCallDoctorIncomeSummeryFull AS OnCallDoctor,
            @drugIncomeSummeryFull AS PrescriptionIncomes,
            @TestIncomeSummeryFull AS TestIncomes,
            @ScanIncomeSummeryFull AS ScanIncomes,
            @surgeryFeeSummeryFull AS SurgeryFees,
            @roomFeeSummeryFull AS RoomFees;

END
    
CREATE PROCEDURE Insert_consultation(
    @invoiceID  int,
    @employeeID int,
    @RdoctorID int,
    @OCdoctorID int,    
    @consultationDate date, 
    @nextCheckUp    date,
    @doctorReport varchar,
    @paymentStatus int )
AS BEGIN

INSERT INTO MH_Consultation([invoiceID],[employeeID],[RdoctorID],[OCdoctorID],[consultationDate],[nextCheckUp],[doctorReport],[paymentStatus]) 
VALUES (@invoiceID,@employeeID,@RdoctorID,@OCdoctorID,@consultationDate,@nextCheckUp ,@doctorReport,@paymentStatus)

END


CREATE PROCEDURE Insert_prescription (
    @consultationID int,
		@invoiceID int,
		@prescriptionID int,
		@drugID int,
		@startDate date,
		@prescribedDuration varchar,
		@prescribedDosage varchar,
		@paymentStatus int )
AS BEGIN

INSERT INTO MH_PRESCRIPTION([invoiceID],[prescriptionID],[drugID],[startDate],[prescribedDuration],[prescribedDosage],[paymentStatus]) 
VALUES (@invoiceID,@prescriptionID,@drugID,@startDate,@prescribedDuration ,@prescribedDosage,@paymentStatus)

END


CREATE PROCEDURE MH_TEST_INPUT(
    @invoiceID	int,
    @testID int,
    @testDate date,,
    @testReport varchar ,	
    @paymentStatus int)
AS BEGIN

INSERT INTO MH_TEST([invoiceID],[testID],[testDate],[testReport],[paymentStatus]) 
VALUES (@invoiceID,@testID,@testDate,@testReport,@paymentStatus)

END


CREATE PROCEDURE MH_SCAN_INPUT(
    @invoiceID	int,
    @scanID int,
    @scanDate date,
    @scanReport varchar ,	
    @paymentStatus int)
AS BEGIN

INSERT INTO MH_SCAN([invoiceID],[scanID],[scanDate],[scanReport],[paymentStatus]) 
VALUES (@invoiceID,@scanID,@scanDate,@scanReport,@paymentStatus)

END







