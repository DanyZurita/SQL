/* 0. */

    /* CREATE DATABASE triggers */
    /* \c triggers */
    /* \i /mnt/c/Users/dajoz/Downloads/EMPLOYEESDB.sql */

/* 1. */

    /* Name to assign to the trigger: insert_mondays */
    /* Name to assign to the function runned by the TRIGGER: if_monday() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: employees */
    /* When the trigger will be executed (BEFORE or AFTER): BEFORE */
    /* Operation that will activate the trigger: INSERT */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row inserted */

    CREATE or replace FUNCTION if_monday() RETURNS TRIGGER AS
    $$
    BEGIN
        IF (to_char(NOW(), 'Dy') != 'Mon') 
            THEN RAISE EXCEPTION 'INSERT EMPLOYEE MONDAY'
                USING HINT = 'You can only insert employees on Monday!';
        END IF;
        RETURN NULL;
    END;
    $$ language plpgsql;

    CREATE TRIGGER insert_mondays
        BEFORE INSERT ON employees 
            FOR EACH STATEMENT EXECUTE PROCEDURE if_monday();


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

    

/* 14. */

    

/* 15. */

    

/* 16. */

    

/* 17. */

            

/* 18. */

    

/* 19. */

    

/* 20. */

