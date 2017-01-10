create VIEW vw_prescriptions AS
SELECT a.patientID ,a.firstName ,a.lastName ,d.consultationID,d.consultationDate ,d.RdoctorID,d.OCdoctorID  , e.drugID,e.drugName , c.StartDate,c.prescribedDosage
FROM patient a , bill b , MH_prescription c , MH_consultation d , Drugs e
Where a.patientID = b.patientID AND 
b.invoiceID = c.invoiceID AND
b.invoiceID = d.invoiceID AND
c.drugID = e.drugID
group by a.patientID ,a.firstName ,a.lastName ,d.consultationID,d.consultationDate ,d.RdoctorID,d.OCdoctorID  , e.drugID,e.drugName,c.StartDate , c.prescribedDosage


create VIEW vw_patientinsurgery AS
SELECT d.patientID , a.firstName, a.lastName, c.roomTypeID, c.roomID ,c.RdoctorID,c.OCdoctorID, c.SurgeryID ,e.surgeryName , c.timeScheduled, c.timeInSurgery ,c.timeOutOfSurgery, c.preSurgeryNotes , c.postSurgeryNotes, c.surgeryReport 
FROM  patient a , room b , MH_surgery c , bill d , surgery e , roomType f
where a.patientID = d.invoiceID AND
	  d.invoiceID = c.invoiceID AND
	  c.roomID = b.roomID AND
	  c.surgeryID = e.SurgeryID AND
	  f.roomTypeID = c.roomTypeID	
group by d.patientID,a.firstName, a.lastName,c.roomTypeID, c.roomID,c.SurgeryID ,e.surgeryName, c.timeScheduled, c.timeInSurgery,c.timeOutOfSurgery, c.preSurgeryNotes , c.postSurgeryNotes, c.surgeryReport 

create VIEW vw_medicalHistory AS
SELECT  a.patientID ,a.firstName ,a.lastName ,d.consultationID,d.consultationDate ,d.RdoctorID,d.OCdoctorID  ,i.symptomName , g.illnessName ,g.illnessDescription, e.drugID,e.drugName , c.StartDate,c.prescribedDosage , k. testName , j.testDate , j.testReport , m.scanName ,l.scanDate ,l.scanReport ,o.surgeryName, o.surgeryDescription 
FROM patient a , bill b , MH_prescription c , MH_consultation d , Drugs e,MHCONSULTATION_ILLNESS f , illness g , MHCONSULTATION_SYMPTOMS h , symptoms i ,MH_TEST j , test k , MH_SCAN l ,  scan m , MH_SURGERY n,surgery o
Where a.patientID = b.patientID AND 
b.invoiceID = c.invoiceID AND
b.invoiceID = d.invoiceID AND
c.drugID = e.drugID AND
d.consultationID = f.consultationID AND
f.illnessID  = g.illnessID AND
d.consultationID = h.consultationID AND
h.symptomID = i.symptomID AND
b.invoiceID = j.invoiceID AND
j.testID = k.testID AND 
b.invoiceID = l.invoiceID AND
l.scanID = m.scanID AND
b.invoiceID = n.invoiceID AND
n.surgeryID = o.surgeryID






		