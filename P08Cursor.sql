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

    

/* 4. */

    

/* 5. */

    
