/*Procedure with In Parameter*/
DELIMITER &&
CREATE PROCEDURE get_maharashtra_sample(IN state_name text)	
BEGIN
	SELECT * 
 	FROM statewisetestingdetails
	WHERE State = state_name;
END &&
DELIMITER ;

/*Call Procedure*/
CALL get_maharashtra_sample('Maharashtra');



/*Procedure with In Parameter*/
DELIMITER &&
CREATE PROCEDURE get_state_maharashtra(IN state_name text)	
BEGIN
	SELECT * 
 	FROM covid_19_india
	WHERE State_UnionTerritory = state_name;
END &&
DELIMITER ;

/*Call Procedure*/
CALL get_state_maharashtra('Maharashtra');



/*Procedure with out Parameter*/
DELIMITER &&
CREATE PROCEDURE display_max_deaths(out maximumdeath int)	
BEGIN
	SELECT MAX(Deaths)into maximumdeath 
 	FROM covid_19_india;	
END &&
DELIMITER ;

/*Call Procedure*/
CALL display_max_deaths(@D);
select @D;


/*Procedure with out Parameter*/
DELIMITER &&
CREATE PROCEDURE display_covshied_alloted(out covshield_vaccine bigint)	
BEGIN
	SELECT SUM(CoviShield_DosesAdministered)into covshield_vaccine
 	FROM covid_vaccine_statewise;	
END &&
DELIMITER ;

/*Call Procedure*/
CALL display_covshied_alloted(@Cos);
select @Cos;










