/*Retrive distinct row from column order in ascending order*/
SELECT DISTINCT State
FROM covid_vaccine_statewise ORDER BY State;

/*Retrive distinct row from column order in ascending order*/
SELECT DISTINCT State_UnionTerritory
FROM covid_19_india ORDER BY State_UnionTerritory;

/*Retrive distinct row from column order in ascending order*/
SELECT DISTINCT State
FROM statewisetestingdetails ORDER BY State;

/*Count no of distinct row */
select count(distinct State) from covid_vaccine_statewise;

/*Count no of distinct row */
select count(distinct State_UnionTerritory) from covid_19_india;

/*Count no of distinct row */
select count(distinct State) from statewisetestingdetails;

/*distinct row Count using group by and having clause */
SELECT State, COUNT(State)
FROM covid_vaccine_statewise
GROUP BY State
HAVING COUNT(State) > 1;

/*distinct row Count using group by and having clause */
SELECT State_UnionTerritory, COUNT(State_UnionTerritory)
FROM covid_19_india
GROUP BY State_UnionTerritory
HAVING COUNT(State_UnionTerritory) > 1;

/*Sort column using limt and order by*/
SELECT Deaths 
FROM covid_19_india  
ORDER BY State_UnionTerritory DESC  
LIMIT 1;  

/*Retrive data using where condition*/
SELECT *  
FROM covid_19_india  
WHERE State_UnionTerritory = 'Maharashtra'  
AND Confirmed > 0;  

/*Retrive data using where condition and order by */
SELECT *  
FROM covid_19_india  
WHERE State_UnionTerritory = 'Maharashtra'  
AND Confirmed > 0
ORDER BY Deaths DESC ;

/*Retrive data using where condition and order by */
SELECT Date,State_UnionTerritory, Confirmed
FROM covid_19_india  
WHERE State_UnionTerritory = 'Maharashtra'  
AND Confirmed > 0
ORDER BY Deaths DESC ;

/*Retrive data using where condition and order by */
SELECT Date,State,Positive 
FROM statewisetestingdetails  
WHERE Positive is Not Null and  Positive > 0
ORDER BY Date ASC;

/*Retrive data using where condition and order by */
SELECT Sno,Date,State_UnionTerritory,Cured
FROM covid_19_india
WHERE Cured is Not Null and  Cured > 0
ORDER BY Date ASC;

/*Retrive data using where ,and,order by */
SELECT Date,State,Positive 
FROM statewisetestingdetails  
WHERE State = 'Maharashtra'  
AND Positive > 0
ORDER BY Date ASC; 

/*Retrive data using where , and,order by */
SELECT *  
FROM covid_19_india  
WHERE State_UnionTerritory = 'Maharashtra'  
AND Confirmed > 0
ORDER BY Deaths DESC ;

/*Retrive data using where , and,order by */
SELECT Date,State_UnionTerritory, Confirmed
FROM covid_19_india  
WHERE State_UnionTerritory = 'Maharashtra'  
AND Confirmed > 0
ORDER BY Deaths DESC ;