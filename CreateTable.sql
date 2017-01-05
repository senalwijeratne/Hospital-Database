-- DATABASE 

-- The following code executes the Create Table Statements for Hospital DBMS Developed by : 

-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID : < 10569221 > Name : Mohamed Ikhwan Ibrahim
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :




-- Creation Order  = 1.Department > 2.Facilities > 3.AvailableFacilities > 
				  -- 4.Patient > 5.EmployeeType > 6.Employee >
				  -- 7.Doctor > 8.RoomType > 9.Room
				  -- 10.Drug > 11.Symptom > 12.Illness
				  -- 12.Surgery > 13.MedicalHistory > 14.Admission
				  -- 15.MedicalTestType > 16.MHSurgeries > 17.MHConsultation >
				  -- 18.MHSymptoms > 19.MHIllnesses > 20. MHDrugs > 
				  -- 21.MHMedicalTests > 22. MHMedicalScans > 23. Billing


CREATE TABLE DEPARTMENT (
		departmentID 		int ,
		departmentName 		varchar(50),
		description 		varchar(120),
		CONSTRAINT pk_departmentID PRIMARY KEY (departmentID)
);

/*Facilities Table */
CREATE TABLE FACILITIES (
		facilityID 				int,
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
		NIC				int UNIQUE,
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
		doctorID int,
		employeeID	int,
		specialization varchar(200),
		consultationFee money,
		highestQualification varchar(20),


		CONSTRAINT pk_residentDoctorID PRIMARY KEY (doctorID,employeeID),
		CONSTRAINT fk_residentDoctorEmployee FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)

		/*add the primary  and forign keys*/
);


/*oncall doctor table*/
CREATE TABLE ONCALL_DOCTOR(
		doctorID int,
		employeeID	int,
		consultationFee money,
		feePerCall money,
		paymentDate date,
		CONSTRAINT pk_onCallDoctorID PRIMARY KEY (doctorID,employeeID),
		CONSTRAINT fk_ FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)

		/*add the primary and forign keys*/
);





/*bill Table */
CREATE TABLE BILL (
		invoiceID 			int,
		patientID 			int,
		paymentMethod		varchar(10) CHECK ( paymentMethod IN ('cash','credit card','visa','mastercard')),
		total				money,
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_billing PRIMARY KEY (invoiceID),
		CONSTRAINT fk_PatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
);
--
-- STOPPED HERE. WORK. //Love,you.

/*medical history consulatation table*/
 CREATE TABLE MH_CONSULATAION(
		consulatationID int,
		invoiceID int,
		doctorID 			int,
		consulataionDate date,
		nextCheckUp date,
		doctorReport varchar(255),
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_mhconsultationID PRIMARY KEY (consulatationID),
		CONSTRAINT fk_invoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID)
		CONSTRAINT fk_rdoctorid FOREIGN KEY (doctorID) REFERENCES RESIDENT_DOCTOR(doctorID)
		CONSTRAINT fk_odoctorid FOREIGN KEY (doctorID) REFERENCES ONCALL_DOCTOR(doctorID)

);

/*medical history illndess table */
CREATE TABLE MH_ILLNESS(
		MHillnessID int,
		consulatationID int,
		illnessName varchar(100),
		illnessDescriptopn varchar(255),
		CONSTRAINT pk_mhillness PRIMARY KEY (MHillnessID),
		CONSTRAINT fk_consulatation FOREIGN KEY (consulatationID) REFERENCES MH_CONSULATAION(consulatationID)

);

/*illness consulataion table */
CREATE TABLE MH_CONSULTATION_ILLNESS(
		MHillnessID int,
		consulatationID int,
		CONSTRAINT pk_consulataionillnss PRIMARY KEY (MHillnessID,consulatationID),
		CONSTRAINT fk_consulataionillnessMHillness FOREIGN KEY (MHillnessID) REFERENCES MH_ILLNESS(MHillnessID),
		CONSTRAINT fk_consulataionillnessMHillness FOREIGN KEY (consulatationID) REFERENCES MH_CONSULATAION(consulatationID)
		

);



/*medical hisory symptoms table */
CREATE TABLE MH_SYMPTOMS(
		symptomID int,
		symptomName varchar(100),
		symptomDescriptopn varchar(255),
		CONSTRAINT pk_symptomID PRIMARY KEY (symptomID),



);

/*medical hisory consulatationsymptoms table */
CREATE TABLE MH_CONSULTATION_SYMPTOMS(
		symptomID int,
		consulatationID int,
		CONSTRAINT pk_symptomIDconsultaionID PRIMARY KEY (symptomID,consulatationID),
		CONSTRAINT fk_mhcondultationsymptomsymptomID FOREIGN KEY (symptomID) REFERENCES MH_SYMPTOMS(symptomID),
		CONSTRAINT fk_mhcunsultationsymptomsconsultation FOREIGN KEY (consulatationID) REFERENCES MH_CONSULATAION(consulatationID)
		



);



