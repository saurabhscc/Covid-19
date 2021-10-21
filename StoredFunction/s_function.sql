/*Create stored function*/
DELIMITER $$  
CREATE FUNCTION VaccinattionRate(
TotalIndividualsVaccinated bigint )   
RETURNS text  
DETERMINISTIC  
BEGIN  
    DECLARE VaccinattionRate text;  
     IF TotalIndividualsVaccinated >200000000 THEN  
        SET VaccinattionRate = 'Maximum';  
    ELSEIF (TotalIndividualsVaccinated <= 200000000 AND   
            TotalIndividualsVaccinated >= 10000) THEN  
        SET VaccinattionRate = 'Good';  
    ELSEIF TotalIndividualsVaccinated < 10000 THEN  
        SET VaccinattionRate = 'Average';  
    END IF;  
    -- return the VaccinattionRate  
    RETURN (VaccinattionRate);  
END$$  
DELIMITER;  
  

/*calling Function using function name*/
SELECT State,TotalIndividualsVaccinated, VaccinattionRate(TotalIndividualsVaccinated)  
FROM covid_vaccine_statewise ORDER BY TotalIndividualsVaccinated;  


 

/*Create stored function*/
DELIMITER $$  
CREATE FUNCTION Mortality_rate(  
    Deaths int  
)   
RETURNS text 
DETERMINISTIC  
BEGIN  
    DECLARE Mortality_rate text;  
    IF Deaths > 1000 THEN  
        SET Mortality_rate = 'VeryHigh';  
    ELSEIF (Deaths <= 1000 AND   
            Deaths >= 10) THEN  
        SET Mortality_rate = 'High';  
    ELSEIF Deaths < 10 THEN  
        SET Mortality_rate = 'Low';  
    END IF;  
    -- return the Mortality_rate  
    RETURN (Mortality_rate);  
END$$  
DELIMITER;  


/*calling Function using function name*/
SELECT State_UnionTerritory,ConfirmedIndianNational,Deaths, Mortality_rate(Deaths) FROM covid_19_india ORDER BY Deaths;    



/*Display the stored function in database */
SHOW FUNCTION STATUS WHERE db = 'covid_19_india'

