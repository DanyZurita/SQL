/* 1. */

    /* Done. */

/* 2. */

    /* Done. */

/* 3. */

    SET autocommit = 0
    /* o */
    SET autocommit = OFF
    /* and */
    START TRANSACTION;

/* 4. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E

/* 5. */

    UPDATE EMPLOYEES SET comission = comission * 1.20

/* 6. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E
    /* Yes, 20% higher. (618.0000) */

/* 7. */

    DELETE FROM EMPLOYEES WHERE surname = "TOVAR"

/* 8. */

    ROLLBACK

/* 9. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E
    SELECT * FROM EMPLOYEES WHERE surname = "TOVAR"

/* 10. */

    START TRANSACTION
    SAVEPOINT SPINCCOMMISSION

/* 11. */

    UPDATE EMPLOYEES SET comission = comission * 1.20

/* 12. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E
    /* Yes, 20% higher. (618.0000) */

/* 13. */

    SAVEPOINT SPDELTOVAR

/* 14. */

    DELETE FROM EMPLOYEES WHERE surname = "TOVAR"

/* 15. */

    ROLLBACK TO SAVEPOINT SPDELTOVAR

/* 16. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E
    SELECT * FROM EMPLOYEES WHERE surname = "TOVAR"

/* 17. */

    COMMIT

/* 18. */

    SELECT AVG(E.comission) FROM EMPLOYEES AS E
    SELECT * FROM EMPLOYEES WHERE surname = "TOVAR"
    /* The 20% raise of commission is implemented and the employee TOVAR is in the DB */
