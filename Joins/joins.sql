/*alter table set pk */
ALTER TABLE covid_19_india
ADD PRIMARY KEY (Sno);

/*alter table add column set pk */
ALTER TABLE statewisetestingdetails
ADD COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

/*alter table add column set pk */
ALTER TABLE covid_vaccine_statewise
ADD COLUMN vaccine_id INT AUTO_INCREMENT,
ADD PRIMARY KEY (vaccine_id);

/*Retrive data using Inner Joins*/
select covid_vaccine_statewise.State ,covid_19_india.Confirmed 
from covid_vaccine_statewise  inner join covid_19_india 
on covid_vaccine_statewise.vaccine_id=covid_19_india.Sno;

select covid_19_india.Date,statewisetestingdetails.State,covid_19_india.Deaths,statewisetestingdetails.Positive 
from covid_19_india inner join statewisetestingdetails 
on covid_19_india.Sno=statewisetestingdetails.id;

select covid_vaccine_statewise.State,covid_vaccine_statewise.Sessions,statewisetestingdetails.TotalSamples 
from covid_vaccine_statewise inner join statewisetestingdetails 
on covid_vaccine_statewise.vaccine_id=statewisetestingdetails.id;


/*Retrive data using  Left Joins*/
select covid_vaccine_statewise.State ,covid_19_india.Confirmed 
from covid_vaccine_statewise  left join covid_19_india  
on covid_vaccine_statewise.vaccine_id=covid_19_india.Sno;


select covid_19_india.Date,statewisetestingdetails.State,covid_19_india.Deaths,statewisetestingdetails.Negative,statewisetestingdetails.Positive 
from covid_19_india left join statewisetestingdetails 
on covid_19_india.Sno=statewisetestingdetails.id;


select covid_vaccine_statewise.State,covid_vaccine_statewise.Sessions,covid_vaccine_statewise.Sites,statewisetestingdetails.TotalSamples 
from covid_vaccine_statewise left join statewisetestingdetails 
on covid_vaccine_statewise.vaccine_id=statewisetestingdetails.id;




/*Retrive data using  Right Join*/
select covid_vaccine_statewise.State ,covid_19_india.Confirmed 
from covid_vaccine_statewise  right join covid_19_india  
on covid_vaccine_statewise.vaccine_id=covid_19_india.Sno;

select covid_19_india.Date,statewisetestingdetails.State,covid_19_india.Deaths,statewisetestingdetails.Negative,statewisetestingdetails.Positive 
from covid_19_india  right join statewisetestingdetails 
on covid_19_india.Sno=statewisetestingdetails.id;

select covid_vaccine_statewise.State,covid_vaccine_statewise.Sessions,covid_vaccine_statewise.Sites,statewisetestingdetails.TotalSamples 
from covid_vaccine_statewise  right join statewisetestingdetails 
on covid_vaccine_statewise.vaccine_id=statewisetestingdetails.id;


/*Retrive data using Cross Joins*/
select covid_vaccine_statewise.State ,covid_19_india.Confirmed 
from covid_vaccine_statewise  cross join covid_19_india  
on covid_vaccine_statewise.vaccine_id=covid_19_india.Sno;


select covid_19_india.Date,covid_19_india.State_UnionTerritory,covid_19_india.Deaths,statewisetestingdetails.Negative,statewisetestingdetails.Positive 
from covid_19_india  cross join statewisetestingdetails 
on covid_19_india.Sno=statewisetestingdetails.id;

select covid_vaccine_statewise.State,covid_vaccine_statewise.Sessions,covid_vaccine_statewise.Sites,statewisetestingdetails.TotalSamples 
from covid_vaccine_statewise  cross join statewisetestingdetails 
on covid_vaccine_statewise.vaccine_id=statewisetestingdetails.id;

