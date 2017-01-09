
CREATE TRIGGER Check_Room_True FOR
AFTER UPDATE 
AS
BEGIN 
  

  IF (SELECT patientStatus FROM PATIENT )
  LIKE 'discharged%'
  BEGIN
    UPDATE ROOM
    SET status='N'
    WHERE patientID IN (SELECT patientID FROM INSERTED)
    AND
      BEGIN
        UPDATE BILL
        SET status='N'
        WHERE patientID IN (SELECT patientID FROM INSERTED)
      END
      
  END
  
  
CREATE TRIGGER When_PatientIsAdmitted ON whatTheShit.PATIENT
FOR	AFTER UPDATE
AS 
BEGIN
    SET NOCOUNT ON;
    If (SELECT patientStatus FROM INSERTED) LIKE 'admitt%'
    BEGIN
        UPDATE ROOM 
        SET Status='Y'
	WHERE patientID IN (SELECT patientID FROM INSERTED)
        AND
	UPDATE BILL 
        SET Status='Y'
	WHERE patientID IN (SELECT patientID FROM INSERTED)
    END 
END
