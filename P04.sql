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



/* 3. */



/* 4. */



/* 5. */



/* 6. */



/* 7. */

