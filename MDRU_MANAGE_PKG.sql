CREATE OR REPLACE PACKAGE "MDRU_MANAGE_PACKAGE" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */
    PROCEDURE insert_new_payment_procedure (
        arg_order_id     IN payment_instalment.order_id%TYPE,
        arg_pay_amount   IN payment_instalment.pay_amount%TYPE,
        arg_pay_desc     IN payment_instalment.pay_description%TYPE,
        arg_message      OUT CHAR
    );

    PROCEDURE manage_loan (
        arg_loanid          IN loan.loan_id%TYPE,
        returndate          IN loan.loan_return_date%TYPE,
        arg_return_status   OUT CHAR
    );

    PROCEDURE customer_drone_details (
        arg_custid               IN customer.cust_id%TYPE,
        out_cust_drone_details   OUT SYS_REFCURSOR
    );

END mdru_manage_package;

/


CREATE OR REPLACE PACKAGE BODY mdru_manage_package AS

--procedure for insert new payment

    PROCEDURE insert_new_payment_procedure (
        arg_order_id     IN payment_instalment.order_id%TYPE,
        arg_pay_amount   IN payment_instalment.pay_amount%TYPE,
        arg_pay_desc     IN payment_instalment.pay_description%TYPE,
        arg_message      OUT CHAR
    ) AS

        invalid_order EXCEPTION;
        order_count        NUMBER;
        newpayid           payment_instalment.pay_id%TYPE;
        order_complete     CHAR;
        arg_orderbalance   orders.order_balance%TYPE;
        invalid_payment EXCEPTION;
    BEGIN
        SELECT
            COUNT(*)
        INTO order_count
        FROM
            orders
        WHERE
            order_id = arg_order_id;

        IF order_count = 1 THEN
    --insert new payment into payment_instalment table
            SELECT
                order_balance
            INTO arg_orderbalance
            FROM
                orders
            WHERE
                order_id = arg_order_id;

            IF arg_orderbalance >= arg_pay_amount THEN
                INSERT INTO payment_instalment VALUES (
                    pay_id_sequence.NEXTVAL,
                    arg_pay_amount,
                    arg_pay_desc,
                    arg_order_id,
                    NULL
                );

                COMMIT;

  --Modify order_balance in ORDERS table
                UPDATE orders
                SET
                    order_balance = arg_orderbalance - arg_pay_amount
                WHERE
                    order_id = arg_order_id;

                COMMIT;
                SELECT
                    order_balance
                INTO arg_orderbalance
                FROM
                    orders
                WHERE
                    order_id = arg_order_id;

                IF arg_orderbalance = 0 THEN
                    arg_message := 'Order Completed';
                ELSE
                    arg_message := 'order balance remaining: ' || arg_orderbalance
                    ;
                END IF;

            ELSE
                RAISE invalid_payment;
            END IF;

        ELSE
            RAISE invalid_order;
        END IF;

    EXCEPTION
        WHEN invalid_order THEN
            raise_application_error(-20001,'Invalid Order - INSERT UNSUCCESSFUL.'
            );
        WHEN invalid_payment THEN
            raise_application_error(-20001,'Invalid Order - invalid payment.');
    END insert_new_payment_procedure;

