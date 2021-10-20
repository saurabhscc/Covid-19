/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Covid_positive_foreigner ()  
BEGIN  
    SELECT Sum(ConfirmedForeignNational) AS Total_Foreigner FROM covid_19_india;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Covid_positive_foreigner(); 


/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Covid_positive_indians()  
BEGIN  
    SELECT Sum(ConfirmedIndianNational) AS Total_Indians FROM covid_19_india;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Covid_positive_indians(); 


/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Covid_Cured()  
BEGIN  
    SELECT Sum(Cured) AS Total_Cured FROM covid_19_india;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Covid_Cured(); 



/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Covid_Deaths()  
BEGIN  
    SELECT Sum(Deaths) AS Total_Deaths FROM covid_19_india;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Covid_Deaths(); 



/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Confirmed_covid_cases()  
BEGIN  
    SELECT Sum(Confirmed) AS Total_Confirmed_cases FROM covid_19_india;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Confirmed_covid_cases(); 



/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Covid_total_test_samples()  
BEGIN  
    SELECT Sum(TotalSamples) AS Total_samples FROM statewisetestingdetails;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Covid_total_test_samples(); 



/*Procedure without Parameter*/
DELIMITER &&  
CREATE PROCEDURE Doses_administered()  
BEGIN  
    SELECT Sum(TotalDosesAdministered) AS Total_Doses_administered FROM covid_vaccine_statewise;  
END &&  
DELIMITER ;  

/*Call Procedure*/
CALL Doses_administered(); 


/*List of all Stored Procedures in database*/
 SHOW PROCEDURE STATUS WHERE db = 'covid_19'; 
 

/*To drop store procedure */
DROP PROCEDURE [ IF EXISTS ] procedure_name;  