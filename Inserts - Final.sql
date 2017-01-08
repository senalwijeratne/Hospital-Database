-- 1.Department > 
-- 2.Facilities > 
-- 3.AvailableFacilities > 
-- 4.Patient > 
-- 5.EmployeeType >
-- 6.Employee >
-- 7.Resident_Doctor > 
-- 8.OnCall_Doctor >

-- 9.Bill >
	INSERT INTO BILL(invoiceID,patientID,paymentMethod,total,paymentStatus) VALUES
	(1,1,'cash',0,0),
	(2,8,'credit card',0,1),
	(3,8,'mastercard',0,1),
	(4,3,'cash',0,0),
	(5,10,'visa',0,1),
	(6,9,'credit card',0,0),
	(7,9,'credit card',0,0),
	(8,3,'visa',0,0),
	(9,8,'credit card',0,0),
	(10,2,'credit card',0,1);

-- 10.MHConsultation >
	INSERT INTO MHConsultation(invoiceID,consultationID,employeeID,RdoctorID,COdoctorID,patientID,consultationDate,nextCheckUp,doctorReport,paymentStatus) VALUES(10,1,8,6,9,5,'2016/07/24','2016/08/19','The patient seems to have a cold',0),
	(2,2,9,5,1,8,'2016/02/21','2016/10/19','Left femur is fractured',1),
	(7,3,1,5,4,10,'2016/01/08','2016/05/05','Right ulna bone fracture',1),
	(8,4,10,8,9,5,'2016/01/20','2016/02/02','The patient has a high fever and a mild cold',0),
	(8,5,8,10,10,7,'2016/04/23','2016/04/27','The patient is suffering from a muscle tear on the left leg',0),
	(8,6,8,6,9,3,'2016/03/01','2016/08/11','The patient has an irregular sleep pattern, also has a difficulty falling asleep',0),
	(8,7,3,2,6,9,'2016/05/31','2016/12/23','The patient has an abnormal growth on the right palm',0),
	(7,8,10,8,8,10,'2016/07/18','2016/07/26','Abnormal growth on the back of the neck',1),
	(6,9,2,4,10,4,'2016/02/14','2016/11/22','The patient suffered a concussion, small fracture in skull: rigth-back',1),
	(8,10,3,8,2,8,'2016/02/10','2016/09/09','The patient claims normal breathing causes pain, tests were reccomended',0); 
-- 11.Illness > 
	INSERT INTO illness(illnessID,illnessName,illnessDescription) VALUES
	(1,'Cold','Colds usually last 1–2 weeks. However, you could get a bacterial infection after a cold, such as an ear infection or sinus infection, which may mean you’re unwell for longer.'),
	(2,'Asthma','A person’s asthma triggers cause their airways to tighten, partially close up, swell inside and make more mucus. This makes it hard for the person to breathe in – and even harder to breathe out.'),
	(3,'Bronchiectasis','Bronchiectasis happens when the breathing tubes (called bronchi) in the lungs have been damaged and enlarged – usually due to infection. This causes mucus to build up in the extra space.'),
	(4,'Arthritis','Arthritis is a form of joint disorder that involves inflammation of one or more joints. The major complaint by individuals who have arthritis is joint pain.'),
	(5,'Erectile dysfunction','Erectile dysfunction or impotence is sexual dysfunction characterized by the inability to develop or maintain an erection of the penis during sexual activity.'),
	(6,'Hemorrhage','Bleeding, technically known as hemorrhaging or haemorrhaging, is blood escaping from the circulatory system. Bleeding can occur internally, where blood leaks from blood vessels inside the body, or externally, either through a natural opening such as the mouth, nose, ear, urethra, vagina or anus, or through a break in the skin. Hypovolemia is a massive decrease in blood volume, and death by excessive loss of blood is referred to as exsanguination. '),
	(7,'Gestational Diabetes','Gestational diabetes is a type of diabetes that develops, or is first diagnosed, during pregnancy. The condition, like other forms of diabetes, involves high blood sugar levels.'),
	(8,'Macular Degeneration.','Deterioration in the central area of the retina.'),
	(9,'Insomnia','Sleep disorder characterized by difficulties falling or staying asleep.'),
	(10,'Hepatitis','Hepatitis is the inflammation of the liver. Although hepatitis can be the symptom of many illnesses, including autoimmune diseases, it is most often caused by a viral infection.');

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


-- 13.Symptoms > 
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
	INSERT INTO ROOMTYPE (description,roomPrice) VALUES
	('general','2000'),
	('private','4500'),
	('consultation','700'),
	('surgery','12000'),
	('emergency','2200');
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
-- 21.MHTest > 

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
