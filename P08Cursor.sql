/* 0. */

    /* create database employeesdb */
    /* \c employeesdb */
    /* \i /mnt/c/Users/dajoz/Downloads/EMPLOYEESDB.sql */

/* 1. */

    DO $$
    DECLARE
        Nums integer;
        Names text;
        Surnames text;
        Dept_nums integer;
        empCursor CURSOR for SELECT num, name, surname, dept_num from employees order by surname, name;
    BEGIN
        OPEN empCursor;
        fetch empCursor into Nums, Names, Surnames, Dept_nums;
        raise notice '% % % %', Nums, Names, Surnames, Dept_nums;
        fetch last from empCursor into Nums, Names, Surnames, Dept_nums;
        raise notice '% % % %', Nums, Names, Surnames, Dept_nums;
        CLOSE empCursor;
    END
    $$ language plpgsql;

/* 2. */

    DO $$
    DECLARE
        Nums integer;
        Names text;
        Surnames text;
        Dept_nums integer;
        empCursor refcursor;
    BEGIN
        OPEN empCursor for SELECT num, name, surname, dept_num from employees order by surname, name;
        fetch empCursor into Nums, Names, Surnames, Dept_nums;
        raise notice '% % % %', Nums, Names, Surnames, Dept_nums;
        fetch last from empCursor into Nums, Names, Surnames, Dept_nums;
        raise notice '% % % %', Nums, Names, Surnames, Dept_nums;
        CLOSE empCursor;
    END
    $$ language plpgsql;

/* 3. */

    DO $$
    DECLARE
        Nums integer;
        Names text;
        Surnames text;
        Dept_nums integer;
        empCursor CURSOR (key integer) is SELECT num, name, surname, dept_num from employees where num = key;
    BEGIN
        OPEN empCursor(8000);
        fetch empCursor into Nums, Names, Surnames, Dept_nums;
        raise notice '% % % %', Nums, Names, Surnames, Dept_nums;
        CLOSE empCursor;
    END
    $$ language plpgsql;

/* 4. */

    create or replace function numrows(tablename text) 
    returns integer as $$
    DECLARE
        tablename text := $1;
        result integer;
        countCursor refcursor;
    BEGIN
        OPEN countCursor  FOR EXECUTE 'SELECT COUNT(*) FROM ' || tablename;
        fetch countCursor into result;
        CLOSE countCursor;
        return result;
    END
    $$ language plpgsql;

/* 5. */



/* Z. */

    /* Con un for */
    CREATE or replace FUNCTION get_emp_date() RETURNS void AS $$ 
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
    $$ LANGUAGE plpgsql;

    /* Con un while */
    CREATE or replace FUNCTION get_emp_date2() RETURNS void AS $$ 
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
    $$ LANGUAGE plpgsql;

/* Y. */

    /* With agregate function */
    CREATE or replace FUNCTION dep_emp() RETURNS void AS $$ 
        DECLARE 
            cursor CURSOR IS 
                SELECT d.name, count(e.dept_num) as countEmp
                FROM employees as e right join departments as d on e.dept_num = d.num
                GROUP BY d.name;
            record RECORD; 
        BEGIN 
        FOR record IN cursor LOOP 
            raise notice 'Department: % - Num. Employees: %', record.name, record.countEmp; 
            END LOOP;  
        END; 
    $$ LANGUAGE plpgsql;

    /* Without agregate function */
    CREATE or replace FUNCTION dep_emp2() RETURNS void AS $$ 
        DECLARE 
            cursor CURSOR IS 
                SELECT d.name, e.dept_num
                FROM employees as e right join departments as d on e.dept_num = d.num
                GROUP BY d.name;
            record RECORD; 
        BEGIN 
        FOR record IN cursor LOOP 
            raise notice 'Department: % - Num. Employees: %', record.name, record.countEmp; 
            END LOOP;  
        END; 
    $$ LANGUAGE plpgsql;
