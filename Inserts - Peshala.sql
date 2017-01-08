



/* by :  Peshala Rasanga */

INSERT INTO EMPLOYEETYPE  (jobType,salary,prefix,description)
VALUES
('Resident Doctor',175000,'RD','Verifies patient information by interviewing patient'),
('Oncall Doctor',125000,'OD','. Nurses plan and provide medical and nursing care to patients in hospital'),
('Janitor',3000,'JA','Janitor. Keep buildings in clean and orderly condition. Perform heavy cleaning duties, such as cleaning floors, shampooing rugs, washing walls and glass, and removing rubbish.'),
('Diatecian',55000,'DI','promote good dietary health and treat medical conditions by devising eating plans for patients based on the science of nutrition'),
('Financial Officer',80000,'FO','Responsible for preparing financial statements, maintaining cash controls, preparing the payroll and personnel administration, purchasing, maintaining accounts payable and managing office operations.'),
('Healthcare Consulting',80000,'HC','They examine the efficiency, profits and structure of the organization, then offer suggestions on methods of improvement.'),
('Lab Staff',80000,'LS','Assiting the nurses and doctors in the lab work'),
('Attendees',75000,'AT','Attending for the needs of the patients'),
('Nurse',80000,'NU','. Nurses plan and provide medical and nursing care to patients in hospital'),
('Department Supervisor',100000,'DS','In charge of supervising the day to day operations of the entire department');



INSERT INTO EMPLOYEE  (employeeTypeID ,departmentID	,firstName ,middleName ,lastName,gender,addressline1,addressline2,addressline3,mobileNO,homeNO,joinDate)
VALUES
('1','1','Upil','Sahan','Thilakasiri','M','200','Urapola','Willpalla','0778968854','0127844596','2013/05/22'),
('1','2','Tasia','Gauvin','Thilakasiri','M','182','kongama lane','Willpalla','0777505279','0112917439','2014/06/28'),
('2','3','Mollie ','Fosdick','Thilakasiri','F','252','jayagama','Willpalla','0774595409','0111354155','2014/09/06'),
('2','4','Ethan ','Hillebrand','Thilakasiri','M','381','weera lane','Willpalla','0778123126','0115122718','2015/04/21'),
('3','5','Uthpala','Wijerathne','Thilakasiri','M','152','jayawardhanapura','kotte','0713010822','0111613999','2016/10/02'),
('4','6','Judah','Josiah Holmes','Justice, Carson B','F','82','kibulawala','homagaama','0761708675','0115673695','2016/03/21'),
('7','7','Nathan','Kenneth Shepard','Ray, Carol Q.','M','22','manipur','koongama','0768702458','0111413465','2015/02/09'),
('8','8','Boris','Vladimir Higgins','Armstrong, Gloria R.','F','28','hongama','Willpalla','0714135152','0119508117','2015/05/31'),
('9','9','Craig','Brendan Murray','Roberts, Nicholas F','M','82','galmaduwa','walikada','0775763819','0113898879','2015/04/22'),
('10','10','Ivan','Howard Palmer','Prince, Thane N.','F','281','rukmala lane','rukmalgama','0711727065','0115172748','2016/04/21');


INSERT INTO RESIDENT_DOCTOR (employeeID,specialization,consultationFee,highestQualification,seniority)
VALUES
('1','Cardiology',2500,'MD','3 year'),
('2','Plastic Surgery',2500,'MBBS','4 year');


INSERT INTO ONCALL_DOCTOR (employeeID,specialization,consultationFee,feePerCall,paymentDate,highestQualification)
VALUES
('3','Dermatology',2000,500,'2017/05/01','MD'),
('4','Plastic Surgery',3500,1000,'2017/05/01','MBBS');

