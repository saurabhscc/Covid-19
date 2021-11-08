/*Create trigger  before delete event */
DELIMITER //
CREATE TRIGGER before_del_vaccinated
BEFORE DELETE
ON covid_vaccine_statewise
FOR EACH ROW
IF OLD.vaccine_id in (select vaccine_id from covid_vaccine_statewise) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'The vaccination details highly secured';
END IF//
DELIMITER ;

/*using where clause try to delete */
delete from covid_vaccine_statewise where vaccine_id='7845';