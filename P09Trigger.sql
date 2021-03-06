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

    /* Name to assign to the trigger: dep_register */
    /* Name to assign to the function runned by the TRIGGER: register_dep_inserts() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: departments */
    /* When the trigger will be executed (BEFORE or AFTER): AFTER */
    /* Operation that will activate the trigger: INSERT */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row inserted */

    CREATE or replace FUNCTION register_dep_inserts() RETURNS TRIGGER AS
    $$
    BEGIN
        INSERT INTO audit_dep VALUES (current_timestamp, current_user, 'num', TG_OP, NULL, NEW.num);
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER dep_register
        AFTER INSERT ON departments 
		    FOR EACH ROW EXECUTE PROCEDURE register_dep_inserts();

/* 3. */

    /* Name to assign to the trigger: del_dep_register */
    /* Name to assign to the function runned by the TRIGGER: register_dep_deletes() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: departments */
    /* When the trigger will be executed (BEFORE or AFTER): BEFORE */
    /* Operation that will activate the trigger: DELETE */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row deleted */

    CREATE or replace FUNCTION register_dep_deletes() RETURNS TRIGGER AS
    $$
    BEGIN
        INSERT INTO audit_dep VALUES (current_timestamp, current_user, 'num', TG_OP, OLD.num, NULL);
        RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER del_dep_register
        BEFORE DELETE ON departments 
		    FOR EACH ROW EXECUTE PROCEDURE register_dep_deletes();

/* 4. */

    /* Name to assign to the trigger: upd_dep_register */
    /* Name to assign to the function runned by the TRIGGER: register_dep_updates() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: departments */
    /* When the trigger will be executed (BEFORE or AFTER): AFTER */
    /* Operation that will activate the trigger: UPDATE */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row updated */
    CREATE or replace FUNCTION register_dep_updates() RETURNS TRIGGER AS
    $$
    BEGIN
        IF OLD.name != NEW.name 
            THEN INSERT INTO audit_dep VALUES (current_timestamp, current_user, 'name', TG_OP, OLD.name, NEW.name);
        END IF;
        IF OLD.town != NEW.town 
            THEN INSERT INTO audit_dep VALUES (current_timestamp, current_user, 'town', TG_OP, OLD.town, NEW.town);
        END IF;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;


    CREATE TRIGGER upd_dep_register
        AFTER UPDATE ON departments
	        FOR EACH ROW EXECUTE PROCEDURE register_dep_updates();


/* 5. */

    /* Yes, because if you update both name and town later you wont know the exact row that had those parameters without looking the name in the register and looking for it in departments as many time as it has been changed. */
    
    ALTER TABLE audit_dep ADD COLUMN num INTEGER;

    ALTER TABLE audit_dep ADD CONSTRAINT audit_dep_pkey PRIMARY KEY (num, ad_date);

/* 6. */

    /* Name to assign to the trigger: palma_dep_register */
    /* Name to assign to the function runned by the TRIGGER: register_dep_palma() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: departments */
    /* When the trigger will be executed (BEFORE or AFTER): BEFORE */
    /* Operation that will activate the trigger: UPDATE or INSERT */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row updated or inserted */

    CREATE or replace FUNCTION register_dep_palma() RETURNS TRIGGER AS
    $$
    BEGIN
        NEW.town := 'PALMA';
        return NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER palma_dep_register
        BEFORE INSERT OR UPDATE ON departments
            FOR EACH ROW EXECUTE PROCEDURE register_dep_palma();

/* 7. */          

    /* Name to assign to the trigger: emp_min_salary */
    /* Name to assign to the function runned by the TRIGGER: emp_min_salary() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: employees */
    /* When the trigger will be executed (BEFORE or AFTER): AFTER */
    /* Operation that will activate the trigger: INSERT */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row inserted without min salary */

    ALTER TABLE employees DISABLE TRIGGER insert_mondays;

    CREATE or replace FUNCTION emp_min_salary() RETURNS TRIGGER AS
    $$
    BEGIN
        IF (NEW.salary < 900) THEN
            RAISE EXCEPTION 'NOT MINIMUM SALARY!'
                USING HINT = 'Minimum salary in Spain is 900€';
            return NULL;
        ELSE
            return NEW;
        END IF;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER emp_min_salary
        AFTER INSERT ON employees
            FOR EACH ROW EXECUTE PROCEDURE emp_min_salary();

    ALTER TABLE employees ENABLE TRIGGER insert_mondays;

/* 8. */

    /* Name to assign to the trigger: emp_min_salary */
    /* Name to assign to the function runned by the TRIGGER: emp_min_salary() */
    /* Table on what the trigger will ‘jump’ when an operation is performed: employees */
    /* When the trigger will be executed (BEFORE or AFTER): AFTER */
    /* Operation that will activate the trigger: INSERT */
    /* The execution of the trigger will be executed for each row (several times) or only when the sentence is executed (one time): Executed for every row inserted without min salary */

    CREATE or replace VIEW full_employees AS 
        SELECT e.num, e.surname, e.name, e.occupation, e.manager, e.registration_date, e.salary, e.commission, e.dept_num, d.name AS dname, d.town
        FROM employees e LEFT OUTER JOIN departments d ON e.dept_num=d.num;

    ALTER TABLE employees DISABLE TRIGGER insert_mondays;

    CREATE or replace FUNCTION insert_on_view() RETURNS TRIGGER AS
    $$
    BEGIN
    INSERT INTO departments (num, name, town)
    SELECT s.dept_num, s.dname, s.town
    FROM  (SELECT NEW.*) AS s;

    INSERT INTO employees (num, surname, name, occupation, manager, registration_date, salary, commission, dept_num)
    SELECT s.num, s.surname, s.name, s.occupation, s.manager, s.registration_date, s.salary, s.commission, s.dept_num
    FROM  (SELECT NEW.*) AS s;  
    RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER insert_on_view
        INSTEAD OF INSERT ON full_employees
            FOR EACH ROW EXECUTE PROCEDURE insert_on_view();

/* 9. */

    select * from information_schema.triggers;

/* 10. */

    ALTER TABLE departments DISABLE TRIGGER ALL;
    ALTER TABLE employees DISABLE TRIGGER ALL;

/* 11. */

    CREATE OR REPLACE PROCEDURE delete_triggers_on(tables text)
    LANGUAGE plpgsql
    AS $$
    DECLARE
        cursor CURSOR (table1 text) is SELECT distinct trigger_name as tname, event_object_table as ttname from information_schema.triggers where event_object_table = table1;
        record RECORD;
    BEGIN
        FOR record in cursor(tables) LOOP
            EXECUTE 'DROP TRIGGER ' || record.tname || ' ON ' || record.ttname || ';';
            RAISE NOTICE 'TRIGGER " % " has been DELETED from  %', record.tname, record.ttname;            
        END LOOP;
    END
    $$;

    CALL delete_triggers_on('departments');
    CALL delete_triggers_on('employees');
    CALL delete_triggers_on('full_employees');
