/*department*/
INSERT INTO DEPARTMENT (departmentName, departmentLocation, description) VALUES
('Orthopedic','Provides expert treatment in sports medicine, trauma, joint replacement, pediatrics, oncology, spine, shoulder and elbow, foot and ankle, and hand'),
('Pathology','the ward just after emergency on right','that branch of medicine which treats of the essential nature of disease'),
('Emergency','Just after entering the secondary gate of hospital','provides experienced physician as soon as the patient arrived for any emergency case'),
('Dental','left side of building of hospital','provides procedures like Dental Extractions, RCT, Scaling /Cleaning, Fillings, Local curettage'),
('Gynecology','ward 4 in left building of hospital','provides support with all branches of medical facilities for woman'),
('Anesthetic','ward  7 in back of hospital',' responsible for the administration of functions and activities pertaining to the delivery of anesthetics'),
('I.C.U','second floor right side of the building','unit in the hospital where treat seriously ill patient under well experienced staff'),
('Blood Bank','Third floor left of the building','All the blood donations are taken and stored safely for other patients in need')
('Operation Theater','ward 2 in first floor','All operations for the patients are done with experienced doctors'),
('Laboratory','third floor right side of building','Provides accurate reports on the tests done'),
('M.R.I','third floor right side of building',' Magnetic resonance imaging (I) is a department that uses a magnetic field and radio waves to create detailed images of the organs and tissues within your body'),
('Neurology','ward 4 in second building',' specializes in treating diseases of the nervous system'),
('Cardiology','second floor right side','medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease and electrophysiology are treated in this department'),
('Cancer Department','separated building in right after entering from main entrance','Provides treatments by considering the cancel stages'),
('Corpse','ground floor at the back end of the hospital','Provides space for the dead people until the gurdians decisions');

-- facilities
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
('Accommodation','waiting hall with chairs, TVs, public utilities like drinking water and toilets.');

-- /available_facilities/
INSERT INTO AVAILABLE_FACILITIES(departmentID,facilityID) VALUES
(3,1),
(4,2),
(10,3),
(3,7),
(9,4);

-- //patient/
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


-- //test//
INSERT INTO TEST(testName,testFee) VALUES
('Cholesterol ',500),
('Complete blood count ',300 ),
('Fasting blood sugar ',600 ),
('Urea & electrolytes ',700 ),
('Urine full report ',1000 ),
('HIV 4th Generation ',2500 ),
('Pediatric Allergist ',1500 ),
('Tacrolimus ',500 ),
('H-SFABPt ',2000 ),
('Filaria antibody test',3000 );
