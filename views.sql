/* 1. */

    CREATE VIEW V_DEPARTMENTS AS
        SELECT D.num, D.name, D.town_code, T.name AS town_name, COUNT(E.num) AS num_employees 
        FROM DEPARTMENTS AS D LEFT OUTER JOIN TOWNS AS T ON D.town_code = T.code 
                            LEFT OUTER JOIN EMPLOYEES AS E ON D.num = E.dept_num 
                            GROUP BY D.num;

/* 2. */

    ALTER VIEW V_DEPARTMENTS AS
        SELECT D.num, D.name, D.town_code, T.name AS town_name, COUNT(E.num) AS num_employees, AVG(E.salary) AS average_salary
        FROM DEPARTMENTS AS D LEFT OUTER JOIN TOWNS AS T ON D.town_code = T.code 
                            LEFT OUTER JOIN EMPLOYEES AS E ON D.num = E.dept_num 
                            GROUP BY D.num;

/* 3. */

   INSERT INTO DEPARTMENTS VALUES (60, 'Human Resources', 'MAD');
   INSERT INTO EMPLOYEES VALUES (9999, 'GONZALEZ', 'SERGI', NULL, '2019-01-01', 9000, NULL, 60, NULL);
   SELECT * FROM V_DEPARTMENTS;

/* 4. */

    

/* 5. */



/* 6. */



/* 7. */


