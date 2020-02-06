/* 0. */

    /* looking for a hotel room, more or less */

/* 1. */

    /* Drawing of the entity relational model */

/* 2. */

    /* postgres@DBVMPC:~$ createdb bookings -O booking
    postgres=# create user booking with password 'alualualu'; */

/* 3. */

    create table customers (id int, lastname text, firstname text, address text, zipcode int, phonenumber int, recommended_id int, registerdate date);
    create table bookings (fac_id int, cust_id int, start_datetime date, nhours int);
    create table facilities (id int, name text, cust_cost money, guest_cost money, purchase_cost money, maintenance_cost money);
    alter table bookings owner to booking;
    alter table booking owner to booking;
    alter table facilities owner to booking;
    alter table bookings add primary key (fac_id, cust_id, start_datetime);
    alter table customers add primary key (id);
    alter table facilities add primary key (id);
    alter table bookings add foreign key (fac_id) references facilities (id);
    alter table bookings add foreign key (cust_id) references customers (id);


/* 4. */

    copy facilities from '/home/alumne/facilities.csv' DELIMITER ';' QUOTE '''' CSV HEADER NULL '''';
    copy bookings from '/home/alumne/bookings.csv' DELIMITER ';' QUOTE '''' CSV HEADER NULL '''';
    copy customers from '/home/alumne/customers.csv' DELIMITER ';' QUOTE '''' CSV HEADER NULL '''';

/* 5. */

    select * from facilities;

/* 6. */

    select name, cust_cost, guest_cost, (guest_cost - cust_cost) as difference from facilities;

/* 7. */          

    select * from customers where firstname ~~* '''GUEST''';

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