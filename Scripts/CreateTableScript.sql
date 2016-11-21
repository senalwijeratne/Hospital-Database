-- DATABASE 

-- The following code executes the Create Table Statements for Hospital DBMS Developed by : 

-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID : < 10569221 > Name : Mohamed Ikhwan Ibrahim
-- Plymouth Reference ID :  Name :
-- Plymouth Reference ID :  Name :




-- Creation Order  = 1.Department > 2.Patient > 3.Doctor > 4.RoomType > 5.Room > 6.Drug > 7.Symptom > 8.Illness > 9.Surgery > 10.MHSurgery


/*Create Department Table */
CREATE TABLE DEPARTMENT (
		departmentID 		int,
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
		NICNumber		int,
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


/*Create Doctor Table */
CREATE TABLE DOCTOR (
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

		
		CONSTRAINT pk_doctorID PRIMARY KEY (doctorID)
		CONSTRAINT fk_departmentID FOREIGN KEY (departmentID) REFERENCES DEPARTMENT(departmentID)
		
		--PRIMARY KEY == doctorID
        --FOREIGN KEY == departmentID;
);


/*Create Room Table */
CREATE TABLE ROOMTYPE (
		roomType 		int,
		description		varchar(100),
		roomPrice 		money,

		CONSTRAINT pk_roomID PRIMARY KEY (roomID,bedNo)
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

		CONSTRAINT pk_roomID PRIMARY KEY (roomID,bedNo)
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
		legalClassification varchar(10) -- can be Schedule 1 - Schedule 5 ( based on level of abuse and risk to safety ), http://www.treatment4addiction.com/drugs/

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


/*Create Symptoms Table */
CREATE TABLE SURGERY (
		surgeryID 		int,
		surgeryName  	varchar,
		surgeryPrice	money,

		CONSTRAINT pk_surgeryID PRIMARY KEY (surgeryID)

		--PRIMARY KEY == surgeryID
        --FOREIGN KEY == NONE
);


CREATE TABLE MHSURGERY (
		surgeryID 		int,
		patientID 		int,
		doctorID 		int,
		timescheduled	date,
		surgeryRoom		int,
		bedNo			int,  -- QUESTION : Do we really need bedNo in this table as a foreign key? ( i dont think so but im putting in just to be safe )
		timeoutofsurgery date,
		timeinsurgery	time, -- IMPORTANT : Need to include calculated column to populate total time taken in surgery ( use AS keyword )
		preSurgeryNotes varchar(255),
		postSurgeryNotes varchar(255),
		surgeryReport	varchar(255),
		paymentStatus	int(1),


		CONSTRAINT pk_mhsurgeryID PRIMARY KEY (surgeryID,patientID,doctorID,timescheduled),
		CONSTRAINT fk_surgeryID FOREIGN KEY (surgeryID) REFERENCES SURGERY(surgeryID),
		CONSTRAINT patientID FOREIGN KEY (patientID) REFERENCES PATIENT(patientID),
		CONSTRAINT doctorID FOREIGN KEY (doctorID) REFERENCES DOCTOR(doctorID),
		CONSTRAINT roomID FOREIGN KEY (roomID) REFERENCES ROOM(roomID),
		CONSTRAINT bedNo FOREIGN KEY (bedNo) REFERENCES ROOM(bedNo),

		--PRIMARY KEY == surgeryID + patientID + doctorID + timescheduled
        --FOREIGN KEY == surgeryID , patientID , doctorID , roomID , bedNo
);


