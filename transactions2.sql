/* 1. */

    su /* alualualu */
    mysql
    CREATE DATABASE TestDB

/* 2. */

    GRANT ALL ON TestDB.* TO 'student'@'localhost' IDENTIFIED BY 'alualualu';

/* 3. */

    EXIT
    EXIT

/* 4. */

    mysql -h localhost -u alumne -palualualu TestDB

/* 5. */

    CREATE TABLE T (id int(10) NOT NULL, s varchar(40), si int(5), PRIMARY KEY (id))

/* 6. */

    DESCRIBE T

/* 7. */

    INSERT INTO T (id, s) VALUES (1, 'first'), (2, 'second'), (3, 'third');
    SELECT * FROM T

/* 8. */

    ROLLBACK
    SELECT * FROM T
    /* No, because the DDL sentences do not count for a rollback. */

/* 9. */

    START TRANSACTION
    INSERT INTO T (id, s) VALUES (1, 'first'), (2, 'second'), (3, 'third')
    DELETE FROM T
    ROLLBACK
    SELECT * FROM T
    /* Yes, to the original point where the Table T only had 3 elements. */

/* 10. */

    INSERT INTO T (id, s) VALUES (4, 'fourth');
    ROLLBACK;
    SELECT * FROM T;
    /* The 4º row was added and not rollbacked because there is no transaction started. */

/* 11. */

    SET autocommit = 0
    /* o */
    SET autocommit = OFF

/* 12. */

    DELETE FROM T
    COMMIT

/* 13. */

    INSERT INTO T (id, s) VALUES (5, 'fifth'), (6, 'sixth')
    SELECT * FROM T

/* 14. */

    ROLLBACK
    SELECT * FROM T
    /* No, beacuse the rollback turned the table to the last commit */

/* 15. */

    SET AUTOCOMMIT=0;
    INSERT INTO T (id, s) VALUES (9, 'will this be committed?');
    CREATE TABLE T2 (id INT);
    INSERT INTO T2 (id) VALUES (1);
    SELECT * FROM T2;
    ROLLBACK;
    DROP TABLE T2;
    COMMIT;
    /* Disableing autocommit, inserting a row into T, creating a table T2,
    inserting 1 row into T2, selecting T2 table, rollback did nothing,
    dropping table T2 and commiting everything. */
    SELECT * FROM T;
    DESCRIBE T2;
    /* Showing that the inserted values in T are commited and the dropping
    of the table T2 has been done. */

/* 16. */

    SET AUTOCOMMIT=0;
    DELETE FROM T;
    COMMIT;
    SELECT * FROM T;
    /* Deleting values in T and commiting. */
    SHOW ERRORS
    SHOW WARNINGS
    /* Commands of errors and warnings. */
    SET AUTOCOMMIT=0;
    INSERT INTO T (id, s) VALUES (1, 'This row is OK, but errors start here...');
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Adding 1 value to T. Checking erros and warnings. */
    SELECT (1/0) AS dummy FROM DUAL;
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Forcing a warning. */
    UPDATE T SET s = 'foo' WHERE id = 9999 ;
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Its not an error/warning. */
    DELETE FROM T WHERE id = 7777 ;
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Its not an error/warning. */
    INSERT INTO T (id, s) VALUES (1, 'Hi, I am a duplicate');
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Its an error and a mistake. */
    INSERT INTO T (id, s) VALUES (3, 'How about inserting too long of a string value?');
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Its an error and a mistake. Adding more than 40 chars in a varchar(40). */
    INSERT INTO T (id, s, si) VALUES (4, 'Smallint overflow for 32769?', 32769);
    SHOW ERRORS;
    SHOW WARNINGS;
    /* Its not an error/warning. This shoud give and error but I had int(5). */

/* 17. */

    INSERT INTO T (id, s) VALUES (5, 'Is the transaction still active?');
    SELECT * FROM T;
    /* No, because rollbacking ends the transaction. */

/* 18. */

    START TRANSACTION
    INSERT INTO T (id,s) VALUES (8, 'killing test')

    /* From other prompt:
    ssh alumne@192.168.56.101
    ps -el | grep mysql
    */
    /* Tracking the mysql service. In my case the 3rd value was 3104.
    kill -9 3104
    */
    /* Kills the process of mysql */

    /*
    Killed
    mysql -h localhost -u alumne -palualualu TestDB
    */
    SELECT * FROM T
    /* The data inserted is not registered (rollbacked by mysql killed). */
