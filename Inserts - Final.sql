-- 1.Department > -- Hashan 
	INSERT INTO DEPARTMENT (departmentName, departmentLocation, description) VALUES
	('Orthopedic','8th ward','Provides expert treatment in sports medicine, trauma, joint replacement, pediatrics, oncology, spine, shoulder and elbow, foot and ankle, and hand'),
	('Pathology','the ward just after emergency on right','that branch of medicine which treats of the essential nature of disease'),
	('Emergency','Just after entering the secondary gate of hospital','provides experienced physician as soon as the patient arrived for any emergency case'),
	('Dental','left side of building of hospital','provides procedures like Dental Extractions, RCT, Scaling /Cleaning, Fillings, Local curettage'),
	('Gynecology','ward 4 in left building of hospital','provides support with all branches of medical facilities for woman'),
	('Anesthetic','ward  7 in back of hospital',' responsible for the administration of functions and activities pertaining to the delivery of anesthetics'),
	('I.C.U','second floor right side of the building','unit in the hospital where treat seriously ill patient under well experienced staff'),
	('Blood Bank','Third floor left of the building','All the blood donations are taken and stored safely for other patients in need'),
	('Operation Theater','ward 2 in first floor','All operations for the patients are done with experienced doctors'),
	('Laboratory','third floor right side of building','Provides accurate reports on the tests done'),
	('M.R.I','third floor right side of building',' Magnetic resonance imaging is a department that uses a magnetic field and radio waves to create detailed images of the organs and tissues within your body'),
	('Neurology','ward 4 in second building',' specializes in treating diseases of the nervous system'),
	('Cardiology','second floor right side','medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease and electrophysiology are treated in this department'),
	('Cancer Department','separated building in right after entering from main entrance','Provides treatments by considering the cancel stages'),
	('Mortuary','ground floor at the back end of the hospital','Provides space for the dead people until the gurdians decisions');  -- Hashan

-- 2.Facilities > -- Hashan 
	INSERT INTO FACILITIES(facilityName,facilityDescription) VALUES
	('X-rays','a photographic or digital image of the internal composition of something, produced by X-rays being passed through it and being absorbed to different degrees by different materials.'),
	('Care Takers','An arrangement can be made to assign a personal care taker for a patient.'),
	('Fluid Test','The gustatory profiling, quality and consistency of bodily fluids will be tested be trained professionals'),
	('ECG','24hours ECG services including machine report, done by trained staff'),
	('Pharmacy','Free reliable quality medicines are available to beneficiaries on doctor prescription during OPD hours'),
	('MRI','Magnetic resonance imaging-MRI- is a type of scan that uses strong magnetic fields and radio waves to produce detailed images of the inside of the body.'),
	('Ambulance','24 hours patient transport vehicle available.'),
	('Physiotherapy','Range of physiotherapy services to assist the patients to recover from wide range of musculoskeletal pain-ful disorders.'),
	('Minor Surgeries','Provides services for minor surgical procedure like dressing of lacerated wound etc.'),
	('Accommodation','waiting hall with chairs, TVs, public utilities like drinking water and toilets.');	-- Hashan

-- 3.AvailableFacilities > -- HASHAN needs to be re written
	INSERT INTO AVAILABLE_FACILITIES(departmentID,facilityID) VALUES
	(3,1),
	(4,2),
	(10,3),
	(3,7),
	(9,4); 

