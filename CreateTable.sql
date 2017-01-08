-- DATABASE 

-- The following code executes the Create Table Statements for Hospital DBMS Developed by : 

-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID : < 10569221 > Name : Mohamed Ikhwan Ibrahim
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :




-- Creation Order  = 1.Department > 2.Facilities > 3.AvailableFacilities > 
				  -- 4.Patient > 5.EmployeeType > 6.Employee >
				  -- 7.Resident_Doctor > 8.OnCall_Doctor > 9.Bill
				  -- 10.MHConsultation > 11.Illness > 12.MHConsultation_Illness
				  -- 12.Symptoms > 13.MHConsultation_Symptoms > 14.Drugs
				  -- 15.MH_Prescription > 16.RoomType > 17.Room >
				  -- 18.MH_Admissions > 19.Test > 20. MHTest > 
				  -- 21.Scan > 22. MHScan > 23. Surgery > 24. MH_Surgery TEST


CREATE TABLE DEPARTMENT (
		departmentID 		int ,
		departmentName 		varchar(50) UNIQUE,
		departmentLocation	varchar(20),
		description 		varchar(255),
		CONSTRAINT pk_departmentID PRIMARY KEY (departmentID)
);

/*Facilities Table */
CREATE TABLE FACILITIES (
		facilityID 				int,
		facilityName			varchar(100),
		facilityDescription		varchar(80),
		CONSTRAINT pk_facilityID PRIMARY KEY (facilityID)
	
);

/*AvailableFacilities Table */
CREATE TABLE AVAILABLEFACILITIES(
		departmentID 			int,
		facilityID 				int,
		CONSTRAINT pk_availableFacilityID PRIMARY KEY (departmentID,facilityID),
		CONSTRAINT fk_facilitiesDepartment FOREIGN KEY (departmentID) REFERENCES DEPARTMENT(departmentID),
		CONSTRAINT fk_facilitiesFacilityID FOREIGN KEY (facilityID) REFERENCES FACILITIES(facilityID)
);

/*Patient Table */
CREATE TABLE PATIENT (
		patientID 		int,
		NIC				varchar(10) UNIQUE,
		passportNumber	varchar(10) DEFAULT NULL,
		firstName 		varchar(50),
		middleName 		varchar(50),
		lastName 		varchar(50),
		age 			int,
		gender 			varchar(1) CHECK (gender IN ('m','f','M','F')), --
		addressline1 	varchar(40),
		addressline2 	varchar(40),
		addressline3 	varchar(40),
		DOB 			date,
		contactNo 		varchar(10),
		nextOfKin		varchar(160),
		nextofKinNo		varchar(10),
		patientStatus	varchar(20) CHECK (patientStatus IN('admitted','discharged','insurgery','scheduledforsurgery','deceased')),
		CONSTRAINT pk_patientID PRIMARY KEY (patientID)
);

/*EmployeeType Table */
CREATE TABLE EMPLOYEETYPE (
		employeeTypeID 	int,
		jobType			varchar(50),
		salary			money,
		prefix			varchar(2),
		description varchar(200),
		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeTypeID)

);

/*Employee Table */
CREATE TABLE EMPLOYEE (
		employeeTypeID 	int,
		employeeID		int,
		departmentID	int,
		firstName 		varchar(50),
		middleName 		varchar(50),
		lastName 		varchar(50),
		gender 			varchar(1) CHECK (gender IN ('m','f')),
		addressline1 	varchar(40),
		addressline2 	varchar(40),
		addressline3 	varchar(40),
		mobileNO 		varchar(10),
		homeNO 			varchar(10),
		joinDate		date,
		CONSTRAINT pk_employeeID PRIMARY KEY (employeeID),
		CONSTRAINT fk_employeeDepartmentID FOREIGN KEY (departmentID) REFERENCES DEPARTMENT(departmentID),
		CONSTRAINT fk_employeetypeID FOREIGN KEY (employeeTypeID) REFERENCES EMPLOYEETYPE(employeeTypeID)

);


