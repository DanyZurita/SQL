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

    

    /* B. */



    /* C. */



    /* D. */



    /* E. */



    /* F. */



    /* G. */



/* 3. */

    /* A. */



    /* B. */



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



