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
    CREATE or replace PROCEDURE dep_num_v2()
    language plpgsql
    AS $$
    DECLARE
        cur CURSOR FOR SELECT d.name AS dname, e.num FROM departments d
                    LEFT OUTER JOIN employees e
                    ON e.dept_num=d.num
                    ORDER BY d.name;
        numemp int := 0;
        old_dept text := NULL;
    BEGIN
        FOR rec IN cur LOOP
            IF old_dept is NOT NULL AND old_dept != rec.dname THEN
                RAISE NOTICE 'Department: % - Num. employees: %', old_dept, numemp;
                old_dept := rec.dname;
                IF rec.num IS NOT NULL THEN
                    numemp := 1;
                ELSE
                    numemp := 0;
                END IF;
            ELSE
                old_dept := rec.dname;
                IF rec.num IS NOT NULL THEN
                    numemp := numemp + 1;
                END IF;
            END IF;
        END LOOP;
        RAISE NOTICE 'Department: % - Num. employees: %', old_dept, numemp;
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


