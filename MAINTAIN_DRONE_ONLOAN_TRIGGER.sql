--------------------------------------------------------
--  File created - Thursday-April-25-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger MAINTAIN_DRONE_ONLOAN_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MAINTAIN_DRONE_ONLOAN_TRIGGER" 
BEFORE INSERT ON LOAN_LINE 
FOR EACH ROW 
BEGIN
  UPDATE drone
        SET
            drone_on_loan_count = drone_on_loan_count + 1
        WHERE
            drone_id =:new.drone_id;
END;
/
ALTER TRIGGER "MAINTAIN_DRONE_ONLOAN_TRIGGER" ENABLE;
