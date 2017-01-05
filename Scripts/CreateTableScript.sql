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

/* DROP TABLE Billing, MHMedicalScans, MHMedicalTests, MHDrugs, MHIllnesses,
				MHSymptoms, MHConsultation, MHSurgeries, MedicalTestType,
				Admission, MedicalHistory, Surgery, Illness, Symptom, Drug,
				Room, RoomType, Doctor, Employee, EmployeeType, Patient,
				AvailableFacilities,Facilities,Department;

*/
/*Create Department Table */
CREATE TABLE DEPARTMENT (
		departmentID 		int ,
		departmentName 		varchar(50),
		description 		varchar(120),

		CONSTRAINT pk_departmentID PRIMARY KEY (departmentID)

		--PRIMARY KEY == departmentID
        --FOREIGN KEY == NULL;
);

/*Create Facilities Table */
CREATE TABLE FACILITIES (
		facilityID 				int,
		facilityDescription		varchar(80),

		CONSTRAINT pk_facilityID PRIMARY KEY (facilityID)

		--PRIMARY KEY == facilityID
        --FOREIGN KEY == NULL;

);

/*Create AvailableFacilities Table */
CREATE TABLE AVAILABLEFACILITIES (
		departmentID 			int,
		facilityID 				int,
		
		CONSTRAINT pk_availableFacilityID PRIMARY KEY (departmentID,facilityID)

		--PRIMARY KEY == facilityID + departmentID
        --FOREIGN KEY == facilityID , departmentID 

);


/*Create Patient Table */
CREATE TABLE PATIENT (
		patientID 		int, 
		NICNumber		int UNIQUE,
		firstName 		varchar(50),
		middleName 		varchar(50),
		lastName 		varchar(50),
		age 			int,
		gender 			varchar(1) CHECK (gender IN ('m','f')), --  
		addressline1 	varchar(40),
		addressline2 	varchar(40),
		addressline3 	varchar(40),
		DOB 			date,
		contactNo 		varchar(10),
		nextOfKin		varchar(160),
		nextofKinNo		varchar(10),
		patientStatus	varchar(20),
		
		CONSTRAINT pk_patientID PRIMARY KEY (patientID)

		--PRIMARY KEY == patientID
        --FOREIGN KEY == NULL;
);

/*Create EmployeeType Table */
CREATE TABLE EMPLOYEETYPE (
		employeeTypeID 	int,
		jobTitle		varchar(50),
		salary			money,
		prefix			varchar(2)

		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeTypeID)

		--PRIMARY KEY == employeeTypeID
        --FOREIGN KEY == NULL;
);

/*Create Employee Table */
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

		--PRIMARY KEY == employeeID
        --FOREIGN KEY == employeeTypeID;
);

/*Create Doctor Table */  -- IMPORTANT!!!! : need to sort out how the employee table works and then redo normalization on this table
CREATE TABLE DOCTOR (   -- IMPORTANT!!! Need to double check doctor on call thing and do the do
		employeeID		int,
		doctorID 		int,
		specialization 	varchar(50),
		consultationFee money,
		
		CONSTRAINT pk_doctorID PRIMARY KEY (employeeID),
		CONSTRAINT fk_doctorEmployeeID FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)
		
		
		--PRIMARY KEY == doctorID
        --FOREIGN KEY == employeeTypeID
);


-- CREATE TABLE WARD (
-- 		wardID			int,
--		departmentID 	int,
-- 		wardName		varchar(35),
-- 		wardLevel    	varchar(35),

-- 		--PRIMARY KEY == wardID + employeeID + startDate
-- 		--FOREIGN KEY == NONE
-- );


-- CREATE TABLE WARDSCHEDULE(
-- 		wardID			int,
-- 		employeeID 		int,
-- 		startDate		date,	
-- 		endDate			date

-- 		CONSTRAINT pk_wardScheduleID PRIMARY KEY (wardID,employeeID,startDate),
-- 		CONSTRAINT fk_employeeID FOREIGN KEY (employeeID) REFERENCES EMPLOYEETYPE(employeeID)

-- 		--PRIMARY KEY == wardID + employeeID + startDate
--         --FOREIGN KEY == departmentID , employeeTypeID
-- );


/*Create RoomType Table */
CREATE TABLE ROOMTYPE (
		roomTypeID 		int,
		description		varchar(100),
		roomPrice 		money,

		CONSTRAINT pk_roomTypeID PRIMARY KEY (roomTypeID)
		

		--PRIMARY KEY == roomID + bedNo
        --FOREIGN KEY == NONE
);


/*Create Room Table */
CREATE TABLE ROOM (	
		roomID 		int,
		bedNo 		int,
		roomType 	int,
		status 		int,

		CONSTRAINT pk_roomID PRIMARY KEY (roomID,bedNo),
		CONSTRAINT fk_roomTypeID FOREIGN KEY (roomType) REFERENCES ROOMTYPE(roomTypeID)


		--PRIMARY KEY == roomID + bedNo
        --FOREIGN KEY == roomType
);




