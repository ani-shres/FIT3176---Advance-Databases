--Sample data for SUPPLIER table

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0450555589',
'660 Blackburn Road, Clayton, Melbourne, VIC, 3168');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0450556214',
'770 Ferntree Road, Clayton, Melbourne, VIC, 3168');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0282607800',
'53 Ocean Street, Rosebud, Sydney, NSW, 2000');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0286798800',
'20 Jacabina Court, Banora, Wollongong, NSW, 2500');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0745861620',
'51 Boorie Road, Roxburgh, Ironpot, QLD, 4610');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0745861234',
'59 Boorie Road, Roxburgh, Ironpot, QLD, 4610');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0445861234',
'17 Parkes Road, Doreen, Melbourne, VIC, 3754');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0455861234',
'463 Victoria St, West Melbourne, VIC, 3003');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0749878234',
'12 Hotham St, South Melbourne, VIC, 3205');

Insert into supplier values(
supplier_id_sequence.NEXTVAL,
'0399397497',
'16 Morris St, South Melbourne, VIC, 3205');

commit;

--Sample data for DRONE table

Insert into drone values(
drone_id_sequence.NEXTVAL,
'RedKite',
50,
to_date('10/OCT/2018', 'DD/MON/YYYY'),
'Y',
'N',
'Y',
101);

insert into drone_for_sale values (
drone_id_sequence.CURRVAL,
3,
1000
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Orbiter 3',
150,
to_date('02/JAN/2019', 'DD/MON/YYYY'),
'Y',
'N',
'Y',
103);

insert into drone_for_sale values (
drone_id_sequence.CURRVAL,
5,
1300
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Navig8 Electric',
20,
to_date('20/AUG/2018', 'DD/MON/YYYY'),
'N',
'Y',
'Y',
101);

insert into drone_for_sale values (
drone_id_sequence.CURRVAL,
2,
950
);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
80,
10
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'IA-17 Manta',
20,
to_date('06/DEC/2017', 'DD/MON/YYYY'),
'N',
'Y',
'Y',
100);

insert into drone_for_sale values (
drone_id_sequence.CURRVAL,
5,
1250
);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
120,
20
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Triton (MQ-4C)',
4,
to_date('30/MAR/2018', 'DD/MON/YYYY'),
'N',
'Y',
'Y',
101);

insert into drone_for_sale values (
drone_id_sequence.CURRVAL,
3,
1050
);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
100,
15
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'GuardianEye',
4,
to_date('30/OCT/2017', 'DD/MON/YYYY'),
'N',
'Y',
'N',
101);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
200,
25
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Global Hawk (RQ-4)',
22780,
to_date('30/OCT/2017', 'DD/MON/YYYY'),
'N',
'Y',
'N',
104);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
50,
5
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Hunter',
30,
to_date('10/FEB/2019', 'DD/MON/YYYY'),
'N',
'Y',
'N',
109);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
70,
10
);

Insert into drone values(
drone_id_sequence.NEXTVAL,
'Fire Scout (MQ-8C)',
250,
to_date('15/MAR/2019', 'DD/MON/YYYY'),
'N',
'Y',
'N',
108);

insert into drone_for_rent values(
drone_id_sequence.CURRVAL,
250,
25
);

commit;

--Sample data for CUSTOMER table

INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'9/27 William St,Melbourne,VIC 3205','CarlHenson@gmail.com','0647890456','I');
INSERT INTO INDIVIDUAL VALUES (CUST_ID_SEQUENCE.CURRVAL,'F', 18);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'16 Morris St,Melbourne,VIC 3205','VictorJenson@gmail.com','0645223534','I');
INSERT INTO individual VALUES (CUST_ID_SEQUENCE.CURRVAL,'M', 60);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'17 Cecil St,Melbourne,VIC 3205','RachelPark@gmail.com','0645678324','I');
INSERT INTO individual VALUES (CUST_ID_SEQUENCE.CURRVAL,'F',49);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'46 College Walk,Melbourne,VIC 3800','BruceWayne@gmail.com','0643276583','I');
INSERT INTO individual VALUES (CUST_ID_SEQUENCE.CURRVAL,'M',30);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,',99 Beacon Rd,Melbourne,VIC 3207','JoshCarrot@gmail.com','0645332876','I');
INSERT INTO individual VALUES (CUST_ID_SEQUENCE.CURRVAL,'F',25);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'43 Victoria St,Melbourne,VIC 3003','AnkurtMoni@monash.edu','0642122346','B');
INSERT INTO BUSINESS values(CUST_ID_SEQUENCE.CURRVAL,5182475356,6123456345);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'4/5 Stratfield,Sydney,NSW 3800','ColeSprouse@apple.com','0643250985','B');
INSERT INTO BUSINESS values(CUST_ID_SEQUENCE.CURRVAL,6543221689,6532578953);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'23 Alfred St, NorthMelbourne,VIC 3051','ColtenHays@wdn.com','0643276583','B');
INSERT INTO BUSINESS values(CUST_ID_SEQUENCE.CURRVAL,5679532584,4325785315);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'180 Philip St,Sydney,NSW 2001','PhilColson@wongfu.com','0643236547','B');
INSERT INTO BUSINESS values(CUST_ID_SEQUENCE.CURRVAL,5754215678,5854321579);
INSERT INTO CUSTOMER VALUES (CUST_ID_SEQUENCE.nextval,'3/19 Hunter St,Sydney,NSW 2000','WilsonDaves@.com','0642225673','B');
INSERT INTO BUSINESS values(CUST_ID_SEQUENCE.CURRVAL,6532567853,6542156895);

