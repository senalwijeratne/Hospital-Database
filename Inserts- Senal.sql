INSERT INTO BILL(invoiceID,patientID,paymentMethod,total,paymentStatus) VALUES
(1,1,'cash',10000,0),
(2,8,'credit card',12000,1),
(3,8,'mastercard',75000,1),
(4,3,'cash',153000,0),
(5,10,'visa',7500,1),
(6,9,'credit card',250000,0),
(7,9,'credit card',35000,0),
(8,3,'visa',50000,0),
(9,8,'credit card',101010,0),
(10,2,'credit card',43000,1);

INSERT INTO MHConsultation(invoiceID,consultationID,employeeID,RdoctorID,COdoctorID,patientID,consultationDate,nextCheckUp,doctorReport,paymentStatus) VALUES(10,1,8,6,9,5,'07/24/2016','08/19/16','The patient seems to have a cold',0),
(2,2,9,5,1,8,'02/21/2016','10/19/16','Left femur is fractured',1),
(7,3,1,5,4,10,'01/08/2016','05/05/16','Right ulna bone fracture',1),
(8,4,10,8,9,5,'01/20/2016','02/02/16','The patient has a high fever and a mild cold',0),
(8,5,8,10,10,7,'04/23/2016','04/27/16','The patient is suffering from a muscle tear on the left leg',0),
(8,6,8,6,9,3,'03/01/2016','08/11/16','The patient has an irregular sleep pattern, also has a defficulty falling asleep',0),
(8,7,3,2,6,9,'05/31/2016','12/23/16','The patient has an abnormal growth on the right palm',0),
(7,8,10,8,8,10,'07/18/2016','07/26/16','Abnormal growth on the back of the neck',1),
(6,9,2,4,10,4,'02/14/2016','11/22/16','The patient suffered a concussion, small fracture in skull: rigth-back',1),
(8,10,3,8,2,8,'02/10/2016','09/09/16','The patient claims normal breathing causes pain, tests were reccomended',0);

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

INSERT INTO illness(consultationID,invoiceID,illnessID) VALUES
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