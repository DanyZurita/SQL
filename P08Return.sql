/* 0. */

    /* scp C:\Users\dajoz\Downloads\dellstore2-normal-1.0.sql alumne@192.168.56.101:/home/alumne */
    create table dell;
    REVOKE ALL PRIVILEGES ON SCHEMA public FROM PUBLIC;
    create schema data GRAND ;
    set search_path to data;
    \i /home/alumne/dellstore2-normal-1.0.sql 
    ALTER DATABASE dell OWNER TO alumne;
    alter table categories owner to alumne;
    alter table cust_hist owner to alumne;
    alter table customers owner to alumne;
    alter table inventory owner to alumne;
    alter table orderlines owner to alumne;
    alter table orders owner to alumne;
    alter table products owner to alumne;
    alter table reorder owner to alumne;

/* 1. */

    

/* 2. */

    

/* 3. */



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

    
