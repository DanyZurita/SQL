/* 1. */

    /* Done. */

/* 2. */

    SELECT S.id, S.name, S.surname, S.mark
    FROM STUDENTS AS S
	    WHERE S.mark > 3.6

/* 3. */

    SELECT S.name, S.surname, A.major
    FROM STUDENTS AS S, APPLIES AS A
        WHERE A.sid = S.id
        ORDER BY S.surname, S.name

/* 4. */

    SELECT S.name, S.surname, S.mark, A.decision
    FROM STUDENTS AS S, APPLIES AS A, COLLEGES AS C
        WHERE A.sid = S.id
        AND A.college = C.name
        AND S.size_high_school < 1000
        AND A.major = "CS"
        AND A.college = "Stanford"

/* 5. */

    SELECT DISTINCT C.name
    FROM COLLEGES AS C, APPLIES AS A
        WHERE C.name = A.college
        AND C.enrollment > 20000
        AND A.major = "CS"

/* 6. */

    SELECT DISTINCT A.sid, S.name, S.surname, A.college, A.major
    FROM STUDENTS AS S, APPLIES AS A
        WHERE S.id = A.sid
        AND (A.major LIKE "bio%"
            OR A.major LIKE "%bio"
            OR A.major LIKE "%bio%")

/* 7. */

    SELECT S.id, S.name, S.surname, S.mark, SUM(S.mark * 2) AS Wmark
    FROM STUDENTS AS S
        GROUP BY S.id

/* 8. */

    SELECT S.id, S.name, S.surname, S.mark, SUM(S.mark * (S.size_high_school/1000)) AS ScaledOver5, SUM((S.mark * (S.size_high_school/1000)) * 2) AS ScaledOver10
    FROM STUDENTS AS S
        GROUP BY S.id

/* 9. */

    SELECT AVG(M.Marks) AS AverageMark
    FROM (SELECT DISTINCT S.id, S.mark as Marks
            FROM STUDENTS AS S, APPLIES AS A
                WHERE S.id = A.sid
                AND A.major = "CS") AS M

/* 10. */

    SELECT MIN(M.Marks) AS MinMark
    FROM (SELECT DISTINCT S.id, S.mark as Marks
            FROM STUDENTS AS S, APPLIES AS A
                WHERE S.id = A.sid
                AND A.major = "CS") AS M

/* 11. */

    SELECT COUNT(C.enrollment) AS NumberOfColleges
    FROM COLLEGES AS C
        WHERE C.enrollment > 15000

/* 12. */

    SELECT COUNT(M.id) AS NumberOfStudents
    FROM (SELECT DISTINCT S.id
            FROM STUDENTS AS S, APPLIES AS A
                WHERE S.id = A.sid
                AND A.college = "Cornell") AS M

/* 13. */

    SELECT A.college, COUNT(*)
        FROM APPLIES AS A
        GROUP BY A.college

/* 14. */

    /* There is no query. */

/* 15. */

    SELECT C.state, SUM(C.enrollment)
    FROM COLLEGES AS C
        GROUP BY C.state


/* 16. */

    SELECT DISTINCT mark
    FROM STUDENTS
        WHERE mark = (SELECT MIN(mark) FROM STUDENTS)
        OR mark = (SELECT MAX(mark) FROM STUDENTS)

/* 17. */

    SELECT MAX(mark) - MIN(mark)
    FROM STUDENTS

/* 18. */

    SELECT S.id, S.surname, S.name, COUNT(DISTINCT A.college)
    FROM STUDENTS AS S, APPLIES AS A
        WHERE S.id = A.sid
            GROUP BY S.id
            ORDER BY S.surname, S.name, S.id

/* 19. */

    SELECT S.surname, S.name, S.id, COUNT(DISTINCT A.college)
    FROM STUDENTS AS S LEFT OUTER JOIN APPLIES AS A ON S.id = A.sid
            GROUP BY S.id    

/* 20. */

    SELECT S.surname, S.name, S.id, COUNT(DISTINCT A.college)
    FROM STUDENTS AS S LEFT OUTER JOIN APPLIES AS A ON S.id = A.sid
            GROUP BY S.id
            ORDER BY S.surname, S.name, S.id

/* 21. */

    SELECT college
    FROM APPLIES
    	GROUP BY college
        HAVING COUNT(*) < 5
        ORDER BY college

    SELECT college
    FROM APPLIES
    	GROUP BY college
        HAVING COUNT(DISTINCT sid) < 5
        ORDER BY college

/* 22. */

    SELECT DISTINCT college 
    FROM APPLIES AS A
        WHERE 5 > (SELECT COUNT(*)
                FROM APPLIES AS AA
                        WHERE AA.college = A.college)
                        ORDER BY college
    
    SELECT DISTINCT college 
    FROM APPLIES AS A
        WHERE 5 > (SELECT COUNT(DISTINCT sid)
                FROM APPLIES AS AA
                        WHERE AA.college = A.college)
                        ORDER BY college

/* 23. */

    SELECT A.major
    FROM STUDENTS AS S, APPLIES AS A
        WHERE S.id = A.sid
        GROUP BY A.major
            HAVING max(S.mark) < (SELECT avg(mark)
                                FROM STUDENTS)

/* 24. */

    SELECT DISTINCT S.id, S.name, S.surname
    FROM STUDENTS AS S, APPLIES AS A
        WHERE S.id = A.sid
        AND A.major = "CS"
        AND S.id NOT IN (SELECT DISTINCT S.id
                        FROM STUDENTS AS S, APPLIES AS A
                            WHERE S.id = A.sid
                            AND A.major = "EE")
        ORDER BY S.surname, S.name, S.id

/* 25. */

    SELECT C.name, C.state
    FROM COLLEGES AS C
        WHERE C.state IN (SELECT CC.state
                        FROM COLLEGES AS CC
                        GROUP BY CC.state
                        HAVING COUNT(CC.name) > 1)


/* 26. */

    SELECT C.name
    FROM COLLEGES AS C
        WHERE C.enrollment = (SELECT MAX(CC.enrollment)
                        FROM COLLEGES AS CC)

/* 27. */

    SELECT S.name, S.surname, S.mark
    FROM STUDENTS AS S
        WHERE NOT EXISTS (SELECT SS.name, SS.surname, SS.mark
                        FROM STUDENTS AS SS
                                WHERE SS.mark > S.mark)

/* 28. */

    SELECT S.name, S.surname, S.mark
    FROM STUDENTS AS S
        WHERE S.mark >= ALL (SELECT SS.mark
                        FROM STUDENTS AS SS
                                WHERE SS.mark > S.mark)

/* 29. */

    

/* 30. */



/* 31. */



/* 32. */



/* 33. */



/* 34. */



/* 35. */




/* 36. */



/* 37. */



/* 38. */



/* 39. */



/* 40. */



/* 41. */



/* 42. */



/* 43. */



/* 44. */



/* 45. */




/* 46. */



/* 47. */



/* 48. */



/* 49. */


