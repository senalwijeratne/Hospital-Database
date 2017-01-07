
/*Written by : Mohamed Ikhwan */
INSERT INTO ROOMTYPE (description,roomPrice) VALUES
('general','2000'),
('private','4500'),
('consultation','700'),
('surgery','12000'),
('emergency','2200');

INSERT INTO ROOM(roomType,roomID,bedNo,status,patientID) VALUES
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


INSERT INTO MHSCAN(invoiceID, patientID, scanID, scanReport, paymentStatus) VALUES 
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


INSERT INTO MHSURGERY(invoiceID, surgeryID, patientID, employeeID, RdoctorID, COdoctorID, timeScheduled, 
	RoomTypeID, roomID, bedID, timeOutOfSurgery, timeInSurgery, preSurgeryNotes, 
	postSurgeryNotes, surgeryReport, paymentStatus) VALUES
(1,1,1,1 
 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
('X-ray', 1000),