-- procedure to manage_loan

    PROCEDURE manage_loan (
        arg_loanid          IN loan.loan_id%TYPE,
        returndate          IN loan.loan_return_date%TYPE,
        arg_return_status   OUT CHAR
    ) AS

        loan_returndate   loan.loan_return_date%TYPE;
        loancount         NUMBER;
        invalid_loan EXCEPTION;
        arg_droneid       drone.drone_id%TYPE;
        on_loancount      drone.drone_on_loan_count%TYPE;
        loan_return EXCEPTION;
        loan_issuedate    loan.loan_date_time%TYPE;
        invalid_returndate EXCEPTION;
        -- cursor holds all the drones for a particular loan_id 
        CURSOR loan_cursor IS SELECT
                                  d.drone_id,
                                  d.drone_on_loan_count
                              FROM
                                  loan_line l
                                  JOIN drone d ON l.drone_id = d.drone_id
                              WHERE
                                  loan_id = arg_loanid;

    BEGIN
    --check if loan id is unique
        SELECT
            COUNT(*)
        INTO loancount
        FROM
            loan
        WHERE
            loan_id = arg_loanid;

        IF loancount = 1 THEN
        --modifying the loan table to add in the return date
            SELECT
                loan_return_date
            INTO loan_returndate
            FROM
                loan
            WHERE
                loan_id = arg_loanid;
        -- check if loan has already been returned 

            IF loan_returndate IS NULL THEN
                UPDATE loan
                SET
                    loan_return_date = returndate
                WHERE
                    loan_id = arg_loanid;

                COMMIT;
                SELECT
                    loan_date_time
                INTO loan_issuedate
                FROM
                    loan
                WHERE
                    loan_id = arg_loanid;
            -- for each drone id updating the drone table

                IF TO_CHAR(loan_issuedate) <= TO_CHAR(loan_returndate) THEN
                    OPEN loan_cursor;
                    LOOP
                        FETCH loan_cursor INTO
                            arg_droneid,
                            on_loancount;
                        UPDATE drone
                        SET
                            drone_on_loan_count = on_loancount - 1
                        WHERE
                            drone_id = arg_droneid;

                        COMMIT;
                        EXIT WHEN loan_cursor%notfound;
                    END LOOP;

                    arg_return_status := 'all loans returned.';
                ELSE
                    RAISE invalid_returndate;
                END IF;

            ELSE
                RAISE loan_return;
            END IF;

        ELSE
            RAISE invalid_loan;
        END IF;

    EXCEPTION
        WHEN invalid_loan THEN
            raise_application_error(-20001,'INVALID LOAN. ');
        WHEN loan_return THEN
            raise_application_error(-20001,'LOAN ALREADY RETURNED. ');
        WHEN invalid_returndate THEN
            raise_application_error(-20001,'INVALID RETURN DATE. ');
    END manage_loan;

    PROCEDURE customer_drone_details (
        arg_custid               IN customer.cust_id%TYPE,
        out_cust_drone_details   OUT SYS_REFCURSOR
    ) AS

        custcount    NUMBER;
        invalid_cust EXCEPTION;    
    
    BEGIN
--Checking if the cust_id is unique
        SELECT
            COUNT(*)
        INTO custcount
        FROM
            customer
        WHERE
            cust_id = arg_custid;

        IF custcount = 1 THEN
    -- for each loan_id of a customer - get details into out_cust_drone_details
          
                OPEN out_cust_drone_details FOR SELECT
                                                    d.drone_id,
                                                    d.platform,
                                                    d.range,
                                                    TO_CHAR(d.manufacture_date) AS
                                                    manufacture_date,
                                                    d.rpl_required,
                                                    d.drone_for_rent,
                                                    d.drone_for_sale,
                                                    d.supplier_id,
                                                    TO_CHAR(l.loan_return_date,'DD/MON/RR HH24:MI:SS'
                                                    ) AS return_date
                                                FROM
                                                    loan l
                                                    JOIN loan_line lo ON lo.loan_id
                                                    = l.loan_id
                                                    JOIN drone d ON d.drone_id = lo
                                                    .drone_id
                                                WHERE
                                                    l.loan_id in (SELECT
                                       loan_id
                                       
                                   
                                   FROM
                                       loan
                                   WHERE
                                       cust_id = arg_custid);


               
        ELSE
            RAISE invalid_cust;
        END IF;

    EXCEPTION
        WHEN invalid_cust THEN
            raise_application_error(-20001,'INVALID CUSTOMER ID. ');
    END customer_drone_details;

END mdru_manage_package;
/
