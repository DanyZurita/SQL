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

    /* Name to assign to the trigger: del_dep_register */
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


