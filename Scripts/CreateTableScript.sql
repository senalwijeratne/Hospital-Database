-- DATABASE 

-- The following code executes the Create Table Statements for Hospital DBMS Developed by : 

-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID : < 10569221 > Name : Mohamed Ikhwan Ibrahim
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :




-- Creation Order  = 1.Department > 2.Patient > EMPLOYEETYPE 3.Doctor > 4.RoomType > 5.Room > 6.Drug > 7.Symptom > 8.Illness > 9.Surgery > 10.MHSurgery > 
					-- > 11.MHConsultation 12.MHSymptoms > 13.MHDrugs MEDICALTESTTYPE MHMEDICALTESTS MEDICALSCANTYPE MHMEDICALSCANS

/*Create Department Table */
CREATE TABLE DEPARTMENT (
		departmentID 		int(3) ,
		departmentName 		varchar(50),
		description 		varchar(120),

		CONSTRAINT pk_departmentID PRIMARY KEY (departmentID)

		--PRIMARY KEY == departmentID
        --FOREIGN KEY == NULL;
);

CREATE TABLE FACILITIES (
		facilityID 				int,
		facilityDescription		varchar(80),

		CONSTRAINT pk_facilityID PRIMARY KEY (facilityID)

		--PRIMARY KEY == facilityID
        --FOREIGN KEY == NULL;

);


CREATE TABLE AVAILABLEFACILITIES (
		departmentID 			int,
		facilityID 				int,
		
		CONSTRAINT pk_facilityID PRIMARY KEY (departmentID,facilityID)

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
		age 			int(3),
		gender 			varchar(1) CHECK (gender IN ('m','f')), --  
		addressline1 	varchar(40),
		addressline2 	varchar(40),
		addressline3 	varchar(40),
		DOB 			date,
		contactNo 		varchar(10),
		patientStatus 	int,
		nextOfKin		varchar(160),
		nextofKinNo		varchar(10),
		
		CONSTRAINT pk_patientID PRIMARY KEY (patientID)

		--PRIMARY KEY == patientID
        --FOREIGN KEY == NULL;
);

CREATE TABLE EMPLOYEETYPE (
		employeeTypeID 	int,
		jobTitle		varchar(50),
		salary			money,
		prefix			varchar(2)

		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeID)

		--PRIMARY KEY == employeeTypeID
        --FOREIGN KEY == NULL;
);


CREATE TABLE EMPLOYEE (
		employeeTypeID 	int,
		employeeID		int,
		employeeNo		int,
		firstName 		varchar(50),
		middleName 		varchar(50),
		lastName 		varchar(50),
		gender 			varchar(1) CHECK (gender IN ('m','f')),			
		addressline1 	varchar(40),
		addressline2 	varchar(40),
		addressline3 	varchar(40),
		mobileNO 		varchar(255),
		homeNO 			varchar(255),
		joinDate		date,

		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeID)
		CONSTRAINT fk_departmentID FOREIGN KEY (departmentID) REFERENCES DEPARTMENT(departmentID),

		--PRIMARY KEY == employeeID
        --FOREIGN KEY == NULL;
);

/*Create Doctor Table */  -- IMPORTANT!!!! : need to sort out how the employee table works and then redo normalization on this table
CREATE TABLE DOCTOR (   -- IMPORTANT!!! Need to double check doctor on call thing and do the do
		employeeID		int,
		doctorID 		int,
		specialization 	varchar(255),
		consultationFee money,
		
		CONSTRAINT pk_doctorID PRIMARY KEY (employeeID),
		CONSTRAINT fk_employeeID FOREIGN KEY (employeeID) REFERENCES EMPLOYEETYPE(employeeID)
		
		
		--PRIMARY KEY == doctorID
        --FOREIGN KEY == departmentID , employeeTypeID
);


-- CREATE TABLE WARD (
-- 		wardID			int(2),
-- 		wardName		varchar(35),
-- 		wardLevel    	varchar(35),

-- 		--PRIMARY KEY == wardID + employeeID + startDate
-- 		--FOREIGN KEY == NONE
-- );


-- CREATE TABLE WARDSCHEDULE(
-- 		wardID			int(2),
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
		roomType 		int,
		description		varchar(100),
		roomPrice 		money,

		CONSTRAINT pk_roomID PR*IMARY KEY (roomID,bedNo),
-+
		CONSTRAINT fk_departmentID FOREIGN KEY (roomType) REFERENCES DEPARTMENT(departmentID)

		--PRIMARY KEY == roomID + bedNo
        --FOREIGN KEY == NONE
);


/*Create Room Table */
CREATE TABLE ROOM (	
		roomID 		int,
		bedNo 		int,
		roomType 	int,
		status 		int(1),

		CONSTRAINT pk_roomID PRIMARY KEY (roomID,bedNo),
		CONSTRAINT fk_departmentID FOREIGN KEY (roomType) REFERENCES DEPARTMENT(roomType)

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

*
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
		fk_patientID		int,
		medicalHistoryID	int,
		paymentStatus		int(1),

		CONSTRAINT pk_MedicalHistory PRIMARY KEY (medicalHistoryID,patientID),
);

