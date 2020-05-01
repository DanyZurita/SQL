/* 1. Create a database with a table inside. This table must have a column called 
"mytstamp" with a default value of NOW() (mytstamp TIMESTAMP DEFAULT NOW()). Insert 
two rows into the new table. After that, create a trigger (and its associated function) 
to forbid deletion rows. Finally, delete the trigger. (3,33 points) */

    CREATE DATABASE exam; 
    \c exam
    CREATE TABLE triggersExam (
    mytstamp TIMESTAMP DEFAULT NOW()
    );
    INSERT INTO triggersExam default values;
    INSERT INTO triggersExam default values;

    CREATE or replace FUNCTION del_exam() RETURNS TRIGGER AS
    $$
    BEGIN
        RAISE EXCEPTION 'CANT DELETE ON THIS TABLE'
            USING HINT = 'You cant delete any row in this table';
        RETURN NULL;
    END;
    $$ language plpgsql;

    CREATE TRIGGER forbid_del
        BEFORE DELETE ON triggersExam 
            FOR EACH STATEMENT EXECUTE PROCEDURE del_exam();

    DROP TRIGGER forbid_del ON triggersExam;

/* 2. On the table created in exercise 1, create a new trigger (and its associated function)
to forbid updates of the column named "mytstamp" (raise an exception). Finally, delete the 
trigger. (3.34 points) */

    CREATE or replace FUNCTION upd_exam() RETURNS TRIGGER AS
    $$
    BEGIN
        IF OLD.mytstamp != NEW.mytstamp
        THEN RAISE EXCEPTION 'CANT UPDATE ON THIS TABLE'
            USING HINT = 'You cant update any row in this table';
        END IF;
        RETURN NULL;
    END;
    $$ language plpgsql;

    CREATE TRIGGER forbid_upd
        AFTER UPDATE ON triggersExam 
            FOR EACH ROW EXECUTE PROCEDURE upd_exam();

    DROP TRIGGER forbid_upd ON triggersExam;

/* 3. Imagine that you created a table called "my_table" with a field "id" (PK) in exercise 1 
and that you have this trigger on it: 

CREATE or replace FUNCTION f_ex_3() RETURNS TRIGGER AS
    $$
    BEGIN
        RAISE NOTICE 'OLD: %', OLD.id;
        RAISE NOTICE 'NEW: %', NEW.id;
        IF TG_OP = 'DELETE'
            THEN RETURN OLD;
        ELSE
            RETURN NULL;
        END IF;
    END;
    $$ language plpgsql;

    CREATE TRIGGER t_ex_3_1
        BEFORE INSERT OR DELETE ON mt_table
            FOR EACH ROW EXECUTE PROCEDURE f_ex_3();

If you insert a row into the table, which values will be printed for OLD and NEW records? 
And which values will if be printed if you delete a row? Explain your answer. (3.34 points) 
*/ 

/* In the 1st case (INSERT) the NEW.id value will be the value you are inserting and the OLD.id 
value in the RAISE NOTICE will be NULL beacuse the row has no id before inserting one. En the 
2º case (DELETE) the OLD.id value will be the last value the id had and NEW.id value will be 
NULL because the deletion does not leave a new value. */  