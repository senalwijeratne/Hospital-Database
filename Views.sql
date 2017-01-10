
    ----------------------------------- this works
   CREATE VIEW R_doctorConsultfee AS
   SELECT a.invoiceID, b.consultationID, c.patientID, e.RdoctorID, e.consultationFee, a.paymentStatus
   FROM bill a, MH_consultation b, patient c,  resident_doctor e
   
   WHERE a.invoiceID = b.invoiceID AND
     e.RdoctorID = b.RdoctorID AND
     c.patientID = a.patientID

     Group by a.invoiceID, b.consultationID, c.patientID, e.RdoctorID, e.consultationFee, a.paymentStatus
    -----------------------------------------------------------

     ----------------------------------- this works
   CREATE VIEW OC_doctorconsultfee AS
   SELECT a.invoiceID, b.consultationID, c.patientID, e.OCdoctorID, e.consultationFee, e.feeperCall, a.paymentStatus
   FROM bill a, MH_consultation b, patient c,  ONCALL_DOCTOR e
   WHERE a.invoiceID = b.invoiceID AND
     e.OCdoctorID = b.OCdoctorID AND
     c.patientID = a.patientID
   
   Group by a.invoiceID, b.consultationID, c.patientID, e.OCdoctorID, e.consultationFee, e.feeperCall, a.paymentStatus
     -----------------------------------------------------------



   
    ----------------------------------- added patient details/check if the patient id is correct
    CREATE VIEW Drug_fee AS
    SELECT MH_PRESCRIPTION.prescriptionID ,PATIENT.patientID,PATIENT.firstName,PATIENT.lastName,DRUGS.drugName ,DRUGS.drugCompany,DRUGS.drugPrice,DRUGS.drugPurpose,DRUGS.legalClassification,MH_PRESCRIPTION.consultationID ,MH_PRESCRIPTION.invoiceID,MH_PRESCRIPTION.drugID,MH_PRESCRIPTION.startDate,MH_PRESCRIPTION.prescribedDuration,MH_PRESCRIPTION.prescribedDosage,MH_PRESCRIPTION.paymentStatus
    FROM MH_PRESCRIPTION
    JOIN DRUGS ON MH_PRESCRIPTION.drugID = DRUGS.drugID
    JOIN BILL ON MH_PRESCRIPTION.invoiceID = BILL.invoiceID
    JOIN PATIENT ON BILL.patientID = PATIENT.patientID
    Group by PATIENT.patientID,PATIENT.firstName,PATIENT.lastName,DRUGS.drugName ,DRUGS.drugCompany,DRUGS.drugPrice,DRUGS.drugPurpose,DRUGS.legalClassification,MH_PRESCRIPTION.consultationID ,MH_PRESCRIPTION.invoiceID,MH_PRESCRIPTION.prescriptionID ,MH_PRESCRIPTION.drugID,MH_PRESCRIPTION.startDate,MH_PRESCRIPTION.prescribedDuration,MH_PRESCRIPTION.prescribedDosage,MH_PRESCRIPTION.paymentStatus
  -----------------------------------------------------------
 



    ----------------------------------- patient details added/check if the patient id is correct
    CREATE VIEW Test_fee AS
    SELECT MH_TEST.testID ,PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_TEST.testDate ,MH_TEST.testReport ,MH_TEST.paymentStatus,TEST.testName ,TEST.testFee, MH_TEST.invoiceID
    FROM MH_TEST 
    JOIN TEST ON MH_TEST.testID = TEST.testID
    JOIN BILL ON MH_TEST.invoiceID = BILL.invoiceID
    JOIN PATIENT ON BILL.patientID= PATIENT.patientID
     
     Group by PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_TEST.testID ,MH_TEST.testDate ,MH_TEST.testReport ,MH_TEST.paymentStatus,TEST.testName ,TEST.testFee, MH_TEST.invoiceID
    -----------------------------------------------------------


     ----------------------------------- this works BUT you need to add patient details/check if the patient id is correct
    CREATE VIEW Scan_fee AS
    SELECT MH_SCAN.scanID,PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_SCAN.invoiceID ,MH_SCAN.scanReport ,MH_SCAN.scanDate,MH_SCAN.paymentStatus,SCAN.scanName ,SCAN.scanFee
    FROM MH_SCAN 
    JOIN SCAN ON MH_SCAN.scanID = SCAN.scanID
    JOIN BILL ON MH_SCAN.invoiceID = BILL.invoiceID
    JOIN PATIENT ON BILL.patientID= PATIENT.patientID
    Group by PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_SCAN.invoiceID ,MH_SCAN.scanID ,MH_SCAN.scanReport ,MH_SCAN.scanDate,MH_SCAN.paymentStatus,SCAN.scanName ,SCAN.scanFee
     -----------------------------------------------------------


     ----------------------------------- this works BUT you need to add patient details/check if the patient id is correct
     CREATE VIEW Surgery_fee AS
     SELECT  MH_SURGERY.surgeryID,PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_SURGERY.invoiceID,SURGERY.surgeryName,SURGERY.surgeryFee,SURGERY.surgeryDescription,MH_SURGERY.employeeID,MH_SURGERY.RdoctorID,MH_SURGERY.OCdoctorID ,MH_SURGERY.timeScheduled,MH_SURGERY.RoomTypeID,MH_SURGERY.roomID ,MH_SURGERY.bedID,MH_SURGERY.timeOutOfSurgery,MH_SURGERY.timeInSurgery,MH_SURGERY.preSurgeryNotes ,MH_SURGERY.postSurgeryNotes,MH_SURGERY.surgeryReport,MH_SURGERY.paymentStatus
     FROM MH_SURGERY 
     JOIN SURGERY  ON MH_SURGERY.surgeryID = SURGERY.surgeryID
     JOIN BILL ON MH_SURGERY.invoiceID = BILL.invoiceID
     JOIN PATIENT ON BILL.patientID= PATIENT.patientID
     Group by PATIENT.patientID,PATIENT.firstName , PATIENT.lastName,MH_SURGERY.invoiceID,SURGERY.surgeryName,SURGERY.surgeryFee,SURGERY.surgeryDescription,MH_SURGERY.surgeryID,MH_SURGERY.employeeID,MH_SURGERY.RdoctorID,MH_SURGERY.OCdoctorID ,MH_SURGERY.timeScheduled,MH_SURGERY.RoomTypeID,MH_SURGERY.roomID ,MH_SURGERY.bedID,MH_SURGERY.timeOutOfSurgery,MH_SURGERY.timeInSurgery,MH_SURGERY.preSurgeryNotes ,MH_SURGERY.postSurgeryNotes,MH_SURGERY.surgeryReport,MH_SURGERY.paymentStatus
     -----------------------------------------------------------



     CREATE VIEW Room_fee AS
     SELECT PATIENT.patientID,MH_ADMISSION.invoiceID,PATIENT.firstName , PATIENT.lastName,ROOM.roomID,ROOM.bedID,ROOMTYPE.roomTypeID,ROOMTYPE.description,ROOMTYPE.roomPrice
     FROM ROOMTYPE 
     JOIN ROOM  ON ROOMTYPE.roomTypeID = ROOM.roomTypeID
     JOIN MH_ADMISSION ON ROOMTYPE.roomTypeID = MH_ADMISSION.roomTypeID
     JOIN BILL ON MH_ADMISSION.invoiceID = BILL.invoiceID
     JOIN PATIENT ON BILL.patientID= PATIENT.patientID

     Group by PATIENT.patientID,MH_ADMISSION.invoiceID,PATIENT.firstName , PATIENT.lastName,ROOM.roomID,ROOM.bedID,ROOMTYPE.roomTypeID,ROOMTYPE.description,ROOMTYPE.roomPrice

 /*   select * from Test_fee
CREATE VIEW Scan_fee AS
    SELECT *
      FROM MH_SCAN 
      INNER JOIN SCAN ON MH_SCAN.scanID = SCAN.scanID */  
/* CREATE VIEW Surgury_fee AS
    SELECT *
      FROM MH_SURGERY 
      INNER JOIN SURGERY  ON MH_SURGERY.surgeryID = SURGERY.surgeryID */
/* CREATE VIEW Room_fee AS
    SELECT *
      FROM ROOMTYPE 
      INNER JOIN ROOM  ON ROOMTYPE.roomTypeID = ROOM.roomTypeID
      INNER JOIN MH_ADMISSION ON ROOMTYPE.roomTypeID = MH_ADMISSION.roomTypeID */
      
      
     