-- 4.Patient > -- Hashan 
	INSERT INTO PATIENT(NIC,firstName,middleName,lastName,gender,addressline1,addressline2,addressline3,DOB,contactNo,nextOfKin,nextofKinNo,patientStatus) VALUES
	('961421563v','Namal','Premadasa','Kapuge','M','31/a','dan lane','kuragama','1996/2/20','0774301808','J.kuragama','0773301868','discharged'),
	('501426563v','Kamali','Maldiwa','Sirisena' ,'F','65/2','lime','pindasale','1950/5/20','0773301868','K.Sirisena','0775301804','discharged'),
	('756142953v','Samanmali','Gunathi','Rajapaksha' ,'F',' 20/5','janatha lane','jayawardhanapura','1975/2/23','0774301908','G.Rajapaksha','0754301528','discharged'),
	('431421563v','Randula','Prasan','Kulathunga','M',' 245/1','hongama lane','maharagama','1973/2/20','0775301804','W.Kulathunga','0773301868','insurgery'),
	('931423563v','Geeth','Lakshan','Weerasingha','M','46/2','walmal lane','malabe','1993/2/20','0714301867','A.Weerasingha','0773305298','discharged'),
	('991826563v','Prashan','Sumanadasa','Bandara','M','50/b','sakura lane','Colombo 1','1999/2/10','0754301528','S.Bandara','0713301868','admitted'),
	('861425563v','Rammali','Jayamani','Karunarathna','F','40/3','fernando lane','colombo 5','1986/6/20','0774318808','T.Karunarathna','0775301804','discharged'),
	('681461563v','Ravindu','Ishara','Wijesingha','M','401/2','janashakthi lane','thalawathugoda','1968/2/20','0724301808','S.Wijesingha','0725301404','discharged'),
	('591321563v','Geethma','Saduni','Kulunthunga','F','20/1','kusalpura','Ahangama','1959/2/20','0774301768','K.Kulathunga','0753505298','admitted'),
	('731429563v','Nuwan','Pradarshana','Wimalasena','M','30/2','weerakkodi lane','maharagama','1973/2/20','0724301728','P.Wimalasena','0713305278','admitted');  

-- 5.EmployeeType > -- Peshala 	
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

-- 6.Employee >  -- Peshala  
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

-- 7.Resident_Doctor > -- Peshala 
	INSERT INTO RESIDENT_DOCTOR (employeeID,specialization,consultationFee,highestQualification,seniority)
	VALUES
	('1','Cardiology',2500,'MD','3 year'),
	('2','Plastic Surgery',2500,'MBBS','4 year');

-- 8.OnCall_Doctor > -- Peshala 
	INSERT INTO ONCALL_DOCTOR (employeeID,specialization,consultationFee,feePerCall,paymentDate,highestQualification)
	VALUES
	('3','Dermatology',2000,500,'2017/05/01','MD'),
	('4','Plastic Surgery',3500,1000,'2017/05/01','MBBS');		

-- 9.Bill > -- Senal 
	INSERT INTO BILL(patientID,paymentMethod,total,paymentStatus) VALUES
	(1,'cash',0,'N'),
	(8,'mastercard',0,'Y'),
	(8,'mastercard',0,'Y'),
	(3,'cash',0,'N'),
	(10,'visa',0,'Y'),
	(9,'mastercard',0,'N'),
	(9,'mastercard',0,'N'),
	(3,'visa',0,'N'),
	(8,'visa',0,'N'),
	(2,'mastercard',0,'Y');

-- 10.MHConsultation > -- Senal 
	INSERT INTO MH_Consultation(invoiceID,employeeID,RdoctorID,COdoctorID,patientID,consultationDate,nextCheckUp,doctorReport,paymentStatus) 
	VALUES
	(1,2,2,NULL,5,'2016/07/24','2016/08/19','The patient seems to have a cold',0),
	(2,1,1,NULL,8,'2016/02/21','2016/10/19','Left femur is fractured',1),
	(7,1,1,NULL,10,'2016/01/08','2016/05/05','Right ulna bone fracture',1),
	(8,2,2,NULL,5,'2016/01/20','2016/02/02','The patient has a high fever and a mild cold',0),
	(8,2,2,NULL,7,'2016/04/23','2016/04/27','The patient is suffering from a muscle tear on the left leg',0),
	(8,3,NULL,1,3,'2016/03/01','2016/08/11','The patient has an irregular sleep pattern, also has a defficulty falling asleep',0),
	(8,3,NULL,1,9,'2016/05/31','2016/12/23','The patient has an abnormal growth on the right palm',0),
	(7,4,NULL,2,10,'2016/07/18','2016/07/26','Abnormal growth on the back of the neck',1),
	(6,2,2,NULL,4,'2016/02/14','2016/11/22','The patient suffered a concussion, small fracture in skull: rigth-back',1),
	(1,1,1,NULL,8,'2016/02/10','2016/09/09','The patient claims normal breathing causes pain, tests were reccomended',0);

