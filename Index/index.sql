/*creating index on single column*/
create INDEX Mortality on covid_19_india(Deaths);

/* show index present in table*/
SHOW INDEXES FROM covid_19_india;


/* creating index on multiple column*/
create INDEX covid_stat on covid_19_india(
Cured,
Deaths,
Confirmed);

/* show index present in table*/
SHOW INDEXES FROM covid_19_india;


/* creating index on multiple column*/
create INDEX Vaccine_stat on covid_vaccine_statewise(
TotalDosesAdministered,
Sessions, 
FirstDoseAdministered, 
SecondDoseAdministered, 
Male_DosesAdministered,  
Female_DosesAdministered,  
Transgender_DosesAdministered, 
Covaxin_DosesAdministered, 
CoviShield_DosesAdministered, 
SputnikV_DosesAdministered,
TotalIndividualsVaccinated);

/* show index present in table*/
SHOW INDEXES FROM covid_vaccine_statewise;


/* creating index on multiple column*/
create INDEX Testing_stat on statewisetestingdetails(
TotalSamples,
Negative,
Positive
);

/* show index present in table*/
SHOW INDEXES FROM statewisetestingdetails;



/* Creating stored procedure for non-clustered index*/
DELIMITER $$
create procedure sp_mortality()
begin
declare exit handler for sqlexception
begin

rollback;
end;

declare exit handler for sqlwarning
begin
rollback;
end;

start transaction;
create INDEX Mortality on covid_19_india(Deaths);
commit;
end$$
DELIMITER ;

/* show index present in table*/
SHOW INDEXES FROM covid_19_india;



/* Creating stored procedure for non-clustered index*/
DELIMITER $$
create procedure sp_Vaccine_stat()
begin
declare exit handler for sqlexception
begin
    
rollback;
end;
    
declare exit handler for sqlwarning
begin
rollback;
end;
    
start transaction;
create INDEX Vaccine_stat on covid_vaccine_statewise(
TotalDosesAdministered,
Sessions, 
FirstDoseAdministered, 
SecondDoseAdministered, 
Male_DosesAdministered,  
Female_DosesAdministered,  
Transgender_DosesAdministered, 
Covaxin_DosesAdministered, 
CoviShield_DosesAdministered, 
SputnikV_DosesAdministered,
TotalIndividualsVaccinated
);
commit;
end$$
DELIMITER ;

/* show index present in table*/
SHOW INDEXES FROM covid_vaccine_statewise;




/* Creating stored procedure for non-clustered index*/
DELIMITER $$
create procedure sp_Testing_stat()
begin
declare exit handler for sqlexception
begin
    
rollback;
end;
    
declare exit handler for sqlwarning
begin
rollback;
end;
    
start transaction;
create INDEX Testing_stat on statewisetestingdetails(
TotalSamples,
Negative,
Positive
);
commit;
end$$
DELIMITER ;

/* show index present in table*/
SHOW INDEXES FROM statewisetestingdetails;



