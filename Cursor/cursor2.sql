DELIMITER $$
CREATE PROCEDURE sp_cursor_session (
	INOUT state_list varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE stateName varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE currstate	CURSOR FOR 
	SELECT distinct State FROM covid_19.covid_vaccine_statewise where Sessions >50000;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN currstate;
	getstate: LOOP
		FETCH currstate INTO stateName;
		IF finished = 1 THEN 
			LEAVE getstate;
		END IF;
		-- build states List, separate by comma
		SET state_list = CONCAT(stateName,",",state_list);
	END LOOP getstate;
	CLOSE currstate;
END
$$
DELIMITER ;

/* calling a cursor */

SET @state_list = ""; 
CALL sp_cursor_session(@state_list); 
SELECT @state_list;