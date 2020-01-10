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

    GRANT UPDATE, SELECT ON SQL1NORMALAUTH.EMPLOYEES TO 'dany'@'%';
    GRANT SELECT ON SQL1NORMALAUTH.DEPARTMENTS TO 'dany'@'%';

/* 7. */

    CREATE VIEW V_DANY AS 
        SELECT * 
        FROM SQL1NORMALAUTH.EMPLOYEES AS E
            WHERE E.salary < 1500
            AND E.dept_num IN (SELECT * 
                                FROM SQL1NORMALAUTH.EMPLOYEES AS EE
                                GROUP BY EE.dept_num
                                HAVING COUNT(*) > 7);
    
    GRANT SELECT ON SQL1NORMALAUTH.V_DANY TO 'dany'@'localhost';           

/* 8. */

    GRANT DELETE ON SQL1NORMALAUTH.V_DANY TO 'dany'@'localhost';
    DELETE FROM SQL1NORMALAUTH.V_DANY WHERE num=1000;

/* 9. */

    ALTER USER 'dany'@'%' ACCOUNT LOCK;

/* 10. */

    
