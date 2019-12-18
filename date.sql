/* 1. */

    SELECT LAST_DAY(NOW());

/* 2. */

    SELECT LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)) AS My Day;

/* 3. */

    SELECT DATE_FORMAT(LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)), '%M %d, %y') AS MyDay;

/* 4. */

    SELECT FROM_DAYS(680001) AS MyDay;

/* 5. */

    /* Skipped. */

/* 6. */

    SELECT CONVERT_TZ(NOW(), 'GMT', 'Europe/Madrid') AS DateMadrid, CONVERT_TZ(NOW(), 'UTC', 'America/Panama') AS DatePanama;

/* 7. */

    SELECT CONVERT_TZ(NOW(), 'GMT', 'Europe/Madrid') AS DateMadrid, CONVERT_TZ(NOW(), 'UTC', 'Australia/Sydney') AS DateSydney;

/* 8. */

    SELECT NOW() AS Today, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 HOUR), INTERVAL 25 MINUTE) AS MyTimestamp;

/* 9. */

    SELECT NOW() AS Today, DAYOFYEAR(NOW())

/* 10. */

    /* Yes */
     SELECT STR_TO_DATE('Wednesday, December 18, 2019', '%W, %M %e, %Y') AS Today;

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


