/* 1. */

    /* Explicit Inner Join */
    SELECT CONCAT(E.name, " ", E.surname) AS fullname, E.salary, O.name 
	FROM EMPLOYEES AS E INNER JOIN OCCUPATIONS AS O
    ON E.occu_code = O.code
    WHERE E.salary NOT BETWEEN 1100 AND 2000
    ORDER BY fullname

    /* Implicit Inner Join */
    SELECT CONCAT(E.name, " ", E.surname) AS fullname, E.salary, O.name 
	FROM EMPLOYEES AS E, OCCUPATIONS AS O
    WHERE E.occu_code = O.code
    AND E.salary NOT BETWEEN 1100 AND 2000
    ORDER BY fullname

    /* Left Outer Join */
    SELECT CONCAT(E.name, " ", E.surname) AS fullname, E.salary, O.name 
	FROM EMPLOYEES AS E LEFT OUTER JOIN OCCUPATIONS AS O
    ON E.occu_code = O.code
    WHERE E.salary NOT BETWEEN 1100 AND 2000
    ORDER BY fullname

    /* Right Outer Join */
    SELECT CONCAT(E.name, " ", E.surname) AS fullname, E.salary, O.name 
	FROM OCCUPATIONS AS O RIGHT OUTER JOIN EMPLOYEES AS E
    ON E.occu_code = O.code
    WHERE E.salary NOT BETWEEN 1100 AND 2000
    ORDER BY fullname   

/* 2. */

    /* Explicit Inner Join */
    SELECT E.surname, O.name
	FROM EMPLOYEES AS E 
        INNER JOIN OCCUPATIONS AS O ON E.occu_code = O.code
        INNER JOIN DEPARTMENTS AS D ON D.num = E.dept_num
        WHERE D.num = "20"

    /* Implicit Inner Join */
    SELECT E.surname, O.name
	FROM EMPLOYEES AS E, OCCUPATIONS AS O, DEPARTMENTS AS D
        WHERE E.occu_code = O.code
        AND D.num = E.dept_num
        AND D.num = "20"

    /* Left Outer Join */
    SELECT E.surname, O.name
	FROM EMPLOYEES AS E 
        LEFT OUTER JOIN OCCUPATIONS AS O ON E.occu_code = O.code
        LEFT OUTER JOIN DEPARTMENTS AS D ON D.num = E.dept_num
        WHERE D.num = "20"

    /* Right Outer Join */
    SELECT E.surname, O.name
	FROM OCCUPATIONS AS O 
        RIGHT OUTER JOIN EMPLOYEES AS E ON E.occu_code = O.code
        RIGHT OUTER JOIN DEPARTMENTS AS D ON D.num = E.dept_num
        WHERE D.num = "20"

/* 3. */

    SELECT CONCAT(E.name, " ", E.surname) AS fullname
    FROM EMPLOYEES AS E
        WHERE E.occu_code IS NULL
        AND E.dept_num IS NULL

/* 4. */

    SELECT CONCAT(E.name, " ", E.surname) AS fullname
    FROM EMPLOYEES AS E
        WHERE E.occu_code IS NULL
        OR E.dept_num IS NULL

/* 5.! */

    SELECT CONCAT(E.name, " ", E.surname) AS fullname, O.name AS occupation
    FROM EMPLOYEES AS E LEFT OUTER JOIN OCCUPATIONS AS O
        ON E.occu_code = O.code
        WHERE (O.name != "EMPLOYEE"
        AND O.name != "MANAGER")
        AND E.salary > 2000

/* 6. */

    /* Implicit Inner Join */
    SELECT E.num, E.surname, E.name, M.surname AS manager, E.start_date, E.salary, E.commission, D.name, O.name
    FROM EMPLOYEES AS E INNER JOIN OCCUPATIONS AS O ON E.occu_code = O.code
    					INNER JOIN DEPARTMENTS AS D ON E.dept_num = D.num
                        INNER JOIN EMPLOYEES AS M ON E.manager = M.num
    
    /* Implicit Inner Join */
    SELECT E.num, E.surname, E.name, M.surname AS manager, E.start_date, E.salary, E.commission, D.name, O.name
    FROM EMPLOYEES AS E LEFT JOIN OCCUPATIONS AS O ON E.occu_code = O.code
    					LEFT JOIN DEPARTMENTS AS D ON E.dept_num = D.num
                        LEFT JOIN EMPLOYEES AS M ON E.manager = M.num

/* 7. */

    /* Implicit Inner Join */
    
    
    /* Implicit Inner Join */
    