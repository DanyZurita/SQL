/* 1. */

    CREATE DATABASE MiniPremiereLeague
    USE MiniPremiereLeague

/* 2. */

    CREATE TABLE TEAMS ('tid' SMALLINT NOT NULL, 'tname' VARCHAR(50) NOT NULL UNIQUE, 'tyear' SMALLINT)

/* 3. */

    CREATE TABLE TEAMS (tid SMALLINT NOT NULL, 
                        tname VARCHAR(50) NOT NULL UNIQUE, 
                        tyear SMALLINT, 
                        PRIMARY KEY (tid), 
                        CHECK (tyear > 1875));

/* 4. */



/* 5. */




/* 6. */



/* 7. */



/* 8. */



/* 9. */



/* 10. */



/* 11. */



/* 12. */



/* 13. */


