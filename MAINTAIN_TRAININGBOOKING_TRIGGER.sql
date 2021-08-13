--------------------------------------------------------
--  File created - Saturday-May-04-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger MAINTAIN_TRAININGBOOKING
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MAINTAIN_TRAININGBOOKING" BEFORE
    INSERT OR UPDATE OF emp_id ON training_activity
    FOR EACH ROW
DECLARE
    rplno   NUMBER;
    invalid_employee EXCEPTION;
BEGIN
SELECT
            rpl_no
        INTO rplno
        FROM
            employee
        WHERE
            emp_id =:new.emp_id; 
    IF inserting THEN
      
-- checking rpl number before inserting training activity
        IF rplno IS NULL THEN
            RAISE invalid_employee;
        END IF;
    END IF;

    IF updating THEN
    -- selecting the rpl_no of the new employee
        
            
-- checking rpl_no before updating the training activity
        IF rplno IS NULL THEN
            RAISE invalid_employee;
        END IF;
    END IF;

EXCEPTION
    WHEN invalid_employee THEN
        raise_application_error(-20001,'INVALID EMPLOYEE. ');
END;
/
ALTER TRIGGER "MAINTAIN_TRAININGBOOKING" ENABLE;
