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

    /*  */
