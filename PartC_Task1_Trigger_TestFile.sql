set echo on;
spool "MAINTAIN_DRONE_ONLOAN_OUTPUT.txt";
--Test file for Part C Task 1 Triggers 

--MAINTAIN_DRONE_ONLOAN_TRIGGER

--Alter table commands
alter table DRONE add (drone_on_loan_count number (4,0) default 0);
alter table DRONE modify (drone_on_loan_count NOT NULL);
-- update new column added
update DRONE
set drone_on_loan_count =
   (select count(*) 
    from loan_line
    where loan_line.drone_id=drone.drone_id);
    
commit;


--Test Data for MAINTAIN_DRONE_ONLOAN_TRIGGER

--Original drone_on_loan_count

select drone_id, drone_on_loan_count from drone;

--Insert a new loan
INSERT INTO LOAN (LOAN_ID,LOAN_DATE_TIME,DUE_DATE_TIME,CUST_ID) VALUES 
(LOAN_ID_SEQUENCE.NEXTVAL,to_date('5/APR/19 13:00:00','DD/MON/RR HH24:MI:SS'),to_date('25/APR/19 13:00:00','DD/MON/RR HH24:MI:SS'),102);

INSERT INTO LOAN_LINE VALUES (loan_id_sequence.currval, 108);

commit;

select drone_id, drone_on_loan_count from drone ;
spool off;


--MAINTAIN_TRAININGBOOKING_TRIGGER

spool "MAINTAIN_TRAININGBOOKING_TRIGGER_OUTPUT.txt";

--Invalid employee ID insert (Employee does not have an RPL)

insert into training_activity values (TRAINING_ID_SEQUENCE.nextval,101,100, to_date('20/MAY/19 12:00:00','DD/MON/RR HH24:MI:SS'),102,2.5,'take surveying videos');

--Valid employee ID insert (Employee has an RPL)

INSERT INTO training_activity (
    training_id,
    emp_id,
    cust_id,
    training_date_time,
    drone_id,
    training_duration
) VALUES (
    training_id_sequence.NEXTVAL,
    100,
    106,
    TO_DATE('20/Jan/19 13:00:00','DD/MON/RR HH24:MI:SS'),
    101,
    4
);

--Invalid employee ID update (Employee does not have an RPL)

UPDATE training_activity
SET
    emp_id = 101
WHERE
    training_id = 100;

--Valid employee ID update (Employee has an RPL)

UPDATE training_activity
SET
    emp_id = 100
WHERE
    training_id = 100;

spool off;

set echo off;
