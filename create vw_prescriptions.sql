create VIEW vw_prescriptions AS
SELECT a.patientID ,a.firstName ,a.lastName ,d.consultationID,d.consultationDate ,d.RdoctorID,d.OCdoctorID  , e.drugID,e.drugName , c.StartDate,c.prescribedDosage
FROM patient a , bill b , MH_prescription c , MH_consultation d , Drugs e
Where a.patientID = b.patientID AND 
b.invoiceID = c.invoiceID AND
b.invoiceID = d.invoiceID AND
c.drugID = e.drugID
group by a.patientID ,a.firstName ,a.lastName ,d.consultationID,d.consultationDate ,d.RdoctorID,d.OCdoctorID  , e.drugID,e.drugName , c.prescribedDosage


create VIEW vw_patientinsurgery AS
SELECT d.patientID , a.firstName, a.lastName, c.roomTypeID, c.roomID , c.SurgeryID ,e.surgeryName , c.timeScheduled, c.timeInSurgery ,c.timeOutOfSurgery, c.preSurgeryNotes , c.postSurgeryNotes, c.surgeryReport 
FROM  patient a , room b , MH_surgery c , bill d , surgery e , roomType f
where a.patientID = d.invoiceID AND
	  d.invoiceID = c.invoiceID AND
	  c.roomID = b.roomID AND
	  c.surgeryID = e.SurgeryID AND
	  f.roomTypeID = c.roomTypeID	
group by d.patientID,a.firstName, a.lastName,c.roomTypeID, c.roomID,c.SurgeryID ,e.surgeryName, c.timeScheduled, c.timeInSurgery,c.timeOutOfSurgery, c.preSurgeryNotes , c.postSurgeryNotes, c.surgeryReport 




		