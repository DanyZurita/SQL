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

    select * from facilities where cust_cost != 0::money;

/* 9. */

    select * from facilities where cust_cost = 0::money;

/* 10. */

    select id, name, cust_cost, maintenance_cost 
    from facilities 
        where cust_cost != 0::money 
        and (maintenance_cost / 50) > cust_cost;

/* 11. */

    select * from facilities where id = 1 or id = 5;

/* 12. */

    select id, name, case when maintenance_cost > 150::money then 'expensive' else 'cheap' end as chep_or_not, cust_cost, maintenance_cost 
    from facilities;

/* 13. */

    select c.id, c.lastname, c.firstname, c.registerdate, b.start_datetime, f.name 
    from customers as c, bookings as b, facilities as f
        where b.cust_id = c.id 
        and b.fac_id = f.id
        and b.start_datetime > '2012-10-01'::timestamp;

/* 14. */

    select c.id, c.lastname, c.firstname, b.start_datetime 
    from customers as c, bookings as b
        where b.cust_id = c.id
        order by b.start_datetime, c.lastname, c.firstname
        limit 10;

/* 15. */

    select lastname as field 
    from customers 
        union 
    select name 
    from facilities;

/* 16. */

    select max(registerdate)::timestamp as mydate
    from customers;

/* 17. */

    select concat(firstname, ' ', lastname) as fullname, registerdate::timestamp
    from customers
        where registerdate = (select max(registerdate)::timestamp as mydate
                            from customers);

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