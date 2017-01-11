INSERT INTO BILL(patientID,paymentMethod,total,paymentStatus) VALUES
(1,'cash',0,'N'),
(8,'mastercard',0,'Y'),
(8,'mastercard',0,'Y'),
(3,'cash',0,'N'),
(10,'visa',0,'Y'),
(9,'mastercard',0,'N'),
(9,'mastercard',0,'N'),
(3,'visa',0,0),
(8,'visa',0,'N'),
(2,'mastercard',0,'Y');

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



MHConsultation_Illness
INSERT INTO MHConsultation_illness(consultationID,invoiceID,illnessID) VALUES
(1,1,6),
(2,2,10),
(3,7,7),
(4,8,5),
(5,8,3),
(6,8,4),
(7,8,2),
(8,7,3),
(9,6,5),
(10,1,10);