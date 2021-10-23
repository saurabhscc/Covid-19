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



/* creating function */
DELIMITER $$
create function Infection_zone(Positive int )
returns text
deterministic
begin
declare Infection_zone text;
if Positive > 15000 then set Infection_zone='Total_containment';
elseif( Positive >=100 and  Positive <=15000) then set Infection_zone='Semi_containment';
elseif( Positive <100 ) then set Infection_zone='Non_containment';
end if;
return(Infection_zone);
end$$
DELIMITER;   

/*calling function*/
select Date,State,Infection_zone(Positive) from statewisetestingdetails;

/*Display the stored function in database */
SHOW FUNCTION STATUS WHERE db = 'covid_19_india'


/* creating function */
DELIMITER //
CREATE FUNCTION get_daily_cases(area varchar(64), olddate varchar(10), newdate varchar(10))
RETURNS integer
DETERMINISTIC
BEGIN
DECLARE confirmed_old int;
DECLARE confirmed_new int;
    
Select Confirmed into confirmed_old FROM covid_19.covid_19_india where Date = olddate AND State_UnionTerritory=area;
Select Confirmed into confirmed_new FROM covid_19.covid_19_india where Date = newdate AND State_UnionTerritory=area;
    
return (confirmed_new - confirmed_old);
END 
//
DELIMITER ; 


/* execute function check diffn state and dates*/
SELECT get_daily_cases('Punjab','03-08-2021','04-08-2021') as difference;

SELECT get_daily_cases('West Bengal','10-08-2021','11-08-2021') as difference;