-- /*acesslevel Table */
-- CREATE TABLE ACCESS_LEVEL (
--
-- 		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeTypeID)
--
-- );
--
-- CREATE TABLE ACCESS_LEVEL_EMPLOYEETYPE (
--
-- 		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeTypeID)
--
-- );

/*resident doctor table*/

CREATE TABLE RESIDENT_DOCTOR(
		RdoctorID int,
		employeeID	int,
		specialization varchar(200),
		consultationFee money,
		highestQualification varchar(20),
		seniority	varchar(20),		


		CONSTRAINT pk_residentDoctorID PRIMARY KEY (RdoctorID,employeeID),
		CONSTRAINT fk_residentDoctorEmployee FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)

		/*add the primary  and forign keys*/
);


/*oncall doctor table*/
CREATE TABLE ONCALL_DOCTOR(
		OCdoctorID int,
		employeeID	int,
		specialization varchar(200),
		consultationFee money,	
		feePerCall money,
		paymentDate date,
		highestQualification varchar(20),
		CONSTRAINT pk_onCallDoctorID PRIMARY KEY (OCdoctorID,employeeID),
		CONSTRAINT fk_ FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)

		/*add the primary and forign keys*/
);


/*bill Table */
CREATE TABLE BILL (
		invoiceID 			int,
		patientID 			int,
		paymentMethod		varchar(10) CHECK ( paymentMethod IN ('cash','visa','mastercard')),
		total				money,
		paymentStatus int DEFAULT '0' CHECK (paymentStatus IN (0,1)),
		CONSTRAINT pk_billing PRIMARY KEY (invoiceID),
		CONSTRAINT fk_patientBillID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
);

	

/*medical history consultation table*/
 CREATE TABLE MH_CONSULTATION(
		invoiceID			int,
		consultationID 		int,
		employeeID			int,
		RdoctorID 			int,
		COdoctorID 			int,
		patientID 			int,
		consultationDate 	date,
		nextCheckUp 		date,
		doctorReport 		varchar(255),
		paymentStatus 		int DEFAULT '0' CHECK (paymentStatus IN (0,1)),
		CONSTRAINT pk_mhconsultationID PRIMARY KEY (invoiceID,consultationID),
		CONSTRAINT fk_consultationInvoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_consultationRDoctorid FOREIGN KEY (RdoctorID,employeeID) REFERENCES RESIDENT_DOCTOR(RdoctorID,employeeID),
		CONSTRAINT fk_consultationOCDoctorid FOREIGN KEY (COdoctorID,employeeID) REFERENCES ONCALL_DOCTOR(OCdoctorID,employeeID)
		
);



/*Create Illness Table */
CREATE TABLE ILLNESS (
		illnessID 		int,
		illnessName  	varchar,
		illnessDescription varchar(255),

		CONSTRAINT pk_illnessID PRIMARY KEY (illnessID)

		--PRIMARY KEY == illnessID
        --FOREIGN KEY == NONE
);


/*illness consultation table */
CREATE TABLE MHCONSULTATION_ILLNESS(
		consultationID int,
		invoiceID int,
		illnessID int,
		
		CONSTRAINT pk_consultationIllness PRIMARY KEY (illnessID,consultationID),
		CONSTRAINT fk_illnessMHillness FOREIGN KEY (illnessID) REFERENCES ILLNESS(illnessID),
		CONSTRAINT fk_consultationMHillness FOREIGN KEY (consultationID,invoiceID) REFERENCES MH_CONSULTATION(invoiceID,consultationID)
		
);


/*medical hisory symptoms table */
CREATE TABLE SYMPTOMS(
		symptomID int,
		symptomName varchar(100),
		symptomDescription varchar(255),
		
		CONSTRAINT pk_symptomID PRIMARY KEY (symptomID),

);

