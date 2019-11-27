/* 1. */

    Done.

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

    SELECT AVG(M.Marks) 
    FROM (SELECT DISTINCT S.id, S.mark as Marks
            FROM STUDENTS AS S, APPLIES AS A
                WHERE S.id = A.sid
                AND A.major = "CS") AS M

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



/* 21. */



/* 22. */



/* 23. */



/* 24. */



/* 25. */




/* 26. */



/* 27. */



/* 28. */



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


