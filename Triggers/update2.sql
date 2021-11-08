/* Create trigger before update */
DELIMITER $$  
CREATE TRIGGER before_update_Negative 
BEFORE UPDATE  
ON statewisetestingdetails FOR EACH ROW  
BEGIN  
    DECLARE error_msg VARCHAR(255);  
    SET error_msg = ('The new Negative cannot be greater make sure about Male_DosesAdministered ');  
    IF new.Negative > old.Negative  THEN  
    SIGNAL SQLSTATE '45000'   
    SET MESSAGE_TEXT = error_msg;  
    END IF;  
END $$    
DELIMITER ; 

/*Use statement to update row quantity*/
Update statewisetestingdetails Set Negative= 47 where TotalSamples = 60;  

/*Use statement to update row quantity which violates*/
Update statewisetestingdetails Set Negative =70 where TotalSamples = 60;  