/*medical hisory consultationsymptoms table */
CREATE TABLE MHCONSULTATION_SYMPTOMS(
		invoiceID int,
		consultationID int,
		symptomID int,
		CONSTRAINT pk_symptomIDconsultaionID PRIMARY KEY (symptomID,consultationID),
		CONSTRAINT fk_mhcondultationsymptomsymptomID FOREIGN KEY (symptomID) REFERENCES SYMPTOMS(symptomID),
		CONSTRAINT fk_mhcunsultationsymptomsconsultation FOREIGN KEY (consultationID,invoiceID) REFERENCES MH_CONSULTATION(invoiceID,consultationID),
		CONSTRAINT fk_consultationMHsymptoms FOREIGN KEY (consultationID,invoiceID) REFERENCES MH_CONSULTATION(invoiceID,consultationID)

);


/*drugs table*/
CREATE TABLE DRUGS(
		drugID 		int,
		drugName 	varchar(255),
		drugCompany	varchar(100),
		drugPrice	money,
		drugPurpose varchar(200),
		legalClassification varchar(10),
		CONSTRAINT pk_drugID PRIMARY KEY (drugID)
);


/*mh prescription */
CREATE TABLE MH_PRESCRIPTION(
		consultationID int,
		invoiceID int,
		prescriptionID int,
		drugID int,
		startDate date,
		prescribedDuration varchar(200),
		prescribedDosage varchar(200),
		paymentStatus int DEFAULT '0' CHECK (paymentStatus IN (0,1)),

		CONSTRAINT pk_prescriptonID PRIMARY KEY (prescriptionID),
		CONSTRAINT fk_consultationMHPrescriptions FOREIGN KEY (consultationID,invoiceID) REFERENCES MH_CONSULTATION(invoiceID,consultationID),
		CONSTRAINT fk_drugID FOREIGN KEY (drugID) REFERENCES DRUGS(drugID)


);

-- /*mh consultaion prescription drug*/
-- CREATE TABLE MH_CONSULTAION_PRESCRIPTION(
-- 			prescriptionID int,
-- 			consultationID int,
-- 			CONSTRAINT pk_symptomIDconsultaionID PRIMARY KEY (consultationID,prescriptionID),
-- 			CONSTRAINT fk_mhconsultationprescriptionprescriptionID FOREIGN KEY (prescriptionID) REFERENCES MH_PRESCRIPTION(prescriptionID),
-- 			CONSTRAINT fk_mhconsultationprescriptionprescrioncinsultationID FOREIGN KEY (consultationID) REFERENCES MH_CONSULTATION(consultationID)

-- );

-- /*mh prescription drug*/
-- CREATE TABLE MH_PRESCRIPTION_DRUG(
-- 			drugID 		int,
-- 			prescriptionID int,
-- 			CONSTRAINT pk_prescriptiondrug PRIMARY KEY (drugID,prescriptionID)
-- );

CREATE TABLE ROOMTYPE(
		roomTypeID char CHECK (roomTypeID IN ('G','P','C','S','E')),
		description varchar(100),
		roomPrice money,

		CONSTRAINT pk_roomtypeid PRIMARY KEY (roomTypeID)
);

/*rooms table*/

 CREATE TABLE ROOM(
 		roomTypeID char,
 		roomID int,
  		bedID int,
  	 	status int DEFAULT '1' CHECK ( status IN (1,0)),
  	 	
  	 	
 		CONSTRAINT pk_roomid PRIMARY KEY (roomTypeID,roomID,bedID),
 		CONSTRAINT fk_invoiceID FOREIGN KEY (roomTypeID) REFERENCES ROOMTYPE(roomTypeID)
 
 );

