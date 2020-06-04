/* 
Consider the following database (do not create the tables yet):
create table departments(
	num INTEGER PRIMARY KEY,
	name text NOT NULL,
	town text
);

create table employees (
	num 	INTEGER PRIMARY KEY,
	surname text NOT NULL,
	name text NOT NULL,
	occupation text,
	manager INTEGER,
	registration_date DATE,
	salary INTEGER,
	commission INTEGER,	
	dept_num INTEGER,
FOREIGN KEY (dept_num)  REFERENCES departments (num),
FOREIGN KEY (manager)  REFERENCES employees (num)
);

CREATE INDEX idx_employees_fk1 ON employees (dept_num);
CREATE INDEX idx_employees_fk2 ON employees (manager);
*/

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

    create sequence pk10
    start 10
    increment 10
    minvalue 10
    maxvalue 200
    cycle;

    create table departments(
	num INTEGER DEFAULT nextval('pk10') NOT NULL PRIMARY KEY,
	name text NOT NULL,
	town text
    );

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

    
