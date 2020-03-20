/* 0. */

    /* CREATE DATABASE cursor2 */
    /* \c cursor2 */
    /* \i /mnt/c/Users/dajoz/Downloads/EMPLOYEESDB_2.sql */

    /* PARA PODER UTILIZAR LAS PROCEDURES ES NECESARIO USAR POSTGRESQL 11 O SUPERIOR */

/* 1. */

    CREATE  OR REPLACE PROCEDURE get_emp_date() 
    LANGUAGE plpgsql as $$
        DECLARE 
            cursor CURSOR IS 
                SELECT e.num, e.surname, e.name, e.registration_date 
                FROM employees e 
                ORDER BY e.surname, e.name;
            record RECORD; 
        BEGIN 
            OPEN cursor; 
            FETCH FROM cursor INTO record;
            WHILE FOUND LOOP
                raise notice '%, %, %, %', record.num, record.surname, record.name, record.registration_date; 
                FETCH FROM cursor INTO record;
            END LOOP;  
            CLOSE cursor;  
        END;
    $$;

/* 2. */

    CREATE OR REPLACE PROCEDURE get_emp_date_for() 
    LANGUAGE plpgsql as $$
        DECLARE 
            cursor CURSOR IS 
                SELECT e.num, e.surname, e.name, e.registration_date 
                FROM employees e 
                ORDER BY e.surname, e.name;
            record RECORD; 
        BEGIN 
            FOR record IN cursor LOOP 
                raise notice '%, %, %, %', record.num, record.surname, record.name, record.registration_date; 
            END LOOP; 
        END; 
    $$;

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


