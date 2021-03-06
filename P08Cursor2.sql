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

    DO
    $$
    DECLARE
        cursor2 CURSOR IS
            SELECT num, name
            FROM departments
            ORDER BY name;
        record2 RECORD;
    BEGIN
        FOR record2 IN cursor2 LOOP
            RAISE NOTICE '*** Department: %', record2.name;
            CALL emp_department(record2.num);
        END LOOP;
    END $$;

/* 8. */

    DO
    $$
        DECLARE
            cur CURSOR IS SELECT e.surname, e.salary, e.dept_num, d.name
                FROM employees e FULL OUTER JOIN departments d
                ON e.dept_num = d.num
                ORDER BY d.name, e.surname;
            rec RECORD;
            dep departments.num%TYPE;
            old_dep departments.num%TYPE;
            num_emp integer := 0;
            tot_emp integer := 0;
        BEGIN
            FOR rec IN cur LOOP
            dep := rec.dept_num;
            IF COALESCE(dep, 0) != COALESCE(old_dep, 0) THEN
            IF rec.dept_num IS NOT NULL THEN
            SELECT COUNT(num) INTO num_emp FROM employees WHERE
            dept_num = rec.dept_num;
            ELSE
            num_emp := 0;
            END IF;
            raise notice '*** Department: % Num. Employees: %', rec.name, num_emp;
            old_dep := dep;
            tot_emp := tot_emp + num_emp;
            END IF;
            IF rec.dept_num IS NOT NULL THEN
            raise notice 'Employee: % - % ', rec.surname, rec.salary;
            END IF;
            END LOOP;
            raise notice '*** Total num. employees: %', tot_emp;
        END
    $$;

/* 9. */

    CREATE or replace PROCEDURE upgrade_salary()
    LANGUAGE plpgsql
    AS $$
    DECLARE
        cur CURSOR IS
        SELECT e.num, e.salary, e.occupation, (s.avgsalary - e.salary)*0.5 as sal_diff
        FROM employees e,
            (SELECT AVG(salary) AS avgsalary, occupation
            FROM employees
                GROUP BY occupation) as s
            WHERE e.occupation = s.occupation AND
            e.salary < s.avgsalary;
        rec RECORD;
    BEGIN
        FOR rec IN cur LOOP
            UPDATE employees SET salary = salary + rec.sal_diff
            WHERE num = rec.num;
        END LOOP;
    END; $$

/* 10. */

    CREATE or replace PROCEDURE severance_pays()
    LANGUAGE plpgsql
    AS $$
    DECLARE
        cur CURSOR IS
        SELECT e.num, e.surname, e.name, d.name AS dname, e.occupation, e.salary, e.commission, trunc(extract(year from age(e.registration_date))/3) as nthreeyears, r.nemployees
        FROM employees e LEFT OUTER JOIN departments d ON e.dept_num=d.num INNER JOIN (SELECT m.num, count(e.num) as nemployees 
                                                                                        FROM employees m
                                                                                        LEFT OUTER JOIN employees e ON e.manager = m.num
                                                                                        GROUP BY m.num) as r ON r.num = e.num
            ORDER BY e.surname, e.name;
        rec RECORD;
        count integer := 1;
        three_extra CONSTANT integer := 50;
        resp_extra CONSTANT integer := 100;
    BEGIN
        FOR rec IN cur LOOP
            raise notice '******************************************************************';
            raise notice 'Severance pay number: % Department: %', count, rec.dname;
            raise notice 'Surname: %, Name: %', rec.surname, rec.name;
            raise notice 'Occupation: % Salary: %', rec.occupation, rec.salary;
            raise notice '3 full years extra (%x%): %', three_extra, rec.nthreeyears, three_extra*rec.nthreeyears;
            raise notice 'Responsibility complement (%x%): %', resp_extra, rec.nemployees, resp_extra*rec.nemployees;
            raise notice 'Commission: %', COALESCE(rec.commission,0);
            raise notice '';
            raise notice 'Total: %', rec.salary + three_extra*rec.nthreeyears + resp_extra*rec.nemployees + COALESCE(rec.commission,0);
            raise notice '******************************************************************';
            raise notice '';
            count := count + 1;
        END LOOP;
    END; 
    $$;

