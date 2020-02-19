/* 1. */

    create role adurango with login password 'alualualu';

/* 2. */

    grant delete on employees to adurango;
    grant select on employees to adurango;
    grant select on occupations to adurango;

/* 3. */

    revoke delete on employees from adurango;
    revoke select on employees from adurango;
    revoke select on occupations from adurango;

/* 4. */

    grant update on employees to adurango;
    grant select on employees to adurango;
    grant select on departments to adurango;

/* 5. */

    \dt 
    /* o */ 
    \z

/* 6. */

    revoke update on employees from adurango;
    revoke select on employees from adurango;
    revoke select on departments from adurango;

/* 7. */          

    create view v_employees as
        (select e.*
        from employees as e, departments as d 
            where e.dept_num = d.num 
            and e.salary < 1500::money
            and e.dept_num in (
                select dept_num
                from employees
                group by dept_num
                having count(dept_num) < 7));
    
    grant select on v_employees to adurango;

/* 8. */

    revoke select on v_employees from adurango;

/* 9. */

    create user pgracia with login password 'alualualu';

/* 10. */

    create group comp01;

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

