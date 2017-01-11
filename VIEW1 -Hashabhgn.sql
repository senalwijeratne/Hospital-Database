



create view patient_MedicalHistory
AS SELECT
a.invoiceID ,c.consultationID, b.patientID, d.prescriptionID 

FROM bill a, patient b, mh_consultation c, mh_prescription d , mh_admission e , mh_test f, mh_scan g,mh_surgery h

WHERE a.invoiceID = c.invoiceID AND
      a.invoiceID =  d.invoiceID;
	a.invoiceID =  e.invoiceID AND
	a.invoiceID =  f.invoiceID AND
	a.invoiceID =  g.invoiceID AND
	a.invoiceID =  h.invoiceID ;