/* Create trigger before insert */
DELIMITER //  
Create Trigger before_insert_Positive  
BEFORE INSERT ON statewisetestingdetails FOR EACH ROW  
BEGIN  
IF NEW.Positive < 0 THEN SET NEW.Positive = 0;  
END IF;  
END // 

/*insert row */
insert into  statewisetestingdetails values('12-08-2021','Gujarat',1000,1000,-1)

/*Use Select statement for table after execution*/
select * from statewisetestingdetails;



/* Create trigger after insert */
DELIMITER //  
Create Trigger after_insert_Confirmed_detail  
AFTER INSERT ON Confirmed_info FOR EACH ROW  
BEGIN  
INSERT INTO Confirmed_detail VALUES (new.id, new.State,   
new.District, new.TypeofTest, new.Confirmed, new.Quarantine, CURTIME());  
END //  

/*insert row */
INSERT INTO Confirmed_info  VALUES   
(11,'Maharashtra', 'Solapur', 'Rapid', 1800, 'PrivateHospital'); 

/*Using Select statement for table check trigger working*/
select * from Confirmed_detail;