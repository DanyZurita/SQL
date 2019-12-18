/* 1. */

    /* A. */

    ALTER TABLE BRANCHES DROP FOREIGN KEY branches_fk;

    /* B. */

    ALTER TABLE BANKS MODIFY ID char(5);

    /* C. */

    ALTER TABLE BRANCHES MODIFY ID_BANK char(5);

    /* D. */

    ALTER TABLE BANKS DROP PRIMARY KEY;
    ALTER TABLE BANKS ADD PRIMARY KEY (CODE);

    /* E. */

    /* Skipped letter. */

    /* F. */

    ALTER TABLE BRANCHES CHANGE COLUMN ID_BANK CODE_BANK char(5);

    /* G. */

    UPDATE BRANCHES AS B INNER JOIN (SELECT ID, CODE FROM BANKS) AS BK ON B.CODE_BANK = BK.ID SET B.CODE_BANK = BK.CODE;

    /* H. */

    ALTER TABLE BRANCHES ADD CONSTRAINT fk_bank_code FOREIGN KEY (CODE_BANK) REFERENCES BANKS(CODE) ON UPDATE CASCADE ON DELETE CASCADE;    

    /* I. */

    ALTER TABLE BANKS DROP COLUMN ID;

/* 2. */

    /* A. */

    ALTER TABLE AGREEMENTS DROP FOREIGN KEY agreements_fk;

    /* B. */

    ALTER TABLE PHONE_CALLS DROP FOREIGN KEY phone_calls_fk;

    /* C. */

    UPDATE AGREEMENTS AS A INNER JOIN (SELECT ID, NUMBER FROM PHONES) AS P ON A.ID_PHONE = P.ID SET A.ID_PHONE = P.NUMBER;

    /* D. */

    ALTER TABLE AGREEMENTS CHANGE COLUMN ID_PHONE PHONE int(9);

    /* E. */

    UPDATE PHONE_CALLS AS PC INNER JOIN (SELECT ID, NUMBER FROM PHONES) AS P ON PC.ID_PHONE = P.ID SET PC.ID_PHONE = P.NUMBER;

    /* F. */

    ALTER TABLE PHONE_CALLS CHANGE COLUMN ID_PHONE PHONE int(9);

    /* G. */

    DROP TABLE PHONES;

/* 3. */

    /* A. */

    ALTER TABLE INVOICE_LINES ADD COLUMN CODE_SERVICE char(5);

    /* B. */

    UPDATE INVOICE_LINES AS IL INNER JOIN (SELECT ID, CODE FROM SERVICES) AS S ON IL.ID_SERVICE = S.ID SET IL.CODE_SERVICE = S.CODE;

    /* C. */



    /* D. */



    /* E. */



    /* F. */



    /* G. */



    /* H. */



    /* I. */



    /* J. */



    /* K. */



    /* L. */



    /* M. */



    /* N. */



    /* O. */



/* 4. */



