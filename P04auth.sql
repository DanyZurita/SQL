/* 1. */

    CREATE USER 'dany'@'localhost' IDENTIFIED BY 'alualualu';

/* 2. */

    GRANT DELETE ON SQL1NORMALAUTH.EMPLOYEES TO 'dany'@'localhost';
    GRANT SELECT ON SQL1NORMALAUTH.EMPLOYEES TO 'dany'@'localhost';
    GRANT SELECT ON SQL1NORMALAUTH.OCCUPATIONS TO 'dany'@'localhost';

/* 3. */

    GRANT DELETE, SELECT ON SQL1NORMALAUTH.EMPLOYEES TO 'dany'@'%';
    GRANT SELECT ON SQL1NORMALAUTH.OCCUPATIONS TO 'dany'@'%';

/* 4. */

    REVOKE DELETE, SELECT ON SQL1NORMALAUTH.EMPLOYEES FROM 'dany'@'%';
    REVOKE SELECT ON SQL1NORMALAUTH.OCCUPATIONS FROM 'dany'@'%';

/* 5. */

    GRANT UPDATE, SELECT ON SQL1NORMALAUTH.EMPLOYEES TO 'dany'@'localhost';
    GRANT SELECT ON SQL1NORMALAUTH.DEPARTMENTS TO 'dany'@'localhost';

/* 6. */

    

/* 7. */

    

/* 8. */

    

/* 9. */

    

/* 10. */

    