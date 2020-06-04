/* 1. Create a sequence to implement the primary key of the table named 
‘departments’. The sequence must start with 10, it must be increased by 10, 
the minimum value must be 10, the maximum values must be 200, and its behaviour 
must be cyclical. After creating the sequence, modify the create table statement 
for the table ‘department’s and run it. Finally, insert the following rows: 

    INSERT INTO departments 
        (name, town)
    VALUES 
        ('ACCOUNTING','SEVILLA'),
        ('RESEARCH','MADRID'),
        ('SALES','BARCELONA'),
        ('PRODUCTION','BILBAO'); 
*/

    /* CREATE DATABASE sequence;
    \c sequence; */

    

/* 2. Create a sequence to implement the primary key of the table named 
‘employees’. The sequence must start with 1000, it must be increased by 1000, 
the minimum value must be 1000, there is no maximum value, and its behaviour 
must not be cyclical. After creating the sequence, modify the create table 
statement for the table ‘employees’ and run it. Finally, insert the following rows: 

INSERT INTO employees
    (surname, name, occupation, manager, registration_date, salary, commission, dept_num)
VALUES
    ('PITT','BRAD','OWNER',NULL,'1984/01/01',1040,NULL,NULL),
    ('FONDA','JANE','MANAGER',1000,'1991/04/02',2900,NULL,20);

*/

    

/* 3. Show the current value of both sequences in a single query. */

    

/* 4. Alter the sequence that you created for the table named ‘employees’. Make it inverse 
beginning by 10000 and decrementing by 1000, and minimum value must be 3000. Insert an 
employee to test if it works. */

    
