/*Case function*/
select Date, State_UnionTerritory,Cured,Confirmed,
case when Confirmed = 0 then 'No Data Updated'
when Cured <= 0 then 'No cured Today' 
when Cured > 0 then Cured
end as Cured_Patient
from covid_19_india;

/*Case function*/
select Date,State,TotalSamples,Negative,Positive,
case when TotalSamples >0 and Positive > 10  then 'Increasing ' 
when Positive = NULL and Negative = NULL  then 'No Data Updated'
end as Rate
from statewisetestingdetails;
     
 /*Case function*/    
select Updated_On,State,
case when Sessions <=1000 then 'low'
when Sessions >1000 and Sessions <3000 then 'medium'
when Sessions >=30000 then 'high'
end as Vaccine_Sessions
from covid_vaccine_statewise;

/*Case function*/
select Updated_On,State,TotalDosesAdministered,
case when TotalDosesAdministered = null then 'No Supply'
when TotalDosesAdministered > 1000 and TotalDosesAdministered < 20000  then 'Medium Supply'
when TotalDosesAdministered >= 20000  then 'HighSupply'
end as VaccineSupply
from covid_vaccine_statewise;