/*Create Drug Table */
CREATE TABLE DRUG (
		drugID 		int,
		drugName 	varchar(255),
		drugCompany	varchar(100),
		drugPrice	money,
		drugPurpose varchar(200),	
		legalClassification varchar(10), -- can be Schedule 1 - Schedule 5 ( based on level of abuse and risk to safety ), http://www.treatment4addiction.com/drugs/

		CONSTRAINT pk_drugID PRIMARY KEY (drugID)

		--PRIMARY KEY == drugID
        --FOREIGN KEY == NONE
);


/*Create Symptoms Table */
CREATE TABLE SYMPTOM (
		symptomID 		int,
		symptomName 	varchar(255), 
		

		CONSTRAINT pk_symptomID PRIMARY KEY (symptomID)

		--PRIMARY KEY == symptomID 
        --FOREIGN KEY == NONE
);


/*Create Illness Table */
CREATE TABLE ILLNESS (
		illnessID 		int,
		illnessName  	varchar,
			
		CONSTRAINT pk_illnessID PRIMARY KEY (illnessID)

		--PRIMARY KEY == illnessID
        --FOREIGN KEY == NONE
);




/*Create Surgery Table */
CREATE TABLE SURGERY (
		surgeryID 		int,
		surgeryName  	varchar(100),
		surgeryDescr	varchar(180),
		surgeryPrice	money,

		CONSTRAINT pk_surgeryID PRIMARY KEY (surgeryID)

		--PRIMARY KEY == surgeryID
        --FOREIGN KEY == NONE`
);

CREATE TABLE MEDICALHISTORY (			
		patientID			int,
		medicalHistoryID	int,
		paymentStatus		int,

		CONSTRAINT pk_MedicalHistory PRIMARY KEY (medicalHistoryID,patientID),
);

CREATE TABLE ADMISSION (
		medicalHistoryID	int,
		admissionID			int,
		patientID 			int,
		doctorID 			int,
		roomID 				int,
		bedNo 				int,
		admissionDate		date,
		dischargeDate		date,
		admissionReport		varchar(120),
		dischargeReport		varchar(200),
		paymentStatus 		int,

		CONSTRAINT pk_admissionID PRIMARY KEY (admissionID,medicalHistoryID),
		CONSTRAINT fk_admissionMedicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_admissionPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_admissionDoctorID FOREIGN KEY (doctorID) REFERENCES EMPLOYEE(employeeID),
		CONSTRAINT fk_admissionRoomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT fk_admissionBedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo),

		--PRIMARY KEY == admissionID + patientID + doctorID + roomID + bedID
        --FOREIGN KEY == NONE`
);


CREATE TABLE MEDICALTESTTYPE (
		testTypeID		int,
		testName		int,
		testDescription	varchar(100),
		price 			money,
		
		
		CONSTRAINT pk_MedicalTestType PRIMARY KEY (testTypeID)
		
		--PRIMARY KEY == testtypeID
        --FOREIGN KEY == NONE

);



/*Create Surgery Medical History Table */
CREATE TABLE MHSURGERIES (
		medicalHistoryID	int,
		patientID 			int,
		surgeryID 			int,
		doctorID 			int,
		timeScheduled		date,
		surgeryRoom			int,
		roomID 				int,
		bedNo				int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		timeOutOfSurgery 	date,
		timeInSurgery		time, -- IMPORTANT : Need to include calculated column to populate total time taken in surgery ( use AS keyword )
		preSurgeryNotes 	varchar(255),
		postSurgeryNotes 	varchar(255),
		surgeryReport		varchar(255),
		paymentStatus		int,


		CONSTRAINT pk_mhsurgeryID PRIMARY KEY (surgeryID,patientID,medicalHistoryID),
		CONSTRAINT fk_mhsurgeryMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhsurgerySurgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT fk_mhsurgeryPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_mhsurgeryDoctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(employeeID),
		CONSTRAINT fk_mhsurgeryRoomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT fk_mhsurgeryBedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo)

		--PRIMARY KEY == surgeryID + patientID + doctorID + timescheduled
        --FOREIGN KEY == surgeryID , patientID , doctorID , roomID , bedNo
);


CREATE TABLE MHCONSULTATIONS (
		medicalHistoryID	int,
		consultationID 		int,
		patientID 			int,
		doctorID 			int,
		consultationDate	date,
		consultationRoom	int,
		bedNo				int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		diagnosis			int,
		preSurgeryNotes 	varchar(255),
		postSurgeryNotes 	varchar(255),
		surgeryReport		varchar(255),
		admitted			int,
		paymentStatus		int,


		CONSTRAINT pk_mhconsultationID PRIMARY KEY (consultationID,patientID,medicalHistoryID),
		CONSTRAINT fk_mhconsultationMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhconsultationPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_mhconsultationRoomID FOREIGN KEY (consultationRoom) REFERENCES ROOM(roomID),
		CONSTRAINT fk_mhconsultationDoctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT fk_mhconsultationBedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo),
		CONSTRAINT fk_mhconsultationDiagnosis FOREIGN KEY (diagnosis) REFERENCES ILLNESS(illnessID)

		--PRIMARY KEY == consultationID
        --FOREIGN KEY == patientID , doctorID , roomID , bedNo
);



