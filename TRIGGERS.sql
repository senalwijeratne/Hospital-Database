-- Both work perfectly with single inserts, fucks up for batch inserts(will try to fix it)

CREATE TRIGGER whenPatientAdmittedTrigger 
ON mh_admission
AFTER INSERT 
AS
BEGIN
	declare @admissionDate date;
	select @admissionDate=i.admissionDate from inserted i;
	IF ( @admissionDate < getdate() )
	BEGIN
		UPDATE patient
			SET patientStatus='admitted'
			WHERE patientID=(SELECT patientID FROM BILL WHERE BILL.patientID=(SELECT invoiceID FROM INSERTED))
 
		UPDATE ROOM 
			SET status='Y'
			WHERE roomID=(SELECT roomID FROM INSERTED) AND bedID=(SELECT bedID FROM INSERTED)

		PRINT 'whenPatientAdmittedTrigger after insert trigger fired'
	END
 END
 GO
 
  ---------------------------------------------------------------------------- ---
 
CREATE TRIGGER whenPatientDischargedTrigger
ON mh_admission
AFTER INSERT 
AS
BEGIN
	declare @dischargeDate date;
	select @dischargeDate=i.dischargeDate from inserted i;
	IF ( @dischargeDate < getdate() )
	BEGIN
		UPDATE patient 
		SET patientStatus='discharged'
		WHERE patientID=(SELECT patientID FROM BILL WHERE BILL.patientID=(SELECT invoiceID FROM INSERTED))

		UPDATE ROOM 
		SET status='N'
		WHERE roomID=(SELECT roomID FROM INSERTED) AND bedID=(SELECT bedID FROM INSERTED)

		PRINT 'whenPatientDischargedTrigger after trigger is fired'
	END
END
GO

