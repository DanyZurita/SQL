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

    select b.start_datetime, c.firstname, c.lastname
    from customers as c, bookings as b
        where c.id = b.cust_id
        and c.firstname ~~ '''E%'''
        and c.lastname ~~ '''Crumpet''';

/* 19. */

    select b.start_datetime, f.name
    from bookings as b, facilities as f
        where b.fac_id = f.id
        and f.name ~~* '''%tennis court%'''
        and date '5/7/2012' = date_trunc('day', b.start_datetime);

/* 20. */

    select cc.firstname, cc.lastname
    from customers as c, customers as cc
        where c.recommended_id = cc.id
        group by cc.id;      

/* 21. */

    select cc.firstname, cc.lastname, count(c.recommended_id)
    from customers as c, customers as cc
        where c.recommended_id = cc.id
        group by cc.id;

/* 22. */

    select concat(c.firstname, c.lastname) as customer, concat(cc.firstname, cc.lastname) as "recommended by"
    from customers as c left join customers as cc on c.recommended_id = cc.id
        order by customer asc;

/* 23. */

    select distinct concat(c.firstname, c.lastname) as customer, f.name as facility
    from customers as c, facilities as f, bookings as b
        where c.id = b.cust_id
        and f.id = b.fac_id
        and f.name ~~* '%tennis court%';

/* 24. */

    select concat(c.firstname, c.lastname) as customer, f.name as facility, case when b.cust_id = 0 then f.guest_cost * b.nhours else f.cust_cost * b.nhours end as cost
    from customers as c, facilities as f, bookings as b
        where c.id = b.cust_id
        and f.id = b.fac_id
        and date '2012-09-14' = date_trunc('day', b.start_datetime)
        and  case when b.cust_id = 0 then f.guest_cost * b.nhours else f.cust_cost * b.nhours end > 30::money
            order by cost desc;

/* 25. */

    select distinct concat(c.firstname, c.lastname) as customer, ccc.reco
    from customers as c left join (select concat(cc.firstname, cc.lastname) as reco, cc.id from customers as cc) as ccc on c.recommended_id = ccc.id
        order by customer asc;

/* 26. */

    select b.fac_id, sum(b.nhours) as thour
    from bookings as b 
        where date '2012-09-01' = date_trunc('month', b.start_datetime)
        group by b.fac_id
        order by thour asc;

/* 27. */

    select fac_id, extract(month from start_datetime) as month, sum(nhours) as thour
    from bookings  
        where date_part('year',start_datetime)=2012
        group by fac_id, extract(month from start_datetime)
        order by fac_id asc, month asc, thour desc;

/* 28. */

    select count(distinct b.cust_id)
    from bookings as b
        where b.cust_id != 0;

/* 29. */

    select fac_id, sum(nhours) as num
    from bookings
        group by fac_id
        having sum(nhours) > 1000;

/* 30. */

    select f.name, sum(case when b.fac_id = 0 then f.guest_cost * b.nhours else f.cust_cost * b.nhours end) as renevue
    from facilities as f, bookings as b 
        where f.id = b.fac_id
        group by f.name;

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