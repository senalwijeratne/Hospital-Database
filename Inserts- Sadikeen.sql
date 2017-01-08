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

