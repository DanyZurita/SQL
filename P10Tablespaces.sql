/*  Download and import the virtual machine p10_tablespaces_Ubuntu16_32bits.ova.
    This virtual machine has 3 hard drives:
        /dev/sda: Hard drive with a partition for the operating system and software.
        /dev/sdb: Hard drive with a partition mounted in /tables to store tablespaces for PostgreSQL 12.2 tables. Another partition for swap (virtual memory).
        /dev/sdc:  Hard drive with a partition mounted in /indexes to store tablespaces for PostgreSQL 12.2 indexes. Let’s suppose that this drive is very fast (PCIe).

Inside the imported server you’ll find the database “dvdrental”.
*/    

/* 1. Place all the indexes of the database “dvdrental” inside the directory “/indexes/dvdrental”.
Clue: To list all indexes of the schema “public” run:
    SELECT
        schemaname,
        tablename,
        indexname,
        tablespace
    FROM
        pg_indexes
    WHERE
        schemaname = 'public'
    ORDER BY
        tablename,
        indexname;
    
    Clue: Do a LOOP with ALTER INDEX…
 */

/* 2. Places all the tables of the database “dvdrental” inside the directory “/tables/dvdrental”.
Clue: To list all tables of the schema “public” run:
    select *
    from information_schema.tables
        where table_schema='public' and table_type='BASE TABLE';

To check the tablespace of the tables after the changes:
    SELECT tablename, tablespace 
    FROM pg_tables 
        WHERE schemaname = 'public'
        ORDER BY tablename;
*/

    
