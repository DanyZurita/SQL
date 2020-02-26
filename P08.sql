/* 1. */

    CREATE DATABASE sql1;

/* 2. */

    REVOKE ALL ON DATABASE sql1 FROM public;  

/* 3. */

    \c sql1
    REVOKE ALL ON SCHEMA public FROM public;

/* 4. */

    CREATE USER alumne WITH PASSWORD 'alualualu';

/* 5. */

    \c sql1
    CREATE SCHEMA data;

/* 6. */

    REVOKE ALL ON SCHEMA data FROM public;

/* 7. */          

    ALTER ROLE alumne SET search_path TO data;

/* 8. */

    ALTER DATABASE sql1 OWNER TO alumne; 
    ALTER SCHEMA data OWNER TO alumne;

/* 9. */

    

/* 10. */

    