/* MEDICAL HISTORY ADMISSION Table */
CREATE TABLE MH_ADMISSION (
		admissionID			int,
		invoiceID 			int,
		patientID 			int,
		roomTypeID 			char,
		roomID 				int,
		bedID 				int,
		admissionDate		date,
		dischargeDate		date,
		paymentStatus 		int DEFAULT '0' CHECK (paymentStatus IN (0,1)),
		treatmentAdvice 	varchar(255),
		initialCondition 	varchar(255),

		CONSTRAINT pk_admissionID PRIMARY KEY (admissionID),
		CONSTRAINT fk_admissionInvoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_admissionRoom FOREIGN KEY (roomTypeID,roomID,bedID) REFERENCES ROOM(roomTypeID,roomID,bedID),
		CONSTRAINT fk_admittedPatient FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
);


-- CREATE TABLE MH_ADMISSION_ROOM (
-- 		roomID int,
-- 		admissionID int,
-- 		CONSTRAINT pk_addmissionroom PRIMARY KEY (roomID,admissionID)
-- );

/*test table*/

CREATE TABLE TEST (
		testID int,
		testName varchar(50),
		testFee money,

		CONSTRAINT pk_testID PRIMARY KEY (testID)




);



/*medical histort test*/

CREATE TABLE MH_TEST (
		invoiceID int,
		patientID 			int,
		testID int,
		testDate date,
		testReport varchar (255),
		paymentStatus int DEFAULT '0' CHECK (paymentStatus IN (0,1)),
		CONSTRAINT pk_md_testID PRIMARY KEY (testID,invoiceID),
		CONSTRAINT fk_MHtestID FOREIGN KEY (testID) REFERENCES TEST(testID),
		CONSTRAINT fk_testInvoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_testPatient FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
);





);






/*MEDICAL HISTORY SCAN TABLE*/

CREATE TABLE SCAN(
		scanID int,
		scanName varchar (100),
		scanFee money,
		
		CONSTRAINT pk_scanID PRIMARY KEY (scanID)

);

CREATE TABLE MH_SCAN(

		invoiceID 		int,
		patientID 		int,
		scanID 			int,
		scanReport 		varchar (255),
		paymentStatus 	int DEFAULT '0' CHECK (paymentStatus IN (0,1)),
		
		CONSTRAINT pk_mhscanID PRIMARY KEY (invoiceID,scanID),
		CONSTRAINT fk_mhScanInvoice FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_scanPatient FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
);



CREATE TABLE SURGERY(
		surgeryID int,
		surgeryName varchar(50),
		surgeryFee money,
		surgeryDescription varchar (255),


		CONSTRAINT pk_surgeryID PRIMARY KEY (surgeryID)

);


CREATE TABLE MH_SURGERY(
		invoiceID			int,
		surgeryID 			int,
		patientID 			int,
		employeeID			int,
		RdoctorID 			int,
		COdoctorID 			int,
		timeScheduled		datetime,
		roomTypeID			char,
		roomID 				int,
		bedID				int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		timeOutOfSurgery 	datetime,
		timeInSurgery		time, -- IMPORTANT : Need to include calculated column to populate total time taken in surgery ( use AS keyword )
		preSurgeryNotes 	varchar(255),
		postSurgeryNotes 	varchar(255),
		surgeryReport		varchar(255),
		paymentStatus		int DEFAULT '0' CHECK (paymentStatus IN (0,1)),

		CONSTRAINT pk_mh_surgeryID PRIMARY KEY (invoiceID,surgeryID),
		CONSTRAINT fk_mh_surgeryinvoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_mh_surgerysurgery FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT fk_surgeryRDoctorid FOREIGN KEY (RdoctorID,employeeID) REFERENCES RESIDENT_DOCTOR(RdoctorID,employeeID),
		CONSTRAINT fk_surgeryOCDoctorid FOREIGN KEY (COdoctorID,employeeID) REFERENCES ONCALL_DOCTOR(OCdoctorID,employeeID),
		CONSTRAINT fk_surgeryPatient FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),

);


