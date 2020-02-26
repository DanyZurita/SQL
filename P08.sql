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



/* 8. */

    

/* 9. */

    

/* 10. */

    
