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

    
