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







