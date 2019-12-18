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

    CREATE VIEW V_EMPLOYEES AS
        SELECT E.num, E.surname, E.name, E.manager, E.start_date, E.salary, D.name AS dept_name, O.name AS occu_name
        FROM EMPLOYEES AS E LEFT OUTER JOIN DEPARTMENTS AS D ON D.num = E.dept_num
                            LEFT OUTER JOIN OCCUPATIONS AS O ON O.code = E.occu_code;

/* 5. */

    CREATE VIEW V_EMPLOYEES_FULL AS
        SELECT V1.num, V1.surname, V1.name, V1.manager, V1.start_date, V1.salary,V1.dept_name, V1.occu_name , V2.surname AS man_surname,V2.name AS man_name
        FROM V_EMPLOYEES AS V1 LEFT OUTER JOIN V_EMPLOYEES AS V2 ON V1.manager = V2.num;


/* 6. */

    UPDATE V_EMPLOYEES SET surname = 'GONZALES'
        WHERE num = 9999;
    /* Yes, changed in the view and in the employees table. */

/* 7. */

    INSERT INTO V_EMPLOYEES VALUES (1, 'ZURITA', 'DANY', NULL, '2019-10-01', 10000);
    /* No, the view is a not insertable-into. */
