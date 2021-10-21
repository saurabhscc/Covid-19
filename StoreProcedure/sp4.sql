/*Create function  inside procedure*/
DELIMITER $$
create procedure Function_VaccinattionRate()
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
SELECT State_UnionTerritory,ConfirmedIndianNational,Deaths, Mortality_rate(Deaths) FROM covid_19_india ORDER BY Deaths;   
commit;
end$$

/* call function by using procedure*/
call Function_VaccinattionRate()$$


/*Create function  inside procedure*/
DELIMITER $$
create procedure Function_Mortality_rate()
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
SELECT State,TotalIndividualsVaccinated, VaccinattionRate(TotalIndividualsVaccinated)  
FROM covid_vaccine_statewise ORDER BY TotalIndividualsVaccinated;  

commit;
end$$

/* call function by using procedure*/
call Function_Mortality_rate()$$