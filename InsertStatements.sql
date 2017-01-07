
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
('CT Scan', 6000),
('DXA', 7000);	


INSERT INTO MHSCAN(invoiceID, patientID, scanID, scanReport, paymentStatus) VALUES 
(1, 1, 1,'Patient found to have broken several fingers while trying to play baseball',1),
(1, 1, 1,'Patient neck dislocated',0),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),
(1, 1, 1),