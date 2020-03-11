/* 0. */

    /* scp C:\Users\dajoz\Downloads\dellstore2-normal-1.0.sql alumne@192.168.56.101:/home/alumne */
    create table dell;
    REVOKE ALL PRIVILEGES ON SCHEMA public FROM PUBLIC;
    create schema data GRAND ;
    set search_path to data;
    \i /home/alumne/dellstore2-normal-1.0.sql 
    ALTER DATABASE dell OWNER TO alumne;
    alter table categories owner to alumne;
    alter table cust_hist owner to alumne;
    alter table customers owner to alumne;
    alter table inventory owner to alumne;
    alter table orderlines owner to alumne;
    alter table orders owner to alumne;
    alter table products owner to alumne;
    alter table reorder owner to alumne;

/* 1. */

    INSERT INTO data.customers VALUES (20001, 'Sergi', 'González', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20001', 'password', 17, 40000, 'F');
    INSERT INTO data.customers VALUES (20002, 'Pep', 'López', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20002', 'password', 17, 40000, 'F');

    create or replace function del_under18()
    returns setof int AS $$
        BEGIN
            RETURN QUERY DELETE FROM customers where age < 18 RETURNING customerid;
        END
    $$ LANGUAGE plpgsql;

/* 2. */

    INSERT INTO data.customers VALUES (20001, 'Sergi', 'González', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20001', 'password', 17, 40000, 'F');
    INSERT INTO data.customers VALUES (20002, 'Pep', 'López', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20002', 'password', 17, 40000, 'F');

    create or replace function del_under18_2()
    returns record AS $$
        DECLARE
            before int := (select count(*) from customers);
            after int = 0;
        BEGIN
            DELETE FROM customers where age < 18;
            after := (select count(*) from customers);
            return (before, after);
        END
    $$ LANGUAGE plpgsql;

/* 3. */

    /* Named parameters */
    create or replace function insert_category1_sql(pcategory integer, pname varchar)
    returns void as $$
        BEGIN
        insert into categories values (pcategory, pname);
        END
    $$ LANGUAGE plpgsql;

    /* Numbered parameters */
    create or replace function insert_category2_sql(integer, varchar)
    returns void as $$
        BEGIN
        insert into categories values ($1, $2);
        END
    $$ LANGUAGE plpgsql;

    /* Named as table fields parameters */
    create or replace function insert_category3_sql(category integer, categoryname varchar)
    returns void as $$
        BEGIN
        insert into categories values (category, categoryname);
        END
    $$ LANGUAGE plpgsql;

    /* Single parameter */
    create or replace function insert_category4_sql(pcategory categories)
    returns void as $$
        BEGIN
        insert into categories values ($1.category, $1.categoryname);
        END
    $$ LANGUAGE plpgsql;

/* 4. */

    /* SQL */
    create or replace function show_name_sql(id integer, OUT first varchar, OUT last varchar)
    returns record as $$
        select firstname, lastname from customers where id = $1
    $$ LANGUAGE sql volatile;

    /* PLSQL */
    create or replace function show_name_plpgsql(id integer, OUT first varchar, OUT last varchar)
    returns record as $$
        BEGIN
        select firstname, lastname into first, last from customers where id = $1;
        END
    $$ LANGUAGE plpgsql;

/* 5. */

    /* SQL */
    create or replace function increase_price_sql(prod products)
    returns numeric as $$
        update products set price = price + 0.05 * price
        where prod_id = prod.prod_id returning price;
    $$ LANGUAGE sql volatile;

    /* PLSQL */
    create or replace function increase_price_plpgsql(pro products)
    returns numeric as $$
        BEGIN
            return update products set price = price + 0.05 * price where prod_id = prod.prod_id;
        END
    $$ LANGUAGE plpgsql;

/* 6. */

    

/* 7. */          



/* 8. */

    

/* 9. */

    

/* 10. */

    

/* 11. */

    

/* 12. */

    

/* 13. */

    
