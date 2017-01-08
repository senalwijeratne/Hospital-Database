/*department*/
INSERT INTO DEPARTMENT VALUES(1,'Orthopedic','Provides expert treatment in sports medicine, trauma, joint replacement, pediatrics, oncology, spine, shoulder and elbow, foot and ankle, and hand'),
(2,'Pathology','the ward just after emergency on right','that branch of medicine which treats of the essential nature of disease'),
(3,'Emergency','Just after entering the secondary gate of hospital','provides experienced physician as soon as the patient arrived for any emergency case'),
(4,'Dental','left side of building of hospital','provides procedures like Dental Extractions, RCT, Scaling /Cleaning, Fillings, Local curettage'),
(5,'Gynecology','ward 4 in left building of hospital','provides support with all branches of medical facilities for woman'),
(6,'Anesthetic','ward  7 in back of hospital',' responsible for the administration of functions and activities pertaining to the delivery of anesthetics'),
(7,'I.C.U','second floor right side of the building','unit in the hospital where treat seriously ill patient under well experienced staff'),
(8,'Blood Bank','Third floor left of the building','All the blood donations are taken and stored safely for other patients in need')
(9,'Operation Theater','ward 2 in first floor','All operations for the patients are done with experienced doctors'),
(10,'Laboratory','third floor right side of building','Provides accurate reports on the tests done'),
(12,'M.R.I','third floor right side of building',' Magnetic resonance imaging (MRI) is a department that uses a magnetic field and radio waves to create detailed images of the organs and tissues within your body'),
(13,'Neurology','ward 4 in second building',' specializes in treating diseases of the nervous system'),
(14,'Cardiology','second floor right side','medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease and electrophysiology are treated in this department'),
(15,'Cancer Department','separated building in right after entering from main entrance','Provides treatments by considering the cancel stages'),
(16,'Corpse','ground floor at the back end of the hospital','Provides space for the dead people until the gurdians decisions');

-- facilities
INSERT INTO FACILITIES(facilityID,facilityName,facilityDescription) VALUES
(1,'X-rays','a photographic or digital image of the internal composition of something, especially a part of the body, produced by X-rays being passed through it and being absorbed to different degrees by different materials.'),
(2,'Care Takers','An arrangement can be made to assign a personal care taker for a patient.'),
(3,'Fluid Test','The gustatory profiling, quality and consistency of bodily fluids will be tested be trained professionals'),
(4,'ECG','24hours ECG services including machine report, done by trained staff'),
(5,'Pharmacy','Free reliable quality medicines are available to beneficiaries on doctor prescription during OPD hours'),
(6,'MRI','Magnetic resonance imaging-MRI- is a type of scan that uses strong magnetic fields and radio waves to produce detailed images of the inside of the body. An MRI scanner is a large tube that contains powerful magnets.'),
(7,'Ambulance','24 hours patient transport vehicle available.'),
(8,'Physiotherapy','Range of physiotherapy services to assist the patients to recover from wide range of musculoskeletal pain-ful disorders. Available modalities are MWD, SWD, U/S, TENS, IFC laser therapy traction unit, magnolia.'),
(9,'Minor Surgeries','Provides services for minor surgical procedure like dressing of lacerated wound, suturing of minor lacerations & resuturing, excision of corns and sebaceous cysts (done under local anesthesia.)'),
(10,'Accommodation','waiting hall with chairs, TVs, public utilities like drinking water and toilets. Sub waiting areas are available in front of individual consultation rooms. Wheel chairs, trolleys and attendants are there to help very sick patients through out the hospital.');

-- /available_facilities/
INSERT INTO AVAILABLE_FACILITIES(departmentID,facilityID) VALUES
(3,1),
(4,2),
(10,3),
(3,7),
(9,4);

-- //patient/
INSERT INTO PATIENT(patientID,NIC,passportNO,firstName,middleName,lastName,age,gender,addressline1,addressline2,addressline3,DOB,contactNo,nextOfKin,nextofKinNo,patientStatus) VALUES(1,'961421563v','','Namal','Premadasa','Kapuge',65 ,'M','31/a','dan lane','kuragama','1996/2/20','0774301808','J.kuragama','0773301868','discharged'),

(2 ,'501426563v','','Kamali','Maldiwa','Sirisena',40 ,'F','65/2','lime','pindasale','1950/5/20','0773301868','K.Sirisena','0775301804','discharged'),
(3 ,'7561429563v','','Samanmali','Gunathi','Rajapaksha',20 ,'F',' 20/5','janatha lane','jayawardhanapura','1975/2/23','0774301908','G.Rajapaksha','0754301528','discharged'),
(4 ,'431421563v','','Randula','Prasan','Kulathunga',34 ,'M',' 245/1','hongama lane','maharagama','1973/2/20','0775301804','W.Kulathunga','0773301868','insurgery'),
(5 ,'931423563v','','Geeth','Lakshan','Weerasingha',56 ,'M','46/2','walmal lane','malabe','1993/2/20','0714301867','A.Weerasingha','0773305298','discharged'),
(6 ,'991826563v','','Prashan','Sumanadasa','Bandara',13 ,'M','50/b','sakura lane','Colombo 1','1999/2/10','0754301528','S.Bandara','0713301868','admitted'),
(7 ,'861425563v','','Rammali','Jayamani','Karunarathna',48 ,' F','40/3','fernando lane','colombo 5','1986/6/20','0774318808','T.Karunarathna','0775301804','discharged'),
(8 ,'681461563v','','Ravindu','Ishara','Wijesingha',36 ,'M','401/2','janashakthi lane','thalawathugoda','1968/2/20','0724301808','S.Wijesingha','0725301404','discharged'),
(9 ,'591321563v','','Geethma','Saduni','Kulunthunga',19 ,'F','20/1','kusalpura','Ahangama','1959/2/20','0774301768','K.Kulathunga','0753505298','admitted'),
(10 ,'731429563v','','Nuwan','Pradarshana','Wimalasena',51 ,'M','30/2','weerakkodi lane','maharagama','1973/2/20','0724301728','P.Wimalasena','0713305278','admitted');


-- //test//
INSERT INTO TEST(testID,testName,testFee) VALUES(1,'Cholesterol ',500),
(2,'Complete blood count ',300 ),
(3,'Fasting blood sugar ',600 ),
(4,'Urea & electrolytes ',700 ),
(5,'Urine full report ',1000 ),
(6,'HIV 4th Generation ',2500 ),
(7,'Pediatric Allergist ',1500 ),
(8,'Tacrolimus ',500 ),
(9,'H-SFABPt ',2000 ),
(10,'Filaria antibody test',3000 );