/*mh prescription */
CREATE TABLE MH_PRESCRIPTION(
		prescriptionID int,
		startDate date,
		prescribedDuration varchar(200),
		prescribedDousage varchar(200),
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_prescrionID PRIMARY KEY (prescriptionID)
);

/*mh consultaion prescription drug*/
CREATE TABLE MH_CONSULTAION_PRESCRIPTION(
			prescriptionID int,
			consulatationID int,
			CONSTRAINT pk_symptomIDconsultaionID PRIMARY KEY (consulatationID,prescriptionID),
			CONSTRAINT fk_mhconsultationprescriptionprescriptionID FOREIGN KEY (prescriptionID) REFERENCES MH_PRESCRIPTION(prescriptionID),
			CONSTRAINT fk_mhconsultationprescriptionprescrioncinsultationID FOREIGN KEY (consulatationID) REFERENCES MH_CONSULATAION(consulatationID)

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



/*mh prescription drug*/
CREATE TABLE MH_PRESCRIPTION_DRUG(
			drugID 		int,
			prescriptionID int,
			CONSTRAINT pk_prescriptiondrug PRIMARY KEY (drugID,prescriptionID)

);





CREATE TABLE ROOMTYPE(
		roomtTypeID int,
		bedID int,
		description varchar(100),
		roomPrice money,
		CONSTRAINT pk_roomtypeid PRIMARY KEY (roomtTypeID)
);

/*rooms table*/

 CREATE TABLE ROOM(
 		roomID int,
		roomtTypeID int,
  	bedID int,
  	status char(1) CHECK DEFAULT N ( status IN ('y','n','N','Y')),
 		CONSTRAINT pk_roomid PRIMARY KEY (roomtTypeID,roomID,bedID,),
 		CONSTRAINT fk_invoiceID FOREIGN KEY (roomtTypeID) REFERENCES ROOMTYPE(roomtTypeID)
 
 );

/* MEDICAL HISTORY ADMISSION Table */
CREATE TABLE MH_ADMISSION (
		admissionID			int,
		invoiceID int,
		bedID 				int,
		roomID int,
		roomtTypeID int,
		admissionDate		date,
		dischargeDate		date,
		paymentStatus boolean  DEFAULT 'FALSE',
		treatmentAdvice varchar(255),
		initialCondition varchar(255),
		CONSTRAINT pk_admissionID PRIMARY KEY (admissionID),
		CONSTRAINT fk_invoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_bedID FOREIGN KEY (bedID) REFERENCES ROOM(bedID),
		CONSTRAINT fk_admissionrooomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT fk_admissionroomtype FOREIGN KEY (roomtTypeID) REFERENCES ROOM(roomtTypeID)


);


CREATE TABLE MH_ADMISSION_ROOM (
		roomID int,
		admissionID int,
		CONSTRAINT pk_addmissionroom PRIMARY KEY (roomID,admissionID)
);



/*medical histort test*/

CREATE TABLE MH_TEST (
		mhTestID int,
		testID int,
		invoiceID int,
		testDate date,
		testReport varchar (255),
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_md_testID PRIMARY KEY (mhTestID),
		CONSTRAINT pk_testID FOREIGN KEY (testID) REFERENCES TEST(testID)





);


// table already exists
/*test table*/

CREATE TABLE TEST (
		testID int,
		testName varchar(50),
		testFee money,

		CONSTRAINT pk_testID PRIMARY KEY (testID)



);



// table already exists
/*MEDICAL HISTORY SCAN TABLE*/

CREATE TABLE MH_SCAN(

		mhscanID int,
		invoiceID int,
		scanReport varchar (255),
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_mhscanID PRIMARY KEY (mhscanID)


);

// table already exists
/*scan type table */

CREATE TABLE SCAN(
		scanID int,
		scanName varchar (100),
		scanFee money,
		CONSTRAINT pk_scanID PRIMARY KEY (scanID)

);


CREATE TABLE MH_SURGERY(
		mhsurgeryID int,
		surgeryID int,
		surguryDate int,
		invoiceID int,
		surguryReport varchar (255),
		paymentStatus boolean  DEFAULT 'FALSE',
		CONSTRAINT pk_mh_surgeryID PRIMARY KEY (mhsurgeryID),
		CONSTRAINT fk_mh_surguryinvoiceID FOREIGN KEY (invoiceID) REFERENCES BILL(invoiceID),
		CONSTRAINT fk_mh_surgury_surgury FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID)

);


CREATE TABLE SURGERY(
		surgeryID int,
		surguryName varchar(50),
		surguryFee money,
		surguryDescription varchar (255),
		CONSTRAINT pk_surgeryID PRIMARY KEY (surgeryID)

);

