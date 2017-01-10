Create procedure Generate_final (@patientID int) as 
BEGIN
-- check whether the patient has not yet paid bills

-- if not then loop through all tables finding which ones are unpaid from  admittedyes and start summing
-- admission, prescription, scanfee, testfee, surgeryfee, consultationfee,
-- insert sum to invoice record 
-- if bills are paid then print statement and break out of procedure;
    
    
    -- patientID = 9 
    -- invoiceID = 6
    -- if the patient has not yet paid bills
    IF ( (EXISTS (Select paymentStatus FROM Bill  Where patientID = @patientID AND admittedTransaction = 'Y')) 
        )
    BEGIN


        PRINT 'patientID '+CONVERT(varchar,@patientID)+' has unpaid Bills.';
        
        -- create totalBill variable
        DECLARE @totalBill money;
        declare @totalRoomFees money;
        declare @RdoctorFees money;
        declare @OCdoctorFees money;
        declare @surgeryFees money;
        declare @scanFees money;
        declare @testFees money;
        declare @drugFees money;

        -- get invoiceID
        DECLARE @invoiceID int;
        SET @invoiceID = (Select invoiceID FROM Bill  Where patientID = @patientID AND admittedTransaction = 'Y');
        PRINT @invoiceID;

        -- check MHAdmissions 
        IF ( (EXISTS (select invoiceID from room_fees where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of admissions
                set @totalRoomFees = (select SUM(totalRoomFee) from room_fees where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @totalRoomFees;  
                
                -- update bill with new value
                UPDATE bill
                SET total =(select total from bill where invoiceID = @invoiceID) + @totalRoomFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE BEGIN 
            PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no admission entry';
        END


         -- check Consultation for Rdoctor 
        IF ( (EXISTS (select invoiceID from R_doctorConsultfee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of RdoctorFees
                set @RdoctorFees = (select SUM(consultationFee) from R_doctorConsultfee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @RdoctorFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total =(select total from bill where invoiceID = @invoiceID ) +  @RdoctorFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no R doctor fee';
            END

           -- check Consultation for ocdoctor   
         IF ( (EXISTS (select invoiceID from OC_doctorconsultfee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of RdoctorFees
                set @RdoctorFees = (select SUM(consultationFee) from OC_doctorconsultfee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @RdoctorFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total = (select total from bill where invoiceID = @invoiceID ) +  @OCdoctorFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no OC doctor fee';
            END


        -- Check Surgery fees
        IF ( (EXISTS (select invoiceID from surgery_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of SURGERY
                set @surgeryFees = (select SUM(surgeryFee) from surgery_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @surgeryFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total = (select total from bill where invoiceID = @invoiceID ) +  @surgeryFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no surgery fee';
            END

        -- Check Scan fees
        IF ( (EXISTS (select invoiceID from scan_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of scan
                set @scanFees = (select SUM(scanFee) from scan_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @scanFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total = (select total from bill where invoiceID = @invoiceID ) +  @scanFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no scan fee';
            END
    
           
         
         -- Check test fees
        IF ( (EXISTS (select invoiceID from test_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of test
                set @testFees = (select SUM(testFee) from test_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @testFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total = (select total from bill where invoiceID = @invoiceID ) +  @testFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no test fee';
            END

        -- Check drug fees
        IF ( (EXISTS (select invoiceID from drug_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y')) 
        ) 
            BEGIN  
                --- sum cost of drug
                set @drugFees = (select SUM(drugPrice) from drug_fee where invoiceID = @invoiceID AND admittedTransaction = 'Y');
                print @drugFees;    
                
                -- update bill with new value
                UPDATE bill
                SET total = (select total from bill where invoiceID = @invoiceID ) +  @drugFees
                where invoiceID = @invoiceID;

            END   
        
        ELSE 
            BEGIN 
                PRINT 'patientID '+CONVERT(varchar,@patientID)+' has no drug fee';
            END
            
            UPDATE bill
                SET paymentStatus = 'Y'
                where invoiceID = @invoiceID;
          select * from bill where invoiceID = @invoiceID; 


    END
END
