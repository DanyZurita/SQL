/* Create 4 users: */

/* 1. A DBA user (name "userAdmin"). */

    /* $ sudo mongod --fork --dbpath /home/danyzurita/mongodb/data/db 
    --logpath /home/danyzurita/mongodb/logs/log.log --auth

    $ mongo */
    
    use admin

    db.createUser(
        {user: "userAdmin", pwd: "alualualu", roles: ["userAdmin"]}
        )

/* 2. Database Admin (name "userDbAdmin"): Work on all databases, create collections, create indexes, 
etc. But it's not allowed to create users… */

    db.createUser(
        {user: "userDbAdmin", pwd: "alualualu", roles: ["readAnyDatabase", "readWriteAnyDatabase", "dbAdminAnyDatabase"]}
        )

/* 3. User Admin (name "userAdm"): Allowed to manage users. */

    db.createUser(
        {user: "userAdm", pwd: "alualualu", roles: ["userAdmin"]}
        )

/* 4. Developer (name "userDev"): Read and write data in "customers" and "sales" databases. */

    db.createUser(
        {user: "userDev", pwd: "alualualu", roles: ["readWrite"]}
        )

    db.updateUser("userDev", {roles: [{role: "readWrite", db: "customers"}, {role: "readWrite", db: "sales"}]})

/* 5. Finally, show all the created users inside the database "admin" and "customers". */

    use admin
    db.system.users.find().pretty()

    /* Or */
    db.getUsers()

/* Obviously, you must check the built-in roles… */