COMMIT;

--sample data for EMPLOYEE table

INSERT into  Employee values (emp_id_sequence.nextval,to_date('17/DEC/85','DD/MON/RR'),'11 Albert St,Port Melbourne,VIC 3207',2947345,'0645322345');
Insert into  Employee (emp_id,emp_DOB, emp_address,emp_contact_no) values (emp_id_sequence.nextval,to_date('13/NOV/90','DD/MON/RR'),'90 Collins St, Melbourne,VIC 3000','0645376245');
Insert into  Employee (emp_id,emp_DOB, emp_address,emp_contact_no) values (emp_id_sequence.nextval,to_date('10/OCT/894','DD/MON/RR'),'149 Alfred St, North Melbourne,VIC 3000','0648761230');
Insert into  Employee (emp_id,emp_DOB, emp_address,RPL_no,emp_contact_no) values (emp_id_sequence.nextval,to_date('18/MAY/88','DD/MON/RR'),'42 College Walk, Melbourne,VIC 3800',5289045,'0648903612');
Insert into  Employee (emp_id,emp_DOB, emp_address,RPL_no,emp_contact_no) values (emp_id_sequence.nextval,to_date('15/FEB/92','DD/MON/RR'),'21 Sports Walk, Melbourne,VIC 3800',2347896,'0643285472');

commit;

--sample data for ORDER table

insert into ORDERS values (
order_id_sequence.NEXTVAL,
to_date('17/DEC/18','DD/MON/RR'),
1000,
100
);

insert into ORDER_LINE values (
order_id_sequence.CURRVAL,
100
);


insert into ORDERS values (
order_id_sequence.NEXTVAL,
to_date('17/DEC/18','DD/MON/RR'),
500,
101
);

