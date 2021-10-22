/* Create trigger before update */
DELIMITER $$  
CREATE TRIGGER before_update_Individualvaccinated 
BEFORE UPDATE  
ON covid_vaccine_statewise FOR EACH ROW  
BEGIN  
    DECLARE error_msg VARCHAR(255);  
    SET error_msg = ('The new TotalIndividualsVaccinated cannot be greater make sure about total doses administered');  
    IF new.TotalIndividualsVaccinated > old.TotalIndividualsVaccinated  THEN  
    SIGNAL SQLSTATE '45000'   
    SET MESSAGE_TEXT = error_msg;  
    END IF;  
END $$    
DELIMITER ; 

/*Use statement to update row quantity*/
Update covid_vaccine_statewise Set TotalIndividualsVaccinated = 48276 where TotalDosesAdministered = 48276; 

/*Use statement to update row quantity which violates*/
Update covid_vaccine_statewise Set TotalIndividualsVaccinated = 49000 where TotalDosesAdministered = 48276; 


/* Create trigger after update */
DELIMITER $$  
CREATE TRIGGER after_update_patientInfo  
AFTER UPDATE  
ON Confirmed_info FOR EACH ROW  
BEGIN  
    INSERT into Patient_log VALUES (user(),   
    CONCAT(' Previous Center ', OLD.Quarantine, ' Present Center ', NEW.Quarantine));  
END $$  
DELIMITER ;  

/*Invoke trigger */
 UPDATE Confirmed_info SET Quarantine = 'Govt.Hospital';  

/*use select statement to display table after execution*/
select * from Confirmed_info;

/*use select statement to display table after execution*/
select * from Patient_log;
