/*Store Procedure with handler*/
DELIMITER &&
create procedure sp_RetriveData()
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
select * from covid_19_india;
select * from covid_vaccine_statewise;
select * from statewisetestingdetails;
commit;
END &&
DELIMITER ;

/*Call Procedure*/
CALL sp_RetriveData();


/*Store Procedure with handler*/
DELIMITER &&
create procedure sp_InsertData(in Date text,in State text,in TotalSamples bigint,in Negative bigint,in Positive int)
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
insert into statewisetestingdetails (Date,State,TotalSamples,Negative,Positive) values(Date,State,TotalSamples,Negative,Positive);
commit;
END &&
DELIMITER ;

/*Call Procedure*/
CALL sp_InsertData("11-08-2021","Gujarat","1000","500","50");

/*Store Procedure with handler*/
DELIMITER &&
create procedure sp_UpdateData(in State text,in Negative bigint,in Positive int)
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
update statewisetestingdetails set Negative=negative where State=state and Positive=positive; 
select * from statewisetestingdetails;
commit;
END &&
DELIMITER ;

/*Call Procedure*/
CALL sp_UpdateData("Goa","1000","500");


/*Store Procedure with handler*/
DELIMITER &&
create procedure sp_deleteData(in State text,in Negative bigint,in Positive int)
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
update statewisetestingdetails set Negative=negative where State=state and Positive=positive; 
select * from statewisetestingdetails;
commit;
END &&
DELIMITER ;

/*Call Procedure*/
CALL sp_UpdateData("Goa","1000","500");

/*Store Procedure with handler*/
DELIMITER &&
create procedure sp_deleteData(in Date text,in State text,in TotalSamples bigint,in Negative bigint,in Positive int)
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
delete from statewisetestingdetails where TotalSamples =1000 ; 
select * from statewisetestingdetails;
commit;
END &&
DELIMITER ;

/*Call Procedure*/
CALL sp_deleteData("11-08-2021","Gujarat","1000","500","50");
