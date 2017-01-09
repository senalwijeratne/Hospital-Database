
    
    
    
    CREATE VIEW Doctor_fee AS
    SELECT 			RESIDENT_DOCTOR.consultationFee,ONCALL_DOCTOR.consultationFee,ONCALL_DOCTOR.feePerCall,ONCALL_DOCTOR.paymentDate,MH_CONSULTATION.invoiceID,MH_CONSULTATION.patientID,
    MH_CONSULTATION.consultationDate,MH_CONSULTATION.nextCheckUp,MH_CONSULTATION.doctorReport,MH_CONSULTATION.paymentStatus 
    FROM MH_CONSULTATION 
    INNER JOIN RESIDENT_DOCTOR ON MH_CONSULTATION.RdoctorID = RESIDENT_DOCTOR.RdoctorID
    INNER JOIN ONCALL_DOCTOR ON MH_CONSULTATION.OCdoctorID  =  ONCALL_DOCTOR.OCdoctorID
    
    CREATE VIEW Drug_fee AS
    SELECT DRUGS.drugName ,DRUGS.drugCompany,DRUGS.drugPrice,DRUGS.drugPurpose,DRUGS.legalClassification,MH_PRESCRIPTION.consultationID ,MH_PRESCRIPTION.invoiceID,MH_PRESCRIPTION.prescriptionID ,MH_PRESCRIPTION.drugID,MH_PRESCRIPTION.startDate,MH_PRESCRIPTION.prescribedDuration,MH_PRESCRIPTION.prescribedDosage,MH_PRESCRIPTION.paymentStatuS
    FROM MH_PRESCRIPTION
    JOIN DRUGS ON MH_PRESCRIPTION.drugID = DRUGS.drugID
    
    CREATE VIEW Test_fee AS
    SELECT MH_TEST.patientID,MH_TEST.testID ,MH_TEST.testDate ,MH_TEST.testReport ,MH_TEST.paymentStatus,TEST.testName ,TEST.testFee, MH_TEST.invoiceID
    FROM MH_TEST 
    JOIN TEST ON MH_TEST.testID = TEST.testID



   CREATE VIEW Scan_fee AS
   SELECT MH_SCAN.patientID,MH_SCAN.invoiceID  ,MH_SCAN.scanID ,MH_SCAN.scanReport ,MH_SCAN.scanDate,MH_SCAN.paymentStatus,SCAN.scanName ,SCAN.scanFee
   FROM MH_SCAN 
   INNER JOIN SCAN ON MH_SCAN.scanID = SCAN.scanID
    

   CREATE VIEW Surgury_fee AS
   SELECT  MH_SURGERY.invoiceI,SURGERY.surgeryName,SURGERY.surgeryFee,SURGERY.surgeryDescription,MH_SURGERY.surgeryID ,MH_SURGERY.patientID,MH_SURGERY.employeeID,MH_SURGERY.RdoctorID,MH_SURGERY.COdoctorID ,MH_SURGERY.timeScheduled,MH_SURGERY.RoomTypeID,MH_SURGERY.roomID ,MH_SURGERY.bedID,MH_SURGERY.timeOutOfSurgery,MH_SURGERY.timeInSurgery,MH_SURGERY.preSurgeryNotes ,MH_SURGERY.postSurgeryNotes,MH_SURGERY.surgeryReport,MH_SURGERY.paymentStatus
   FROM MH_SURGERY 
   INNER JOIN SURGERY  ON MH_SURGERY.surgeryID = SURGERY.surgeryID


     CREATE VIEW Room_fee AS
     SELECT MH_ADMISSION.invoiceID,MH_ADMISSION.patientID,ROOMTYPE.roomTypeID,ROOMTYPE.description,ROOMTYPE.roomPrice,ROOM.roomID ,ROOM.bedID,ROOM.status
     FROM ROOMTYPE 
     INNER JOIN ROOM  ON ROOMTYPE.roomTypeID = ROOM.roomTypeID
     INNER JOIN MH_ADMISSION ON ROOMTYPE.roomTypeID = MH_ADMISSION.roomTypeID

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
