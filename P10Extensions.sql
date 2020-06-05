/* 0. Create the following table:

    CREATE TABLE highschools (
    code VARCHAR(3) NOT NULL PRIMARY KEY,
    geog GEOGRAPHY(Point)
    );
*/    

/* 1. If you tried to run that create table you got an error. Explain why and solve it. */

    /* Becuase the 'geography' type does not exist yet, you have to install postGIS for postgres 12 
    with the command:  
        $ sudo apt-get install postgis 
    and create the postGIS extension in postgres with:
        CREATE EXTENSION postgis; */

/* 2. Explain what’s a GEOGRAPHY(point) data type. */

    /* Its an representation of geographical coordinates of latitud and longitude in postGIS.
    In this case, we use 'POINT' that refers to a especific point in a map, but you can also use
    'POLYGON' to represent an area like in MongoDB. */


/* Backups: Create a database with your name and a table inside. Export it using pg_dump. 
Send me an email with a screenshot of the command working. */

    /*  CREATE DATABASE Dany; 
        \c dany
        create table dany1 (id INTEGER NOT NULL PRIMARY KEY);
        insert into dany1 values (1);
        insert into dany1 values (10);
    */

    /* Create a plain-text single database backup
    $ pg_dump -h localhost -p 5432 -U postgres -C -F p -b -v -f dany.txt dany  */
