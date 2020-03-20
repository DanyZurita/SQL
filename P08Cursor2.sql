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

    /* With agregate function */
    CREATE OR REPLACE PROCEDURE dep_emp()
    LANGUAGE PLPGSQL AS $$ 
        DECLARE 
            cursor CURSOR IS 
                SELECT d.name, count(e.dept_num) as countEmp
                FROM employees as e right join departments as d on e.dept_num = d.num
                GROUP BY d.name
                ORDER BY d.name;
            record RECORD; 
        BEGIN 
        FOR record IN cursor LOOP 
            raise notice 'Department: % - Num. Employees: %', record.name, record.countEmp; 
            END LOOP;  
        END; 
    $$;

    /* Without agregate function */
    CREATE OR REPLACE PROCEDURE dep_emp()
    LANGUAGE PLPGSQL AS $$ 
        DECLARE 
            cursor CURSOR IS 
                SELECT d.name, e.dept_num
                FROM employees as e right join departments as d on e.dept_num = d.num
                ORDER BY d.name;
            record RECORD;
            dep text;
            numEmp integer;
        BEGIN 
            FOR record IN cursor LOOP
                dep := record.name;
                FOR name IN record LOOP
                    IF record.dept_num IS NULL 
                    THEN numEmp := numEmp + 0;
                    ELSE numEmp := numEmp + 1;
                    END IF;
                END LOOP;
                raise notice 'Department: % - Num. Employees: %', dep, numEmp;
                numEmp := 0;
            END LOOP;  
        END; 
    $$;


/* 4. */

    CREATE OR REPLACE PROCEDURE best_salaries()
    LANGUAGE PLPGSQL AS $$ 
        DECLARE 
            cursor CURSOR IS 
                SELECT surname, salary 
                FROM employees 
                ORDER BY salary DESC;
            record RECORD;
            i integer := 0;
        BEGIN 
            FOR record IN cursor LOOP
                i := i + 1;
                IF i <= 5 THEN
                raise notice 'Department: % - Num. Employees: %', record.surname, record.salary;
                ELSE EXIT;
                END IF;
            END LOOP;  
        END; 
    $$;

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