-- 11.Illness >  
	INSERT INTO illness(illnessName,illnessDescription) VALUES
	('Cold','Colds usually last 1–2 weeks. However, you could get a bacterial infection after a cold, such as an ear infection or sinus infection, which may mean you’re unwell for longer.'),
	('Asthma','A person’s asthma triggers cause their airways to tighten, partially close up, swell inside and make more mucus. This makes it hard for the person to breathe in – and even harder to breathe out.'),
	('Bronchiectasis','Bronchiectasis happens when the breathing tubes (lled bronchi) in the lungs have been damaged and enlarged – usually due to infection. This causes mucus to build up in the extra space.'),
	('Arthritis','Arthritis is a form of joint disorder that involves inflammation of one or more joints. The major complaint by individuals who have arthritis is joint pain.'),
	('Erectile dysfunction','Erectile dysfunction or impotence is sexual dysfunction characterized by the inability to develop or maintain an erection of the penis during sexual activity.'),
	('Hemorrhage','Bleeding, technically known as hemorrhaging or haemorrhaging, is blood escaping from the circulatory system.'),
	('Gestational Diabetes','Gestational diabetes is a type of diabetes that develops, or is first diagnosed, during pregnancy. The condition, like other forms of diabetes, involves high blood sugar levels.'),
	('Macular Degeneration.','Deterioration in the central area of the retina.'),
	('Insomnia','Sleep disorder characterized by difficulties falling or staying asleep.'),
	('Hepatitis','Hepatitis is the inflammation of the liver. Although hepatitis can be the symptom of many illnesses, including autoimmune diseases, it is most often caused by a viral infection.');

-- 12.MHConsultation_Illness >
	INSERT INTO MHConsultation_Illness(consultationID,invoiceID,illnessID) VALUES
	(7,1,6),
	(4,6,10),
	(7,2,7),
	(1,8,5),
	(9,10,3),
	(8,4,4),
	(7,2,2),
	(9,7,3),
	(4,9,5),
	(5,10,10);

-- 13.Symptoms > -- Ikhwan
	INSERT INTO SYMPTOM (symptomName,symptomDescription) VALUES
	('Headache','a continuous pain in the head.'),
	('Fever','an abnormally high body temperature, usually accompanied by shivering, headache, and in severe instances, delirium.'),
	('Nausea','a feeling of sickness with an inclination to vomit.'),
	('Dizzyness','used to describe a range of sensations, such as feeling faint, woozy, weak or unsteady.'),
	('Coughing','expel air from the lungs with a sudden sharp sound.'),
	('Runny Nose','when liquid comes out of your nose because of a cold or allergy'),
	('Persistant Arousal','results in a spontaneous, persistent, and uncontrollable genital arousal, with or without orgasm or genital engorgement, unrelated to any feelings of sexual desire.'),
	('Shortness of Breath','Difficulty in breathing'),
	('Tired','in need of sleep or rest; weary.'),
	('Aching','sore; throbbing with pain.'),
	('Stomachache','a pain in a persons belly.'),
	('Sore Throat','a condition marked by pain in the throat, typically caused by inflammation due to a cold or other virus.'),
	('Soreness','physically painful or sensitive, as a wound, hurt, or diseased part'),
	('Slight Pain','small amount of pain'),
	('Medium Pain','medium amount of pain'),
	('Intense Pain','intense amount of pain');

-- 14.MHConsultation_Symptoms >
	INSERT INTO MHCONSULTATION_SYMPTOMS (invoiceID,consultationID,symptomID)
	VALUES(1,,4,6),
	(2,6,7),
	(3,1,3),
	(4,5,8),
	(5,4,6),
	(6,2,9),
	(7,7,10),
	(8,9,2),
	(9,10,1),
	(10,8,5); 

