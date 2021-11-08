/* Create trigger before insert */
DELIMITER //  
Create Trigger before_insert_Confirmed 
BEFORE INSERT ON covid_19_india FOR EACH ROW  
BEGIN  
IF NEW.Confirmed <= 0 THEN SET NEW.Confirmed = 0;  
END IF;  
END // 

/*insert row */
insert into  covid_19_india values('13-08-2021','00:00','Goa',70,80,9,6,-1)

/*Use Select statement for table after execution*/
select * from covid_19_india where State_UnionTerritory ="Goa" and Date ='13-08-2021';


/*Create table*/
CREATE TABLE TestType (
    id INT AUTO_INCREMENT,
    patientId INT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY (id , patientId)
);

INSERT INTO Confirmed_info  VALUES   
(13,'Maharashtra', 'Jalgaon', 'Rapid', 1400, 'Null'); 
INSERT INTO Confirmed_info  VALUES   
(14,'Maharashtra', 'Amravati', 'Rapid', 1650, 'Null'); 
INSERT INTO Confirmed_info  VALUES   
(15,'Maharashtra', 'Dhule', 'Rapid', 1850, 'Null');
INSERT INTO Confirmed_info  VALUES   
(17,'Maharashtra', 'Dhule', 'Rapid', 1350, 'Null'); 


/* Create trigger after insert */
DELIMITER $$
CREATE TRIGGER after_patient_insert
AFTER INSERT
ON Confirmed_info FOR EACH ROW
BEGIN
    IF NEW.Quarantine IS NULL THEN
        INSERT INTO TestType(patientId, message)
        VALUES(new.id,CONCAT('Hi ', NEW.id, ', please update your quarantine location.'));
    END IF;
END$$
DELIMITER ;

/*insert row */
INSERT INTO Confirmed_info  VALUES   
(18,'Maharashtra', 'Dhule', 'Rapid', 1350, null); 

/*Using Select statement for table check trigger working*/
select * from TestType;