/* 11. */

    CREATE or replace PROCEDURE severance_pays(
    emp employees.num%TYPE,
    three_extra integer,
    resp_extra integer
    )
    LANGUAGE plpgsql
    AS $$
    DECLARE
        cur CURSOR IS
        SELECT e.num, e.surname, e.name, d.name AS dname, e.occupation, e.salary, e.commission, trunc(extract(year from age(e.registration_date))/3) as nthreeyears, r.nemployees
        FROM employees e LEFT OUTER JOIN departments d ON e.dept_num=d.num INNER JOIN (SELECT m.num, count(e.num) as nemployees
                                                                                        FROM employees m
                                                                                        LEFT OUTER JOIN employees e ON e.manager = m.num
                                                                                        WHERE m.num = emp
                                                                                        GROUP BY m.num) as r ON r.num = e.num
            ORDER BY e.surname, e.name;
        rec RECORD;
        count integer := 1;
    BEGIN
        OPEN cur;
            FETCH FROM cur INTO rec;
            raise notice '******************************************************************';
            raise notice 'Severance pay number: % Department: %', count, rec.dname;
            raise notice 'Surname: %, Name: %', rec.surname, rec.name;
            raise notice 'Occupation: % Salary: %', rec.occupation, rec.salary;
            raise notice '3 full years extra (%x%): %', three_extra, rec.nthreeyears, three_extra*rec.nthreeyears;
            raise notice 'Responsibility complement (%x%): %', resp_extra, rec.nemployees, resp_extra*rec.nemployees;
            raise notice 'Commission: %', COALESCE(rec.commission,0);
            raise notice '';
            raise notice 'Total: %', rec.salary + three_extra*rec.nthreeyears + resp_extra*rec.nemployees + COALESCE(rec.commission,0);
            raise notice '******************************************************************';
            raise notice '';
        CLOSE cur;
    END; 
    $$;

/* 12. */

    CREATE or replace PROCEDURE severance_pays2(
    t_name text
    )
    LANGUAGE plpgsql
    AS $$
    DECLARE
        t_constraint CONSTANT text := t_name || '_pk';
        cur CURSOR IS SELECT e.num, e.surname, e.name, d.name AS dname, e.occupation, e.salary, e.commission, trunc(extract(year from age(e.registration_date))/3) as nthreeyears, r.nemployees
        FROM employees e LEFT OUTER JOIN departments d ON e.dept_num=d.num INNER JOIN (SELECT m.num, count(e.num) as nemployees
                                                                                        FROM employees m
                                                                                        LEFT OUTER JOIN employees e ON e.manager = m.num
                                                                                        GROUP BY m.num) as r ON r.num = e.num
            ORDER BY e.surname, e.name;
        rec RECORD;
        count integer := 1;
        three_extra CONSTANT integer := 50;
        resp_extra CONSTANT integer := 100;
    BEGIN
        EXECUTE
        -- you can't use %TYPE inside create table,
        -- even if you use employees.num%TYPE
        format('CREATE TABLE if not exists %I (
        num integer NOT NULL,
        surname varchar(50),
        name varchar(50),
        occupation varchar(50),
        salary integer,
        three_y_periods integer,
        respon_comp integer,
        constraint %I PRIMARY KEY (num));',
        t_name, t_constraint);
        FOR rec IN cur LOOP
            EXECUTE
            format('INSERT INTO %I VALUES (%s, ''%s'', ''%s'', ''%s'', %s, %s, %s);',
            t_name, rec.num, rec.surname, rec.name,
            rec.occupation, rec.salary, rec.nthreeyears,
            rec.nemployees);
        END LOOP;
    END; 
    $$;
