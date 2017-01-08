/* by :  Peshala Rasanga */
INSERT INTO EMPLOYEE  (employeeTypeID ,employeeID	,departmentID	,firstName ,middleName ,lastName,gender,addressline1,addressline2,addressline3,mobileNO,homeNO,joinDate)
VALUES
('1','1','1','Upil','Sahan','Thilakasiri','M','282','Urapola','Willpalla',0778968854,1127844596,2013/05/22),
('1','1','1','Tasia','Gauvin','Thilakasiri','M','282','Urapola','Willpalla',0777505279,01129174396,2014/06/28),
('1','1','1','Mollie ','Fosdick','Thilakasiri','F','282','Urapola','Willpalla',0774595409,0111354155,2014/09/06),
('1','1','1','Ethan ','Hillebrand','Thilakasiri','M','282','Urapola','Willpalla'0778123126,0115122718,2015/04/21),
('1','1','1','Uthpala','Wijerathne','Thilakasiri','M','282','Urapola','Willpalla',0713010822,0111613999,2016/10/02),
('1','1','1','Judah','Josiah Holmes','Justice, Carson B','F','282','Urapola','Willpalla',761708675,0115673695,2016/03/21),
('1','1','1','Nathan','Kenneth Shepard','Ray, Carol Q.','M','282','Urapola','Willpalla',0768702458,0111413465,2015/02/09),
('1','1','1','Boris','Vladimir Higgins','Armstrong, Gloria R.','F','282','Urapola','Willpalla'0714135152,0119508117,2015/05/31),
('1','1','1','Craig','Brendan Murray','Roberts, Nicholas F','M','282','Urapola','Willpalla',0775763819,0113898879,2015/04/22),
('1','1','1','Ivan','Howard Palmer','Prince, Thane N.','F','282','Urapola','Willpalla',0711727065,0115172748,22-04-15);

 INSERT INTO RESIDENT_DOCTOR (RdoctorID,employeeID,specialization,consultationFee,highestQualification,seniority)
VALUES
('1','1','Cardiology',2500,'MD','3 year')
('1','1','Plastic Surgery',2500,'MBBS','4 year')
('1','1','Cardiology',2500,'DO','1 year')
('1','1','Cardiology',2500,'MD','6year')
('1','1','Immunologist',2500,'MBBS','3 year')
('1','1','Cardiology',2500,'MD','2 year')
('1','1','Pediatrician',2500,'DO','4 year')
('1','1','Neonatologist',2500,'MD','1 year')
('1','1','Neonatologist',2500,'MBBS','3 year')
('1','1','Physiologist',2500,'MD','4 year');
 
INSERT INTO ONCALL_DOCTOR (OCdoctorID,employeeID,specialization,consultationFee,feePerCall,paymentDate,highestQualification)
VALUES
('1','1','Dermatology',2000,500,2017/05/01,'MD',)
('1','1','Plastic Surgery',3500,1000,2017/05/01,'MBBS',)
('1','1','Cardiology',2500,600,2017/05/01,'MBBS',)
('1','1','Dentist',2500,500,2017/05/01,'DO',)
('1','1','Gynocologist',3500,600,2017/05/01,'MBBCH',)
('1','1','Cardiology',3500,500,2017/05/01,'MD',)
('1','1','Neonatologist',2500,700,2017/05/01,'DO',)
('1','1','Immunologist',3000,300,2017/05/01'MD',)
('1','1','Neonatologist',2000,500,2017/05/01,'BMBS',)
('1','1','Pediatrician',2500,400,2017/05/01,'MBBS',)

INSERT INTO EMPLOYEETYPE  (employeeTypeID,jobType,salary,prefix,description)
VALUES
('1','1','Medical Assistants',2000,'','Verifies patient information by interviewing patient')
('1','1','Nurse',3500,'','. Nurses plan and provide medical and nursing care to patients in hospital')
('1','1','Janitor',2500,'','Janitor. Keep buildings in clean and orderly condition. Perform heavy cleaning duties, such as cleaning floors, shampooing rugs, washing walls and glass, and removing rubbish.')
('1','1','Diatesian',2500,'','promote good dietary health and treat medical conditions by devising eating plans for patients based on the science of nutrition')
('1','1','Financial Officer',3500,'','eports to the Senior Administrative Officer and is responsible for preparing financial statements, maintaining cash controls, preparing the payroll and personnel administration, purchasing, maintaining accounts payable and managing office operations.')
('1','1','Healthcare Consulting',3500,'','management analysts employed by the healthcare industry. They examine the efficiency, profits and structure of the organization, then offer suggestions on methods of improvement. This career requires a minimum of a bachelor's degree, though a master's degree is generally preferred')
('1','1','Janitor',2500,'','Janitor. Keep buildings in clean and orderly condition. Perform heavy cleaning duties, such as cleaning floors, shampooing rugs, washing walls and glass, and removing rubbish.')
('1','1','Janitor',3000,'','Janitor. Keep buildings in clean and orderly condition. Perform heavy cleaning duties, such as cleaning floors, shampooing rugs, washing walls and glass, and removing rubbish.')
('1','1','Nurse',2000,'','. Nurses plan and provide medical and nursing care to patients in hospital')
('1','1','Nurse',2500,'','. Nurses plan and provide medical and nursing care to patients in hospital')
