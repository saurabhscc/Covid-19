/*Create trigger  before delete event */
DELIMITER //
CREATE TRIGGER before_del_Confirm_info
BEFORE DELETE
ON Confirmed_info
FOR EACH ROW
IF OLD.id in (select id from Confirmed_info) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'The patient info is highly secured';
END IF//
DELIMITER ;

/*use insert query into table*/
INSERT INTO Confirmed_info  VALUES   
(12,'Maharashtra', 'Mumbai', 'Rapid', 1010, 'Govt,Hospital');

/*using where clause try to delete */
Delete from Confirmed_info where id='12';

/*use select statement to display table again after execution*/
 select * from Confirmed_info;
 
 
 
 /* create trigger after delete */
DELIMITER $$    
CREATE TRIGGER after_delete_area  
AFTER DELETE  
ON MH_Inout_info FOR EACH ROW  
BEGIN  
   UPDATE Total_Hospital_Intakes SET total_intakes = total_intakes - old.intake;  
END$$   
DELIMITER ;  


/* using where clause try to delete */
delete from MH_Inout_info where id=5;

/*use select statement to display table again after execution*/
select * from Total_Hospital_Intakes;