-- 15.Drugs >
	INSERT INTO DRUGS(drugID, drugName, drugCompany, drugPrice, drugPurpose, legalClassification)

	VALUES (1,'Acetaminophen','Abbot Laboratories',20.00,'Relieving severe headache', 'Class B'),
	(2,'Adapalene','Grifols',15.00,'Reduces stomach bloating', 'Class C'),
	(3,'Gablofen','Julphar',26.00,'Treats acne blemishes', 'Class B'),
	(4,'Palerfirmin','Abbvie',12.00,'Relieves muscle pain', 'Class C'),
	(5,'Lamotrigine','Diabetology Ltd.',13.50,'Increases insulin levels', 'Class C'),
	(6,'Kantrex','Hovione',23.00,'Anti-Depressant','Class C'),
	(7,'Yohimbine','Noxxon',45.00,'Enhances hair growth','Class B'),
	(8,'Ibuprofen','Reckitt Benckiser',9.00,'Relieves muscle pain','Class B'),
	(9,'Panretin','Sunovione',20.00,'Boosts blood glucose levels','Class C'),
	(10,'Cabergoline','Renovo',35.00,'Promotes better skin','Class B');

-- 16.MH_Prescription >
	INSERT INTO MH_PRESCRIPTION(consultationID, invoiceID, prescriptionID, drugID, startDate,

	prescribedDuration, prescribedDosage, paymentStatus)

	VALUES (3,2,1,4,'2016/02/09','3 months', 'Twice per day', 1),
	 (7,4,2,7, '2016/02/15','2 months', 'Thrice per day', 0),
	 (9,3,3,5, '2016/01/03','5 months', 'Twice per day', 1),
	 (8,9,4,3, '2016/05/25','2 months', 'Once per day', 1),
	 (5,6,5,6, '2016/04/13','2 months', 'Twice per day', 1),
	 (2,8,6,2, '2016/01/20','4 months', 'Twice per day', 0),
	 (6,1,7,9, '2016/06/25','5 months', 'Once per day', 1),
	 (4,7,8,10, '2016/11/23','3 months', 'Thrice per day', 0),
	 (1,5,9,1, '2016/07/15','4 months', 'Twice per day', 1),
	 (10,10,10,8, '2016/10/14','2 months', 'Twice per day', 1);

-- 17.RoomType >
	INSERT INTO ROOMTYPE (roomTypeID,description,roomPrice) VALUES
	('G','general','2000'),
	('P','private','4500'),
	('C','consultation','700'),
	('S','surgery','12000'),
	('E','emergency','2200');

-- 18.Room >
	INSERT INTO ROOM(roomType,roomID,bedNo,status,patientID) VALUES -- patientID not in the create tables
	('1','1','1','1','1'),
	('1','1','2','1','2'),
	('1','1','3','1','3'),
	('1','2','1','1','4'),
	('1','2','2','0',NULL),
	('1','2','3','0',NULL),
	('1','2','3','0',NULL),
	('1','2','4','0',NULL),
	('2','1','1','1','5'),
	('2','2','1','1','6'),
	('2','3','1','1','7'),
	('2','4','1','0',NULL),
	('2','5','1','0',NULL),
	('2','6','1','0',NULL),
	('4','1','1','1','8');

