/* 1. */

    SELECT LAST_DAY(NOW());

/* 2. */

    SELECT LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)) AS My Day;

/* 3. */

    SELECT DATE_FORMAT(LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)), '%M %d, %y') AS MyDay;

/* 4. */

    SELECT FROM_DAYS(680001) AS MyDay;

/* 5. */

    SELECT CONVERT_TZ(NOW(), 'GMT', 'Europe/Madrid') AS DateMadrid, CONVERT_TZ(NOW(), 'UTC', 'America/Panama') AS DatePanama;

/* 6. */

    SELECT CONVERT_TZ(NOW(), 'GMT', 'Europe/Madrid') AS DateMadrid, CONVERT_TZ(NOW(), 'UTC', 'Australia/Sydney') AS DateSydney;

/* 7. */

    SELECT NOW() AS Today, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 HOUR), INTERVAL 25 MINUTE) AS MyTimestamp;

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



/* 18. */



/* 19. */



/* 20. */



/* 21. */



/* 22. */



/* 23. */



/* 24. */


