/* 1. */

    SELECT C.c_name AS CountryName, COUNT(P.p_id) AS NumberOfPlayers
    FROM COUNTRIES AS C, PLAYERS AS P WHERE C.c_id = P.p_c_id
        GROUP BY C.c_name
        ORDER BY C.c_name;

/* 2. */

    /* Yes, more than 150.  */

/* 3. */

    SELECT t_name AS Tournament, t_type AS Type, DATEDIFF(t_end_date, t_start_date) AS Lenght      
    FROM TOURNAMENTS 
        WHERE  DATEDIFF(t_end_date, t_start_date) > 7;

/* 4. */

    

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

            