-- 19.MH_Admissions >
	INSERT INTO MH_ADMISSION (admissionID, invoiceID, patientID, roomTypeID, roomID, bedID,

	admissionDate, dischargeDate, paymentStatus, treatmentAdvice, initialCondition)

	VALUES (1, 5, 2, 3, 4, 1,'2016/05/03', '2016/05/20',1,'Manage work stress', 'Severe Headache and
	nausea'),
	 (2,6,7,2,8,9, '2016/04/15', '2016/05/05',0, 'Quit smoking' ,'Shortness of breath and
	chest pain'),
	 (3,2,8,4,9,6, '2016/07/09', '2016/07/21',0, 'Take medicine as prescribed', 'Medium
	phlegm and fever'),
	 (4,5,3,1,10,4, '2016/02/22', '2016/04/10',1,' Drink Water as much as possible', 'Burning
	sensation when urinating'),
	 (5,3,9,10,8,7, '2016/05/15', '2016/05/27',1,'Consume food containing fiber', 'Loss of
	appetite and bloating of the stomach'),
	 (6, 9, 1, 5,3,10, '2016/02/03', '2016/05/20',0, 'please stop drinking',' Inflammation of
	the liver'),
	 (7,7,10,9,6,8, '2016/06/11', '2016/06/30',1,'Be consistent in taking meals on time',' Bloating
	of the stomach and severe abdomen pain'),
	 (8,1,8,3,7,2, '2016/03/09', '2016/04/03',0, 'Reschedule sleeping hours', 'Severe
	headache and stress'),
	 (9,4,6,7,4,3, '2016/08/21', '2016/09/12',0,' Exercise daily', 'Breathing disorder'),
	 (10,10,9,8,5,5, '2016/01/24', '2016/03/20',1,'Maintain a quiet restful environment', 'Severe
	headache');

-- 20.Test >
   -- Hashan


-- 21.MHTest > 
	INSERT INTO MH_TEST(invoiceID, patientID, scanID, scanReport, paymentStatus) VALUES /*needs to be rewritten*/
	(1, 1, 1,'Patient found to have broken several fingers while trying to play baseball',1),
	(2, 2, 1,'Patient neck dislocated',1),
	(2, 2, 4,'MRI Scan found cabbage instead of brain',1),
	(3, 3, 2,'Baby Appears to be healthy. Father might be disappointed with the race of the child',1),
	(4, 4, 6,'Anomaly found in the left ventricle of heart. It seems to be beating your name, Sandy.',1),
	(5, 5, 7,'Patient discovered two potatoes inside the machine. We are not really sure what this scan does. Please advise. ',1),
	(6, 6, 10,'Baby appears to have retractable wolverine claws inside forearms.',1),
	(7, 7, 9,'Lungs are busted. Need replacement filters as soon as possible',1),
	(8, 8, 8,'No significant remarks.',1),
	(9, 9, 11,'Voidlings present. Need to be dispersed as soon as possible.',1);

-- 22.Scan >
	INSERT INTO SCAN(scanName, scanFee) VALUES 
	('X-ray', 1000),
	('Foetal Ultrasound', 2000),
	('PET/CT Scan', 3000),
	('MRI Scan', 4000),
	('Ultrasound', 5000),
	('Cardiac Calcium Scoring', 6000),
	('PET/MR', 7000),
	('Mammography', 6000),
	('Low Dose CT Lung Screening', 6000),
	('Dual Energy X-ray Absorptiometry ', 6000),
	('Voiding Cystourethrogram ', 7000);

-- 23.MHScan > 
	INSERT INTO MH_SCAN(invoiceID, patientID, testID, testReport, paymentStatus) VALUES 
	(1, 1, 1,'Patient found to have broken several fingers while trying to play baseball',1),
	(2, 2, 1,'Patient neck dislocated',1),
	(2, 2, 4,'MRI Scan found cabbage instead of brain',1),
	(3, 3, 2,'Baby Appears to be healthy. Father might be disappointed with the race of the child',1),
	(4, 4, 6,'Anomaly found in the left ventricle of heart. It seems to be beating your name, Sandy.',1),
	(5, 5, 7,'Patient discovered two potatoes inside the machine. We are not really sure what this scan does. Please advise. ',1),
	(6, 6, 10,'Baby appears to have retractable wolverine claws inside forearms.',1),
	(7, 7, 9,'Lungs are busted. Need replacement filters as soon as possible',1),
	(8, 8, 8,'No significant remarks.',1),
	(9, 9, 11,'Voidlings present. Need to be dispersed as soon as possible.',1);

-- 24.Surgery >
	INSERT INTO SURGERY(surgeryName, surgeryFee, surgeryDescription) VALUES 
	('Outpatient Surgery', 7000,' same day surgery or ambulatory surgery'),
	('Bariatric Surgery', 1000,''),
	('Breast Augmentation Surgery', 2000,'surgery for reconstructive purposes after breast cancer surgery (for example), to correct a breast defect, to increase breast size, or to achieve a younger, more natural appearance.'),
	('Colon and Rectal Surgery', 3000,' advanced surgical and minimally invasive (laparoscopic) options. '),
	('Endocrine Surgery', 4000,'Endocrine surgery is a surgical sub-speciality focusing on surgery of the endocrine glands, including the thyroid gland, the parathyroid glands, the adrenal glands, glands of the endocrine pancreas, and some neuroendocrine glands.'),
	('General Surgery', 5000,'Surgery can be an effective treatment option for a wide range of diseases and disorders'),
	('Gynecological Surgery', 6000,'Gynecological surgery refers to surgery on the female reproductive system.'),
	('Hand Surgery', 7000,'For certain hand injuries and conditions, a better result can be achieved with arthroscopic surgery, '),
	('Head and Neck Surgery', 6000,'Early identification and treatment of oral, head and neck disorders means a higher rate of positive outcomes'),
	('Neurosurgery', 6000,'Specializing in surgery on the brain and other parts of the nervous system'),
	('Ophthalmological Surgery', 6000,'Eye surgery, also known as ocular surgery, is surgery performed on the eye or its adnexa,');	

-- 25.MH_Surgery
	INSERT INTO MHSURGERY(invoiceID, surgeryID, patientID, employeeID, RdoctorID, COdoctorID, timeScheduled, 
	RoomTypeID, roomID, bedID, timeOutOfSurgery, preSurgeryNotes, 
	postSurgeryNotes, surgeryReport, paymentStatus) VALUES
	(1,1,1,1,1,NULL,
	'20170101 10:00:00 AM',4,1,1,'20170101 11:00:00 AM', 
	'patient requires careful attention to fluctuations in blood pressure.',
	'Surgery progressed without any complications.',
	'Hip replacement surgery successfully completed on the right side.',
	1),
	(1,2,1,1,1,NULL,
	'20170102 8:00:00 AM',4,2,1,'20170102 11:00:00 AM', 
	'patient has successfully fasted for 12 hours prior to surgery',
	'Surgery progressed without any complications.',
	'Removed portion of the stomach.',
	1),
	(2,3,2,2,NULL,1, --doctor is a CO doctor... might run into issues here
	'20170103 10:00:00 AM',4,1,1,'20170103 11:00:00 AM', 
	'Patient requested smaller mammarian glands',
	'Surgery progressed without any complications.',
	'Reduced mammary glands',
	1),
	(3,4,3,1,1,NULL,
	'20170104 10:00:00 AM',4,1,1,'20170104 11:00:00 AM', 
	'Cavities have been expunged of any foreign material before surgery',
	'Surgery progressed without any complications.',
	'Colon surgery completed. Follow up required.',
	1),
	(4,5,4,1,1,NULL,
	'20170106 10:00:00 AM',4,1,1,'20170106 11:00:00 AM', 
	'Immediate surgery recommended',
	'Surgery progressed without any complications.',
	'Endocrine surgery performed in record time.',
	1),
	(5,6,5,1,1,NULL,
	'20170107 10:00:00 AM',4,1,1,'20170107 11:00:00 AM', 
	'Patient requires care in being put under anesthesia',
	'Surgery progressed without any complications.',
	'Knee ligament surgery successfully completed on the left knee.',
	1),
	(6,6,6,1,1,NULL,
	'20170108 10:00:00 AM',4,1,1,'20170108 11:00:00 AM', 
	'patient requires careful attention to diet prior to surgery',
	'Surgery progressed without any complications.',
	'Kidney removed with prejudice.',
	1),
	(7,8,7,1,1,NULL,
	'20170109 10:00:00 AM',4,1,1,'20170109 11:00:00 AM', 
	'Need to re connect nervous system',
	'Surgery progressed without any complications.',
	'Patient can now play the piano like a maestro.',
	1),
	(8,1,8,1,1,NULL,
	'20170110 10:00:00 AM',4,1,1,'20170110 11:00:00 AM', 
	'Pubic hair needs to be removed prior to surgery',
	'Surgery progressed without any complications.',
	'Prostate surgery completed',
	1),
	(9,1,9,1,1,NULL,
	'20170111 10:00:00 AM',4,1,1,'20170111 11:00:00 AM', 
	'Pubic hair needs to be removed prior to surgery',
	'Surgery progressed without any complications.',
	'Vasectomy performed.',
	1);
