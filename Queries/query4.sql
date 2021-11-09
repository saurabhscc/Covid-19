
/*Sort the data using mysql order by clause*/
SELECT * FROM covid_19_india ORDER BY Date ASC;
SELECT * FROM covid_19_india ORDER BY Date DESC;
SELECT * FROM statewisetestingdetails ORDER BY Date ASC;
SELECT * FROM statewisetestingdetails ORDER BY Date DESC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On ASC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On DESC;

/*Sort the data using mysql order by clause multiple column*/
SELECT * FROM statewisetestingdetails ORDER BY Date DESC,TotalSamples DESC;
SELECT * FROM statewisetestingdetails ORDER BY Date DESC,State ASC,TotalSamples ASC;
SELECT * FROM covid_19_india ORDER BY Date DESC,Confirmed DESC;
SELECT * FROM covid_19_india ORDER BY Date DESC,State_UnionTerritory ASC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On DESC,Sessions DESC,Sites DESC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On ASC,Sessions DESC,Sites DESC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On DESC,State ASC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On DESC,State ASC,TotalDosesAdministered ASC,TotalIndividualsVaccinated ASC;
SELECT * FROM covid_vaccine_statewise ORDER BY Updated_On ASC,State ASC,TotalDosesAdministered DESC,TotalIndividualsVaccinated DESC;

/*Group by clause*/
SELECT 
    Updated_On,
    State,
    SUM(TotalDosesAdministered-TotalIndividualsVaccinated) AS Difference
FROM
    covid_vaccine_statewise
GROUP BY Updated_On;

/*Group by and having clause*/
SELECT 
    Updated_On,
    State,
    SUM(TotalDosesAdministered-TotalIndividualsVaccinated) AS Difference
FROM
    covid_vaccine_statewise
GROUP BY Updated_On
HAVING Difference > 0;

/*Group by and having clause*/
SELECT 
    Updated_On,
    State,
    SUM(TotalDosesAdministered-TotalIndividualsVaccinated) AS Difference
FROM
    covid_vaccine_statewise
GROUP BY Updated_On
HAVING Difference < 0;

/*Distinct clause*/
SELECT 
Distinct State
FROM covid_vaccine_statewise
Order by
Updated_On ;

/*Distinct clause*/
SELECT 
Distinct State_UnionTerritory
FROM covid_19_india
Order by
Date;


/*Not in operator*/
SELECT 
id, 
State,
District,
Confirmed
FROM
    confirmed_detail
WHERE
    District NOT IN ('Jalgaon' , 'Amravati','Dhule')
ORDER BY 
    id;
  
/*Between operator*/
SELECT 
    Updated_On, State, TotalDosesAdministered
FROM
    covid_vaccine_statewise
WHERE
    TotalDosesAdministered BETWEEN 1000 AND 100000;
  
  
/*Between operator*/
SELECT 
Updated_On,
State,
TotalDosesAdministered
FROM 
   covid_vaccine_statewise
WHERE 
  TotalDosesAdministered between 1000 and 100000
  order by Updated_On;
  
/* in operator*/
SELECT 
id, 
State,
District,
Confirmed
FROM
    confirmed_detail
WHERE
    District  IN ('Mumbai')
ORDER BY 
    id;
    
/* or operator*/
SELECT 
id, 
State,
District,
Confirmed
FROM
    confirmed_detail
WHERE
    District ='Mumbai' or District = 'Solapur' 


/*like operator*/
select 
Date,
State,
TotalSamples,
Negative,
Positive
from
statewisetestingdetails
where
State like '%P'

/*like operator*/
select 
Date,
State,
TotalSamples,
Negative,
Positive
from
statewisetestingdetails
where
State like '%sh'

/*like operator*/
select 
Date,
State,
TotalSamples,
Negative,
Positive
from
statewisetestingdetails
where
State like '%sh'


  
  