CREATE TABLE ADMISSION (
		medicalHistoryID	int,
		department 			int,
		admissionID			int,
		patientID 			int,
		doctorID 			int,
		roomID 				int,
		bedID 				int,
		admissionDate		date,
		dischargeDate		date,
		admissionReport		varchar(120),
		paymentStatus 		int(1),

		CONSTRAINT pk_admissionID PRIMARY KEY (admissionID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_doctorID FOREIGN KEY (doctorID) REFERENCES EMPLOYEE(employeeID),
		CONSTRAINT fk_roomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT fk_bedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo),

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
		surgeryID 			int,
		patientID 			int,
		doctorID 			int,
		timeScheduled		date,
		surgeryRoom			int,
		bedNo				int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		timeOutOfSurgery 	date,
		timeInSurgery		time, -- IMPORTANT : Need to include calculated column to populate total time taken in surgery ( use AS keyword )
		preSurgeryNotes 	varchar(255),
		postSurgeryNotes 	varchar(255),
		surgeryReport		varchar(255),
		paymentStatus		int(1),


		CONSTRAINT pk_mhsurgeryID PRIMARY KEY (surgeryID,patientID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_surgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT doctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT roomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT bedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo)

		--PRIMARY KEY == surgeryID + patientID + doctorID + timescheduled
        --FOREIGN KEY == surgeryID , patientID , doctorID , roomID , bedNo
);


CREATE TABLE MHCONSULTATION (
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
		admitted			int(1),
		paymentStatus		int(1),


		CONSTRAINT pk_mhconsultationID PRIMARY KEY (consultationID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_roomID FOREIGN KEY (consultationRoom) REFERENCES ROOM(roomID),
		CONSTRAINT fk_surgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_doctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT fk_bedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo),
		CONSTRAINT fk_diagnosis FOREIGN KEY (diagnosis) REFERENCES ILLNESS(illnessID)

		--PRIMARY KEY == consultationID
        --FOREIGN KEY == patientID , doctorID , roomID , bedNo
);



/*Create Symptoms Medical History Table */
CREATE TABLE MHSYMPTOMS (
		consultationID 	int,
		symptomID  		varchar,

		CONSTRAINT pk_MHSymptompsID PRIMARY KEY (consultationID,sympotomID),
		CONSTRAINT fk_consultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_symptomID FOREIGN KEY (symptomID) REFERENCES SYMPTOM(symptomID),
		--PRIMARY KEY == consultationID + symptomID
        --FOREIGN KEY == consultationID , sumptomID
);

CREATE TABLE MHILLNESS (
		consultationID 	int,
		illnessID  		varchar,

		CONSTRAINT pk_MHSymptompsID PRIMARY KEY (consultationID,sympotomID),
		CONSTRAINT fk_consultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_illnessID FOREIGN KEY (illnessID) REFERENCES ILLNESS(illnessID),
		--PRIMARY KEY == consultationID + symptomID
        --FOREIGN KEY == consultationID , sumptomID
);


/*Create Drugs Medical History Table */
CREATE TABLE MHDRUGS (
		medicalHistoryID	int,
		consultationID 	int,
		drugID 			int,
		dosage			varchar(50) CHECK (Dosage IN ('one pill','two pills','three pills')),
		morning			int(1), -- binary number to tell when the meds are to be taken
		afternoon		int(1), -- binary number to tell when the meds are to be taken
		night			int(1), -- binary number to tell when the meds are to be taken
		timebased		int(2), -- if 
		meal			varchar(50) CHECK (MEAL IN ('After Meals','Before Meals','None')),
		duration		date, 
		admitted		int(1), -- check for it the drug was administered while in house
		paymentStatus	int(1)  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (consultationID,drugID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_consultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_roomID FOREIGN KEY (consultationRoom) REFERENCES ROOM(roomID),
		CONSTRAINT fk_drugID FOREIGN KEY (drugID) REFERENCES DRUG(drugID),

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
		admitted		int(1), -- check for it the drug was administered while in house
		paymentStatus	int(1),  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (testID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_testTypeID FOREIGN KEY (testTypeID) REFERENCES MEDICALTESTTYPE(testTypeID)
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
		admitted		int(1), -- check for it the drug was administered while in house
		paymentStatus	int(1),  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (scanID),
		CONSTRAINT fk_medicalHistoryID FOREIGN KEY (medicalHistoryID) REFERENCES MEDICALHISTORY(medicalHistoryID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_scanTypeID FOREIGN KEY (scanTypeID) REFERENCES MEDICALSCANTYPE(scanTypeID)


		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



/*Create Drugs Medical History Table */
CREATE TABLE BILLING (  -- INCOMPLETE
		invoiceID 		int,
		medicalHistoryID	int,
		patientID 		int,
		paymentMethod	varchar(10) CHECK ( paymentMethod IN ('cash','credit card','visa','mastercard')),
		total			money,

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (consultationID,drugID)

		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



