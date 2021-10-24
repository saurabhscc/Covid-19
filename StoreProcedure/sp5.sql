/*  create view inside procedure*/
DELIMITER $$
create procedure sp_View()
Begin
declare exit handler for sqlexception
begin
rollback;
end;
    
declare exit handler for sqlwarning
begin
rollback;
end;
    
start transaction;
select * from Statewise_forigner_confirmed;
select * from Vaccines_Administered;
select * from Confirmed_MH_Cases;
commit;
end$$
DELIMITER ;

/* calling View by using procedure*/

call sp_View();