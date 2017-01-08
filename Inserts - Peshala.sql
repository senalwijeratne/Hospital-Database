/* by :  Peshala Rasanga */
INSERT INTO EMPLOYEE  (employeeTypeID ,employeeID	,departmentID	,firstName ,middleName ,lastName,gender,addressline1,addressline2,addressline3,mobileNO,homeNO,joinDate)
VALUES
('1','1','1','Upil','Sahan','Thilakasiri','M','200','Urapola','Willpalla',0778968854,1127844596,2013/05/22),
('2','2','2','Tasia','Gauvin','Thilakasiri','M','182','kongama lane','Willpalla',0777505279,01129174396,2014/06/28),
('3','3','3','Mollie ','Fosdick','Thilakasiri','F','252','jayagama','Willpalla',0774595409,0111354155,2014/09/06),
('4','4','4','Ethan ','Hillebrand','Thilakasiri','M','381','weera lane','Willpalla'0778123126,0115122718,2015/04/21),
('5','5','5','Uthpala','Wijerathne','Thilakasiri','M','152','jayawardhanapura','kotte',0713010822,0111613999,2016/10/02),
('6','6','6','Judah','Josiah Holmes','Justice, Carson B','F','82','kibulawala','homagaama',761708675,0115673695,2016/03/21),
('7','7','7','Nathan','Kenneth Shepard','Ray, Carol Q.','M','22','manipur','koongama',0768702458,0111413465,2015/02/09),
('8','8','8','Boris','Vladimir Higgins','Armstrong, Gloria R.','F','28','hongama','Willpalla'0714135152,0119508117,2015/05/31),
('9','9','9','Craig','Brendan Murray','Roberts, Nicholas F','M','82','galmaduwa','walikada',0775763819,0113898879,2015/04/22),
('10','10','10','Ivan','Howard Palmer','Prince, Thane N.','F','281','rukmala lane','rukmalgama',0711727065,0115172748,22-04-15);

 INSERT INTO RESIDENT_DOCTOR (RdoctorID,employeeID,specialization,consultationFee,highestQualification,seniority)
VALUES
('1','1','Cardiology',2500,'MD','3 year'),
('1','1','Plastic Surgery',2500,'MBBS','4 year'),
('3','3','Cardiology',2500,'DO','1 year'),
('4','4','Cardiology',2500,'MD','6year'),
('5','5','Immunologist',2500,'MBBS','3 year'),
('6','6','Cardiology',2500,'MD','2 year'),
('7','7','Pediatrician',2500,'DO','4 year'),
('8','8','Neonatologist',2500,'MD','1 year'),
('9','9','Neonatologist',2500,'MBBS','3 year'),
('10','10','Physiologist',2500,'MD','4 year');
 
INSERT INTO ONCALL_DOCTOR (OCdoctorID,employeeID,specialization,consultationFee,feePerCall,paymentDate,highestQualification)
VALUES
('1','1','Dermatology',2000,500,2017/05/01,'MD'),
('2','2','Plastic Surgery',3500,1000,2017/05/01,'MBBS'),
('3','3','Cardiology',2500,600,2017/05/01,'MBBS'),
('4','4','Dentist',2500,500,2017/05/01,'DO'),
('5','5','Gynocologist',3500,600,2017/05/01,'MBBCH'),
('6','6','Cardiology',3500,500,2017/05/01,'MD'),
('7','7','Neonatologist',2500,700,2017/05/01,'DO'),
('8','8','Immunologist',3000,300,2017/05/01'MD'),
('9','9','Neonatologist',2000,500,2017/05/01,'BMBS'),
('10','10','Pediatrician',2500,400,2017/05/01,'MBBS'),

INSERT INTO EMPLOYEETYPE  (employeeTypeID,jobType,salary,prefix,description)
VALUES
('1','Resident Doctor',175000,'','Verifies patient information by interviewing patient'),
('2','Oncall Doctor',125000,'','. Nurses plan and provide medical and nursing care to patients in hospital'),
('3','Janitor',3000,'','Janitor. Keep buildings in clean and orderly condition. Perform heavy cleaning duties, such as cleaning floors, shampooing rugs, washing walls and glass, and removing rubbish.'),
('4','Diatesian',55000,'','promote good dietary health and treat medical conditions by devising eating plans for patients based on the science of nutrition'),
('5','Financial Officer',80000,'','eports to the Senior Administrative Officer and is responsible for preparing financial statements, maintaining cash controls, preparing the payroll and personnel administration, purchasing, maintaining accounts payable and managing office operations.'),
('6','Healthcare Consulting',80000,'','management analysts employed by the healthcare industry. They examine the efficiency, profits and structure of the organization, then offer suggestions on methods of improvement. This career requires a minimum of a bachelor's degree, though a master's degree is generally preferred'),
('7','Lab Staff',80000,'','Assiting the nurses and doctors in the lab work'),
('8','Attendees',75000,'','Attending for the needs of the patients'),
('9','Nurse',80000,'','. Nurses plan and provide medical and nursing care to patients in hospital');

