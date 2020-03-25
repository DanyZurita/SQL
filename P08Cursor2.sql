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

    /* With window function */
    CREATE or replace PROCEDURE salaries_occupation_v1()
    LANGUAGE plpgsql
    AS $$
        DECLARE
            e_cur CURSOR IS
            SELECT occupation, surname, salary, rank()

            OVER (PARTITION BY occupation ORDER BY salary desc) AS pos
            FROM EMPLOYEES;
            r_emp RECORD;
        BEGIN
            FOR r_emp IN e_cur LOOP
                IF r_emp.pos = 1 THEN
                raise notice 'Employee: % - Salary: % - Occupation: %',
                r_emp.surname, r_emp.salary, r_emp.occupation;
                END IF;
            END LOOP;
        END; 
    $$;

    /* Without window function */
    CREATE OR REPLACE PROCEDURE salaries_occupation_v2()
    LANGUAGE plpgsql
    AS $$
        DECLARE
        salarymax INTEGER := 0;
        lastocup text = ' ';
        rec RECORD;
        cursor CURSOR FOR SELECT surname, salary, occupation 
            FROM employees 
            ORDER BY occupation, salary DESC;
        BEGIN
            FOR rec IN cursor LOOP
                IF rec.occupation <> lastocup THEN
                lastocup := rec.occupation;
                salarymax := rec.salary;
                END IF;
                IF rec.salary = salarymax AND rec.occupation = lastocup 
                THEN RAISE NOTICE 'Employee: % - Salary: % - Occupation: %', rec.surname, rec.salary, rec.occupation;
                END IF;
            END LOOP;
        END;
    $$;

/* 6. */

    CREATE or REPLACE PROCEDURE emp_department(DepEmp employees.dept_num%TYPE)
    LANGUAGE plpgsql
    AS $$
    DECLARE
        cursor1 CURSOR (TwoDepEmp employees.dept_num%TYPE) IS
            SELECT *
            FROM employees
            WHERE dept_num = TwoDepEmp;
        record1 RECORD;
    BEGIN
        FOR record1 IN cursor1(DepEmp) LOOP
            RAISE NOTICE 'Num: % - Surname: % - Occupation: %',
            record1.num, record1.surname, record1.occupation;
        END LOOP;
    END;
$$;

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


