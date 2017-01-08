
/*Written by : Mohamed Ikhwan */
INSERT INTO ROOMTYPE (roomTypeID, description,roomPrice) VALUES
('G','general','2000'),
('P','private','4500'),
('C','consultation','700'),
('S','surgery','12000'),
('E','emergency','2200');


INSERT INTO ROOM(roomTypeID,roomID,bedID,status) VALUES -- patientID not in the create tables
('G','1','1','Y'),
('G','1','2','Y'),
('G','1','3','Y'),
('G','2','1','Y'),
('G','2','2','N'),
('G','2','3','N'),
('G','2','4','N'),
('G','2','5','N'),
('P','1','1','Y'),
('P','2','1','Y'),
('P','3','1','Y'),
('P','4','1','N'),
('P','5','1','N'),
('P','6','1','N'),
('S','1','1','Y');

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

/* MHTest + Scan + MHScan + Surgery + MHSurgery*/

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


INSERT INTO MH_SCAN(invoiceID, patientID, testID, testReport, paymentStatus) VALUES 
(1,2, 1,'Patient found to have broken several fingers while trying to play baseball',1),
(2,1, 1,'Patient neck dislocated',1),
(7,1, 4,'MRI Scan found cabbage instead of brain',1),
(8,2, 2,'Baby Appears to be healthy. Father might be disappointed with the race of the child',1),
(8,2, 6,'Anomaly found in the left ventricle of heart. It seems to be beating your name, Sandy.',1),
(8,3, 7,'Patient discovered two potatoes inside the machine. We are not really sure what this scan does. Please advise. ',1),
(8,3, 10,'Baby appears to have retractable wolverine claws inside forearms.',1),
(7,4, 9,'Lungs are busted. Need replacement filters as soon as possible',1),
(6,2, 8,'No significant remarks.',1),
(1,1, 11,'Voidlings present. Need to be dispersed as soon as possible.',1);


INSERT INTO MH_TEST(invoiceID, patientID, scanID, scanReport, paymentStatus) VALUES /*needs to be rewritten*/
(1,2, 1,'Patient found to have broken several fingers while trying to play baseball',1),
(2,1, 1,'Patient neck dislocated',1),
(7,1, 4,'MRI Scan found cabbage instead of brain',1),
(8,2, 2,'Baby Appears to be healthy. Father might be disappointed with the race of the child',1),
(8,2, 6,'Anomaly found in the left ventricle of heart. It seems to be beating your name, Sandy.',1),
(8,3, 7,'Patient discovered two potatoes inside the machine. We are not really sure what this scan does. Please advise. ',1),
(8,3, 10,'Baby appears to have retractable wolverine claws inside forearms.',1),
(7,4, 9,'Lungs are busted. Need replacement filters as soon as possible',1),
(6,2, 8,'No significant remarks.',1),
(1,1, 11,'Voidlings present. Need to be dispersed as soon as possible.',1);

/* http://www.hurleymc.com/services/surgical/types-of-surgery/ */
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
('Ophthalmological Surgery', 6000,'Eye surgery, also known as ocular surgery, is surgery performed on the eye or its adnexa,'),
;	


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