/*Create Symptoms Medical History Table */
CREATE TABLE MHSYMPTOMS (
		medicalHistoryID int,
		patientID 		int,
		consultationID 	int,
		symptomID  		varchar,

		CONSTRAINT pk_mhsymptomsID PRIMARY KEY (patientID,medicalHistoryID,consultationID,symptomID),
		CONSTRAINT fk_mhsymptomsConsultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_mhsymptomsSymptomID FOREIGN KEY (symptomID) REFERENCES SYMPTOM(symptomID),
		CONSTRAINT fk_mhsymptomsMedicalHistoryID FOREIGN KEY (medicalHistoryID,patiantID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhsymptomsPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		--PRIMARY KEY == consultationID + symptomID
        --FOREIGN KEY == consultationID , sumptomID
);

CREATE TABLE MHILLNESSES (
		consultationID 	int,
		patientID 		int,
		medicalHistoryID int,
		illnessID  		varchar,

		CONSTRAINT pk_mhillnessID PRIMARY KEY (consultationID,illnessID),
		CONSTRAINT fk_mhillnessConsultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_mhillnessIllnessID FOREIGN KEY (illnessID) REFERENCES ILLNESS(illnessID),
		--PRIMARY KEY == consultationID + symptomID
        --FOREIGN KEY == consultationID , sumptomID
);


/*Create Drugs Medical History Table */
CREATE TABLE MHDRUGS (
		medicalHistoryID	int,
		consultationID 	int,
		drugID 			int,
		dosage			varchar(50) CHECK (Dosage IN ('one pill','two pills','three pills')),
		morning			int, -- binary number to tell when the meds are to be taken
		afternoon		int, -- binary number to tell when the meds are to be taken
		night			int, -- binary number to tell when the meds are to be taken
		timebased		int, -- if 
		meal			varchar(50) CHECK (MEAL IN ('After Meals','Before Meals','None')),
		duration		date, 
		admitted		int, -- check for it the drug was administered while in house
		paymentStatus	int  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_mhdrugsID PRIMARY KEY (patientID,medicalHistoryID,consultationID,drugID),
		CONSTRAINT fk_mhdrugsMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhdrugsConsultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_mhdrugsDrugID FOREIGN KEY (drugID) REFERENCES DRUG(drugID)

		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



/*Create Drugs Medical History Table */
CREATE TABLE MHMEDICALTESTS (
		medicalHistoryID	int,
		testID 			int,
		testTypeID 		int,
		patientID 		int,
		testDate		date,
		testVariable	float,
		testResult		varchar(8) CHECK ( testresult IN ('Positive','Negative')),
		testReport		varchar(200),
		admitted		int, -- check for it the drug was administered while in house
		paymentStatus	int,  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_mhmedicaltests PRIMARY KEY (testID,patientID),
		CONSTRAINT fk_mhmedicaltestsMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhmedicaltestsPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_mhmedicaltestsTestTypeID FOREIGN KEY (testTypeID) REFERENCES MEDICALTESTTYPE(testTypeID)
		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);


/*Create Drugs Medical History Table */
CREATE TABLE MHMEDICALSCANS (
		medicalHistoryID	int,
		scanID 			int,
		scantypeID 		int,
		patientID 		int,
		scanDate		date,
		scanImage		varchar(150), -- includes the file path to the scan image
		scanReport		varchar(200),
		admitted		int, -- check for it the drug was administered while in house
		paymentStatus	int,  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_mhmedicalscans PRIMARY KEY (scanID,patientID),
		CONSTRAINT fk_mhmedicalscansMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_mhmedicalscansScanTypeID FOREIGN KEY (scanTypeID) REFERENCES MEDICALSCANTYPE(scanTypeID),
		CONSTRAINT fk_mhmedicalscansPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),


		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



/*Create Drugs Medical History Table */
CREATE TABLE BILLING (  
		patientID 			int,
		invoiceID 			int,
		medicalHistoryID	int,
		paymentMethod		varchar(10) CHECK ( paymentMethod IN ('cash','credit card','visa','mastercard')),
		total				money,

			
		CONSTRAINT pk_billing PRIMARY KEY (medicalHistoryID,invoiceID,patientID),
		CONSTRAINT fk_billingMedicalHistoryID FOREIGN KEY (medicalHistoryID,patientID) REFERENCES MEDICALHISTORY(medicalHistoryID,patientID),
		CONSTRAINT fk_billingPatientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID)
		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



