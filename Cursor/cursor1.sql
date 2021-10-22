select * from Confirmed_info;

/*create cursor in store procedure*/
DELIMITER $$
CREATE PROCEDURE sp_mh_list(
INOUT mh_list varchar(5000)
)
 BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE Area_name varchar(100) DEFAULT "";

/* -- declare cursor for district*/
DECLARE dist_cursor
CURSOR FOR

SELECT District FROM  covid_19.Confirmed_info;

/*-- declare NOT FOUND handler*/
DECLARE CONTINUE HANDLER
FOR NOT FOUND SET finished = 1;

OPEN dist_cursor;

get_list : LOOP
FETCH dist_cursor INTO Area_name; 
IF finished = 1 THEN
LEAVE get_list;
END if;
/* -- build  list*/
SET mh_list= CONCAT(Area_name ,";",mh_list);
END LOOP get_list;
CLOSE dist_cursor ;
END$$

DELIMITER ;


/*call sp for cursor*/
SET @mh_list= "";   
CALL sp_mh_list(@mh_list);
SELECT @mh_list;
