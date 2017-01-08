/* by :  Peshala Rasanga */
INSERT INTO EMPLOYEE  (employeeTypeID ,employeeID	,departmentID	,firstName ,middleName ,lastName,gender,addressline1,addressline2,addressline3,mobileNO,homeNO,joinDate)
VALUES
('1','1','1','Upil','Sahan','Thilakasiri','282','Urapola','Willpalla',0778968854,1127844596,1-05-13),
('1','1','1','Tasia','Gauvin','Thilakasiri','282','Urapola','Willpalla',0777505279,01129174396,22-04-13),
('1','1','1','Mollie ','Fosdick','Thilakasiri','282','Urapola','Willpalla',0774595409,0111354155,28-06-14),
('1','1','1','Ethan ','Hillebrand','Thilakasiri','282','Urapola','Willpalla'0778123126,0115122718,06-09-14),
('1','1','1','Uthpala','Wijerathne','Thilakasiri','282','Urapola','Willpalla',0713010822,0111613999,21-04-15),
('1','1','1','Judah','Josiah Holmes','Justice, Carson B','282','Urapola','Willpalla',761708675,0115673695,02-10-16),
('1','1','1','Nathan','Kenneth Shepard','Ray, Carol Q.','282','Urapola','Willpalla',0768702458,0111413465,21-03-16),
('1','1','1','Boris','Vladimir Higgins','Armstrong, Gloria R.','282','Urapola','Willpalla'0714135152,0119508117,09-02-15),
('1','1','1','Craig','Brendan Murray','Roberts, Nicholas F','282','Urapola','Willpalla',0775763819,0113898879,31-05-15),
('1','1','1','Ivan','Howard Palmer','Prince, Thane N.','282','Urapola','Willpalla',0711727065,0115172748,22-04-15);

 INSERT INTO RESIDENT_DOCTOR (RdoctorID,employeeID,specialization,consultationFee,highestQualification,seniority)
VALUES
('1','1','Cardiology',2500,'MD',)
('1','1','Plastic Surgery',2500,'MBBS',)
('1','1','Cardiology',2500,'DO',)
('1','1','Cardiology',2500,'MD',)
('1','1','Immunologist',2500,'MBBS',)
('1','1','Cardiology',2500,'MD',)
('1','1','Pediatrician',2500,'DO',)
('1','1','Neonatologist',2500,'MD',)
('1','1','Neonatologist',2500,'MBBS',)
('1','1','Physiologist',2500,'MD',)
INSERT INTO ONCALL_DOCTOR (OCdoctorID,employeeID,specialization,consultationFee,	feePerCall,paymentDate,highestQualification)
VALUES
('1','1','Dermatology',2000,'MD',)
('1','1','Plastic Surgery',3500,'MBBS',)
('1','1','Cardiology',2500,'MBBS',)
('1','1','Dentist',2500,'DO',)
('1','1','Gynocologist',3500,'MBBCH',)
('1','1','Cardiology',3500,'MD',)
('1','1','Neonatologist',2500,'DO',)
('1','1','Immunologist',3000,'MD',)
('1','1','Neonatologist',2000,'BMBS',)
('1','1','Pediatrician',2500,'MBBS',)

INSERT INTO EMPLOYEETYPE  (employeeTypeID,jobType,salary,prefix,description)
VALUES
('1','1','Medical Assistants',2000,'MD',)
('1','1','Nurse',3500,'MBBS',)
('1','1','Janitor',2500,'MBBS',)
('1','1','Diatesian',2500,'DO',)
('1','1','Financial Officer',3500,'MBBCH',)
('1','1','Healthcare Consulting',3500,'MD',)
('1','1','Janitor',2500,'DO',)
('1','1','Janitor',3000,'MD',)
('1','1','Nurse',2000,'BMBS',)
('1','1','Nurse',2500,'MBBS',)