insert into ORDER_LINE values (
order_id_sequence.CURRVAL,
101
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
100,
'FIRST PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
200,
'SECOND PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

insert into ORDERS values (
order_id_sequence.NEXTVAL,
to_date('19/FEB/19','DD/MON/RR'),
200,
102
);

insert into ORDER_LINE values (
order_id_sequence.CURRVAL,
102
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
150,
'FIRST PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

insert into ORDERS values (
order_id_sequence.NEXTVAL,
to_date('19/MAR/19','DD/MON/RR'),
400,
105
);

insert into ORDER_LINE values (
order_id_sequence.CURRVAL,
103
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
50,
'FIRST PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

insert into ORDERS values (
order_id_sequence.NEXTVAL,
to_date('03/JAN/19','DD/MON/RR'),
100,
107
);

insert into ORDER_LINE values (
order_id_sequence.CURRVAL,
104
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
150,
'FIRST PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

insert into payment_instalment values (
pay_id_sequence.NEXTVAL,
150,
'SECOND PAYMENT',
order_id_sequence.CURRVAL,
NULL
);

commit;


--Sample data for LOAN table
INSERT INTO loan(LOAN_ID,loan_date_time,DUE_DATE_TIME,CUST_ID) VALUES 
(LOAN_ID_SEQUENCE.NEXTVAL,to_date('20/NOV/18 13:00:00','DD/MON/RR HH24:MI:SS'),to_date('20/DEC/18 13:00:00','DD/MON/RR HH24:MI:SS'),109);
--INSERTS FOR LOANLINE
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,102);
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,103);
--INSERTS FOR PAYMENT_INSTALLMENT
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 50,'FINAL PAYMENT',NULL, LOAN_ID_SEQUENCE.CURRVAL);
--INSERTS FOR LOAN
INSERT INTO LOAN (LOAN_ID,LOAN_DATE_TIME,DUE_DATE_TIME,CUST_ID) VALUES 
(LOAN_ID_SEQUENCE.NEXTVAL,to_date('15/DEC/18 12:00:00','DD/MON/RR HH24:MI:SS'),to_date('1/JAN/19 12:00:00','DD/MON/RR HH24:MI:SS'),105);
--INSERTS FOR LOANLINE
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,102);
--INSERTS FOR PAYMENT_INSTALLMENT
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 10,'DEPOSIT PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 40,'FINAL PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);
--INSERTS FOR LOAN
INSERT INTO LOAN (LOAN_ID,LOAN_DATE_TIME,DUE_DATE_TIME,CUST_ID) VALUES 
(LOAN_ID_SEQUENCE.NEXTVAL,to_date('5/JAN/19 14:00:00','DD/MON/RR HH24:MI:SS'),to_date('20/JAN/19 14:00:00','DD/MON/RR HH24:MI:SS'),102);
--INSERTS FOR LOANLINE
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,105);
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,106);
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,107);
--INSERTS FOR PAYMENT_INSTALLMENT
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 150,'LATE PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);
--INSERTS FOR LOAN
INSERT INTO LOAN (LOAN_ID,LOAN_DATE_TIME,DUE_DATE_TIME,CUST_ID) VALUES 
(LOAN_ID_SEQUENCE.NEXTVAL,to_date('5/FEB/19 13:00:00','DD/MON/RR HH24:MI:SS'),to_date('25/FEB/19 13:00:00','DD/MON/RR HH24:MI:SS'),100);
--INSERTS FOR LOANLINE
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,105);
--INSERTS FOR PAYMENT_INSTALLMENT
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 40,'FINAL PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);
--INSERTS FOR LOAN
INSERT INTO LOAN (LOAN_ID,LOAN_DATE_TIME,DUE_DATE_TIME,CUST_ID) VALUES 
(loan_id_sequence.NEXTVAL,TO_DATE('1/MAR/19 15:00:00','DD/MON/RR HH24:MI:SS'),TO_DATE('20/MAR/19 15:00:00','DD/MON/RR HH24:MI:SS'),106);
--INSERTS FOR LOANLINE
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,108);
INSERT INTO LOAN_LINE VALUES (LOAN_ID_SEQUENCE.CURRVAL,106);
--INSERTS FOR LOAN PAYMENT INSTALLMENT 
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 50,'FIRST PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);
INSERT INTO PAYMENT_INSTALMENT VALUES (PAY_ID_SEQUENCE.NEXTVAL, 40,'FINAL PAYMENT',NULL,LOAN_ID_SEQUENCE.CURRVAL);


COMMIT;

--Sample data for TRAINING_ACTIVITY table
INSERT INTO TRAINING_ACTIVITY (training_id,emp_id, cust_id,training_date_time,drone_id,training_duration,special_instructions) 
VALUES (TRAINING_ID_SEQUENCE.nextval,100, 100,to_date('13/NOV/18 14:00:00','DD/MON/RR HH24:MI:SS'),100,2.5,'take sample aerials');
INSERT INTO TRAINING_ACTIVITY (training_id,emp_id, cust_id,training_date_time,drone_id,training_duration,special_instructions) 
VALUES (TRAINING_ID_SEQUENCE.nextval,104, 104,to_date('18/JAN/19 15:00:00','DD/MON/RR HH24:MI:SS'),106,2,'take marketing videos');
INSERT INTO TRAINING_ACTIVITY (training_id,emp_id, cust_id,training_date_time,drone_id,training_duration) 
VALUES (TRAINING_ID_SEQUENCE.nextval,103, 108,to_date('17/APR/19 12:00:00','DD/MON/RR HH24:MI:SS'),104,3);
INSERT INTO TRAINING_ACTIVITY (training_id,emp_id, cust_id,training_date_time,drone_id,training_duration,special_instructions) 
VALUES (TRAINING_ID_SEQUENCE.nextval,100, 103,to_date('18/APR/19 16:00:00','DD/MON/RR HH24:MI:SS'),103,2.5,'take surveying videos');
INSERT INTO TRAINING_ACTIVITY (training_id,emp_id, cust_id,training_date_time,drone_id,training_duration) 
VALUES (TRAINING_ID_SEQUENCE.nextval,104, 106,to_date('20/NOV/18 13:00:00','DD/MON/RR HH24:MI:SS'),101,4);

COMMIT;


