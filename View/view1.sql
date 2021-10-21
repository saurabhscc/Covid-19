/* create view/virtual table */
CREATE VIEW Statewise_forigner_confirmed AS    
SELECT State_UnionTerritory,ConfirmedForeignNational     
from  covid_19_india;

/*dispaly view using select statement */  
SELECT * FROM Statewise_forigner_confirmed;


/* Alter view/virtual table */
ALTER VIEW Statewise_forigner_confirmed AS    
SELECT Date,State_UnionTerritory,ConfirmedForeignNational     
from  covid_19_india;  

/*dispaly view using select statement */  
SELECT * FROM Statewise_forigner_confirmed;


/* Drop view/virtual table */
DROP VIEW Statewise_forigner_confirmed;



/* create view/virtual table */
CREATE VIEW Vaccines_Administered AS    
SELECT TotalDosesAdministered,Covaxin_DosesAdministered,CoviShield_DosesAdministered,SputnikV_DosesAdministered,TotalIndividualsVaccinated  
from  covid_vaccine_statewise;

/*dispaly view using select statement */  
SELECT * FROM Vaccines_Administered;


/* Alter view/virtual table */
ALTER VIEW Vaccines_Administered AS    
SELECT State,Updated_On,TotalDosesAdministered,Covaxin_DosesAdministered,CoviShield_DosesAdministered,SputnikV_DosesAdministered,TotalIndividualsVaccinated  
from  covid_vaccine_statewise;

/*dispaly view using select statement */  
SELECT * FROM Vaccines_Administered;


/* Drop view/virtual table */
DROP VIEW Vaccines_Administered;




/* create view/virtual table */
CREATE VIEW Confirmed_MH_Cases AS    
SELECT Date,State_UnionTerritory,Confirmed    
from  covid_19.covid_19_india
where State_UnionTerritory = "Maharashtra";

/*dispaly view using select statement */  
SELECT * FROM Confirmed_MH_Cases;


/* Alter view/virtual table */
ALTER VIEW Confirmed_MH_Cases AS    
SELECT Date,State_UnionTerritory,Deaths,Confirmed    
from  covid_19.covid_19_india
where State_UnionTerritory = "Maharashtra";
 

/*dispaly view select statement */  
SELECT * FROM Confirmed_MH_Cases;

/* Drop view/virtual table */
DROP VIEW Confirmed_MH_Cases;




/* create view/virtual table */
CREATE VIEW CoviShield_Vaccine AS    
SELECT TotalDosesAdministered,State,CoviShield_DosesAdministered, 18to44Years_Individuals_Vaccinated , 45to60Years_IndividualsVaccinated, 60plusYears_IndividualsVaccinated,TotalIndividualsVaccinated 
from  covid_19.covid_vaccine_statewise
where State = "Maharashtra";

/*dispaly view select statement */  
SELECT * FROM CoviShield_Vaccine;


/* Alter view/virtual table */
ALTER VIEW CoviShield_Vaccine AS
SELECT TotalDosesAdministered,Updated_On,State,CoviShield_DosesAdministered, 18to44Years_Individuals_Vaccinated , 45to60Years_IndividualsVaccinated, 60plusYears_IndividualsVaccinated,TotalIndividualsVaccinated 
from  covid_19.covid_vaccine_statewise
where State = "Maharashtra";
 

/*dispaly view select statement */  
SELECT * FROM CoviShield_Vaccine;

/* Drop view/virtual table */
DROP VIEW CoviShield_Vaccine;