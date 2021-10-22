/*Create Table*/
CREATE TABLE Confirmed_info (  
  id int NOT NULL,  
  State varchar(55) DEFAULT NULL,  
  District varchar(35) DEFAULT NULL,  
  TypeofTest varchar(25) DEFAULT NULL,  
  Confirmed int DEFAULT NULL,  
  Quarantine varchar(55) DEFAULT NULL,  
  PRIMARY KEY (id)  
); 

/*insert rows to Confirmed_info */
INSERT INTO Confirmed_info  VALUES   
(1,'Maharashtra', 'Mumbai', 'RTPCR', 100, 'MuncipalityHospital');
INSERT INTO Confirmed_info  VALUES   
(2,'Maharashtra', 'Thane', 'RTPCR', 600, 'MuncipalityHospital');
INSERT INTO Confirmed_info  VALUES   
(3,'Maharashtra', 'Mumbai', 'RTPCR', 100, 'MuncipalityHospital');
INSERT INTO Confirmed_info  VALUES   
(4,'Maharashtra', 'Pune', 'RTPCR', 1600, 'MuncipalityHospital'); 
INSERT INTO Confirmed_info  VALUES   
(5,'Maharashtra', 'Ahmednagar', 'Rapid', 1100, 'PrivateHospital');
INSERT INTO Confirmed_info  VALUES   
(6,'Maharashtra', 'Thane', 'Rapid', 2600, 'AtHome');
INSERT INTO Confirmed_info  VALUES   
(7,'Maharashtra', 'Nashik', 'Rapid', 7100, 'MuncipalityHospital');
INSERT INTO Confirmed_info  VALUES   
(8,'Maharashtra', 'Pune', 'Rapid', 11600, 'NGOHospital');    
INSERT INTO Confirmed_info  VALUES   
(9,'Maharashtra', 'Mumbai', 'Rapid', 1100, 'PrivateHospital');
INSERT INTO Confirmed_info  VALUES   
(10,'Maharashtra', 'Thane', 'Rapid', 2200, 'AtHome');   



/*Create Table*/
CREATE TABLE Confirmed_detail (  
  id int NOT NULL,  
  State varchar(55) DEFAULT NULL,  
  District varchar(35) DEFAULT NULL,  
  TypeofTest varchar(25) DEFAULT NULL,  
  Confirmed int DEFAULT NULL,  
  Quarantine varchar(15) DEFAULT NULL,
  SigningAuthority Time,
  PRIMARY KEY (id)    
);  


/*Create Table*/
CREATE TABLE Patient_log(    
    user varchar(45) NOT NULL,    
    descreptions varchar(255) NOT NULL  
); 


/*create table*/
CREATE TABLE MH_Inout_info (  
  id int NOT NULL,     
  Area varchar(35) DEFAULT NULL,
  Intake int DEFAULT NULL,   
  Confirmed int DEFAULT NULL,  
  Quarantine varchar(55) DEFAULT NULL,
  Updated_on DATE NOT NULL, 
  Released int DEFAULT NULL,
  PRIMARY KEY (id)  
);

/*insert rows to MH_Inout_info */
INSERT INTO MH_Inout_info  VALUES   
(1, 'Mumbai',100000, 15000, 'Govt.Hospital','2019-04-30',1000);
INSERT INTO MH_Inout_info  VALUES   
(2, 'Pune',100000, 9000, 'Govt.Hospital','2019-04-30',2000);
INSERT INTO MH_Inout_info  VALUES   
(3,'Thane',90000, 6000, 'Govt.Hospital','2019-04-30',6000);
INSERT INTO MH_Inout_info  VALUES   
(4,'Solapur',70000,6700,'Govt.Hospital','2019-04-30',3500); 
INSERT INTO MH_Inout_info  VALUES   
(5,'Mumbai2',60000,1400, 'Govt.Hospital','2019-04-30',5500);


/*create table*/
CREATE TABLE Total_Hospital_Intakes(  
    total_intakes bigint NOT Null
);

/*Use sum() function return total intake */
INSERT INTO Total_Hospital_Intakes (total_intakes)  
SELECT SUM(Intake) FROM MH_Inout_info;

/*Using Select statement */
select * from Total_Hospital_Intakes;