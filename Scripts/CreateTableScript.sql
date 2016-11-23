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
		floor 				varchar(2),
		wingno 				varchar(2)
		description 		varchar(255),

		CONSTRAINT pk_departmentID PRIMARY KEY (departmentID)

		--PRIMARY KEY == departmentID
        --FOREIGN KEY == NULL;
);


/*Create Patient Table */
CREATE TABLE PATIENT (
		patientID 		int,
		NICNumber		int UNIQUE,
		firstName 		varchar(50),
		middleName 		varchar(255),
		lastName 		varchar(255),
		age 			int,
		gender 			varchar(255) CHECK (gender IN ('m','f')), --  
		addressline1 	varchar(255),
		addressline2 	varchar(255),
		addressline3 	varchar(255),
		DOB 			date,
		contactNo 		varchar(10),
		patientStatus 	int,
		nextOfKin		varchar(255),
		nextofKinNo		varchar(10),
		
		CONSTRAINT pk_patientID PRIMARY KEY (patientID)

		--PRIMARY KEY == patientID
        --FOREIGN KEY == NULL;
);

CREATE TABLE EMPLOYEETYPE (
		employeeTypeID 	int,
		jobTitle		varchar(50),
		salary			money,

		CONSTRAINT pk_employeeTypeID PRIMARY KEY (employeeID)

		--PRIMARY KEY == employeeTypeID
        --FOREIGN KEY == NULL;
);


/*Create Doctor Table */  -- IMPORTANT!!!! : need to sort out how the employee table works and then redo normalization on this table
CREATE TABLE DOCTOR (   -- IMPORTANT!!! Need to double check doctor on call thing and do the do
		doctorID		int,
		firstName 		varchar(255),
		middleName 		varchar(255),
		lastName 		varchar(255),
		specialization 	varchar(255),
		addressline1 	varchar(255),
		addressline2 	varchar(255),
		addressline3 	varchar(255),
		mobileNO 		varchar(255),
		homeNO 		varchar(255),
		doctorType 		date,
		departmentID 	int,
		consultationFee money,
		employeeTypeID	int,

		
		CONSTRAINT pk_doctorID PRIMARY KEY (doctorID),
		CONSTRAINT fk_departmentID FOREIGN KEY (departmentID) REFERENCES DEPARTMENT(departmentID),
		CONSTRAINT fk_employeeTypeID FOREIGN KEY (employeeTypeID) REFERENCES EMPLOYEETYPE(employeeTypeID)
		
		--PRIMARY KEY == doctorID
        --FOREIGN KEY == departmentID , employeeTypeID
);


/*Create RoomType Table */
CREATE TABLE ROOMTYPE (
		roomType 		int,
		description		varchar(100),
		roomPrice 		money,

		CONSTRAINT pk_roomID PRIMARY KEY (roomID,bedNo),
		CONSTRAINT fk_departmentID FOREIGN KEY (roomType) REFERENCES DEPARTMENT(departmentID)

		--PRIMARY KEY == roomID + bedNo
        --FOREIGN KEY == NONE
);


/*Create Room Table */
CREATE TABLE ROOM (	
		roomID 		int,
		bedNo 		int,
		roomType 	int,
		status 		varchar(255),

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
        --FOREIGN KEY == NONE
);


/*Create Surgery Medical History Table */
CREATE TABLE MHSURGERIES (
		surgeryID 		int,
		patientID 		int,
		doctorID 		int,
		timeScheduled	date,
		surgeryRoom		int,
		bedNo			int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		timeOutOfSurgery date,
		timeInSurgery	time, -- IMPORTANT : Need to include calculated column to populate total time taken in surgery ( use AS keyword )
		preSurgeryNotes varchar(255),
		postSurgeryNotes varchar(255),
		surgeryReport	varchar(255),
		paymentStatus	int(1),


		CONSTRAINT pk_mhsurgeryID PRIMARY KEY (surgeryID,patientID,doctorID,timescheduled),
		CONSTRAINT fk_surgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT doctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT roomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT bedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo)

		--PRIMARY KEY == surgeryID + patientID + doctorID + timescheduled
        --FOREIGN KEY == surgeryID , patientID , doctorID , roomID , bedNo
);



CREATE TABLE MHCONSULTATION (
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
		CONSTRAINT fk_surgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT fk_doctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT fk_roomID FOREIGN KEY (consultationRoom) REFERENCES ROOM(roomID),
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



/*Create Drugs Medical History Table */
CREATE TABLE MHDRUGS (
		consultationID 	int,
		drugID 			int,
		dosage			varchar(50) CHECK (Dosage IN ('one pill','two pills','three pills')),
		morning			int(1), -- binary number to tell when the meds are to be taken
		afternoon		int(1), -- binary number to tell when the meds are to be taken
		night			int(1), -- binary number to tell when the meds are to be taken
		timebased		int(2), 
		meal			varchar(50) CHECK (MEAL IN ('After Meals','Before Meals','None')),
		duration		date, 
		admitted		int(1), -- check for it the drug was administered while in house
		paymentStatus	int(1)  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (consultationID,drugID),
		CONSTRAINT fk_consultationID FOREIGN KEY (consultationID) REFERENCES CONSULTATION(consultationID),
		CONSTRAINT fk_drugID FOREIGN KEY (drugID) REFERENCES DRUG(drugID),

		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
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


/*Create Drugs Medical History Table */
CREATE TABLE MHMEDICALTESTS (
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
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);


CREATE TABLE MEDICALSCANTYPE (
		scanTypeID		int,
		scanName		int,
		scanDescription	varchar(100),
		scanPrice 		money,
		
		
CONSTRAINT pk_MedicalScanType PRIMARY KEY (testID)

		--PRIMARY KEY == testtypeID
        --FOREIGN KEY == NONE

);

/*Create Drugs Medical History Table */
CREATE TABLE MHMEDICALSCANS (
		scanID 			int,
		scantypeID 		int,
		patientID 		int,
		scanDate		date,
		scanImage		varchar(150), -- includes the file path to the scan image
		scanReport		varchar(200),
		admitted		int(1), -- check for it the drug was administered while in house
		paymentStatus	int(1),  -- IMPORTANT : Need to code logic for if admitted = 1 then payment status cannot be 0 at patient discharged.

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (scanID),
		CONSTRAINT fk_patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),


		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



/*Create Drugs Medical History Table */
CREATE TABLE BILLING (  -- INCOMPLETE
		billingID 		int,
		patientID 		int,
		paymentMethod	varchar(10) CHECK ( paymentMethod IN ('cash','credit card','visa','mastercard')),
		total			money,

			
		CONSTRAINT pk_MHDrugs PRIMARY KEY (consultationID,drugID)

		--PRIMARY KEY == consultationID + DrugID
        --FOREIGN KEY == NONE
);



