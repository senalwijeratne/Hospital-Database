create vw_prescriptions
SELECT a.patientID ,a.firstName ,a.lastName , b.invoiceID, c.prescriptionID , d.consultationID , e.drugID,e.drugName , c.prescribedDosage
FROM patient a , bill b , MH_prescriptions c , MH_consultations d , Drugs e
Where a.patientID = b.patientID AND 
b.invoiceID = c.invoiceID AND
b.invoiceID = d.invoiceID AND
c.drugID = e.drugID


create vw_patientinsurgery
SELECT a.patientID , a.firstName, a.lastName, b.roomID , c.SurgeryID ,c.surgeryName , c.timeScheduled, c.timeInSurgery ,c.timeOutOfSurgery, c.preSurgeryNotes , c.postSurgeryNotes, c.surgeryReport 
FROM  patient a , room b , MH_surgery c , bill d
where a.patientID = d.invoiceID AND
	  d.invoiceID = c.invoiceID AND
	  c.roomID = b.roomID


	  

		