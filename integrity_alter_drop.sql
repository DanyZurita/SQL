/* 1. */

    CREATE DATABASE MiniPremiereLeague
    USE MiniPremiereLeague

/* 2. */

    CREATE TABLE TEAMS ('tid' SMALLINT NOT NULL, 'tname' VARCHAR(50) NOT NULL UNIQUE, 'tyear' SMALLINT)

/* 3. */

    CREATE TABLE TEAMS (tid SMALLINT NOT NULL, 
                        tname VARCHAR(50) NOT NULL UNIQUE, 
                        tyear SMALLINT, 
                        PRIMARY KEY (tid), 
                        CHECK (tyear > 1875)) ENGINE=InnoDB;

/* 4. */

    CREATE TABLE `MATCHES` (
                            `mid` int(11) NOT NULL,
                            `mtidhome` smallint,
                            `mtidaway` smallint,
                            `mgoalshome` tinyint DEFAULT 0,
                            `mgoalsaway` tinyint DEFAULT 0,
                            `mdate` date NOT NULL,
                            PRIMARY KEY (`mid`),
                            CONSTRAINT `mtidhome_FK` FOREIGN KEY (`mtidhome`) REFERENCES `TEAMS`
                            (`tid`) ON DELETE SET NULL ON UPDATE CASCADE,
                            CONSTRAINT `mtidaway_FK` FOREIGN KEY (`mtidaway`) REFERENCES `TEAMS`
                            (`tid`) ON DELETE SET NULL ON UPDATE CASCADE
                            ) ENGINE=InnoDB;

/* 5. */

    INSERT INTO TEAMS VALUES (1,'Arsenal', 1886);
    INSERT INTO TEAMS VALUES (2,'Chelsea', 1905);
    INSERT INTO TEAMS VALUES (3,'Liverpool', 1892);
    INSERT INTO TEAMS VALUES (4,'Manchester City', 1880);
    INSERT INTO TEAMS VALUES (5,'Manchester United', 1878);
    INSERT INTO TEAMS VALUES (6,'Tottenham Hotspur', 1882);


/* 6. */

    INSERT INTO MATCHES VALUES (1, 2, 5, 0, 0, '2016-11-12');
    INSERT INTO MATCHES VALUES (2, 3, 6, 2, 2, '2016-11-12');
    INSERT INTO MATCHES VALUES (3, 4, 1, 1, 3, '2016-11-13');
    INSERT INTO MATCHES VALUES (4, 1, 3, 1, 3, '2016-11-20');
    INSERT INTO MATCHES VALUES (5, 5, 4, 2, 2, '2016-11-20');
    INSERT INTO MATCHES VALUES (6, 6, 2, 3, 1, '2016-11-21');
    INSERT INTO MATCHES VALUES (7, 2, 1, 0, 1, '2016-11-27');
    INSERT INTO MATCHES VALUES (8, 3, 4, 1, 0, '2016-11-27');
    INSERT INTO MATCHES VALUES (9, 6, 5, 2, 2, '2016-11-28');
    INSERT INTO MATCHES VALUES (10, 1, 6, 3, 3, '2016-12-3');
    INSERT INTO MATCHES VALUES (11, 3, 5, 2, 2, '2016-12-3');
    INSERT INTO MATCHES VALUES (12, 4, 2, 1, 0, '2016-12-4');
    INSERT INTO MATCHES VALUES (13, 2, 3, 1, 0, '2016-11-12');
    INSERT INTO MATCHES VALUES (14, 5, 1, 0, 1, '2016-11-12');
    INSERT INTO MATCHES VALUES (15, 6, 4, 1, 1, '2016-11-13');
    INSERT INTO MATCHES VALUES (16, 5, 2, 1, 2, '2016-11-20');
    INSERT INTO MATCHES VALUES (17, 6, 3, 2, 1, '2016-11-20');
    INSERT INTO MATCHES VALUES (18, 1, 4, 1, 2, '2016-11-21');
    INSERT INTO MATCHES VALUES (19, 3, 1, 0, 1, '2016-11-27');
    INSERT INTO MATCHES VALUES (20, 4, 5, 1, 0, '2016-11-27');
    INSERT INTO MATCHES VALUES (21, 2, 6, 0, 0, '2016-11-28');
    INSERT INTO MATCHES VALUES (22, 1, 2, 0, 0, '2016-12-3');
    INSERT INTO MATCHES VALUES (23, 4, 3, 5, 1, '2016-12-3');
    INSERT INTO MATCHES VALUES (24, 5, 6, 1, 2, '2016-12-4');
    INSERT INTO MATCHES VALUES (25, 6, 1, 2, 1, '2016-12-10');
    INSERT INTO MATCHES VALUES (26, 5, 3, 3, 1, '2016-12-10');
    INSERT INTO MATCHES VALUES (27, 2, 4, 3, 1, '2016-12-11');
    INSERT INTO MATCHES VALUES (28, 3, 2, 2, 2, '2017-1-7');
    INSERT INTO MATCHES VALUES (29, 1, 5, 1, 0, '2017-1-7');
    INSERT INTO MATCHES VALUES (30, 4, 6, 1, 1, '2017-1-8');
    INSERT INTO MATCHES VALUES (31, 5, 2, 0, 1, '2017-1-14');
    INSERT INTO MATCHES VALUES (32, 4, 1, 0, 0, '2017-1-14');
    INSERT INTO MATCHES VALUES (33, 3, 6, 0, 0, '2017-1-15');
    INSERT INTO MATCHES VALUES (34, 6, 4, 6, 0, '2017-1-21');
    INSERT INTO MATCHES VALUES (35, 2, 3, 3, 1, '2017-1-21');
    INSERT INTO MATCHES VALUES (36, 1, 5, 1, 1, '2017-1-22');
    INSERT INTO MATCHES VALUES (37, 5, 6, 1, 2, '2017-2-4');
    INSERT INTO MATCHES VALUES (38, 4, 3, 3, 0, '2017-2-4');
    INSERT INTO MATCHES VALUES (39, 1, 2, 2, 0, '2017-2-5');
    INSERT INTO MATCHES VALUES (40, 6, 1, 1, 0, '2017-2-11');
    INSERT INTO MATCHES VALUES (41, 4, 2, 1, 1, '2017-2-11');
    INSERT INTO MATCHES VALUES (42, 3, 5, 3, 1, '2017-2-12');
    INSERT INTO MATCHES VALUES (43, 5, 4, 2, 1, '2017-11-18');
    INSERT INTO MATCHES VALUES (44, 2, 6, 1, 1, '2017-11-18');
    INSERT INTO MATCHES VALUES (45, 1, 3, 0, 0, '2017-11-19');
    INSERT INTO MATCHES VALUES (46, 2, 5, 2, 0, '2017-11-25');
    INSERT INTO MATCHES VALUES (47, 1, 4, 1, 1, '2017-11-25');
    INSERT INTO MATCHES VALUES (48, 6, 3, 1, 1, '2017-11-26');
    INSERT INTO MATCHES VALUES (49, 4, 6, 2, 1, '2017-12-2');
    INSERT INTO MATCHES VALUES (50, 3, 2, 3, 0, '2017-12-2');
    INSERT INTO MATCHES VALUES (51, 5, 1, 1, 0, '2017-12-3');
    INSERT INTO MATCHES VALUES (52, 6, 5, 1, 0, '2017-12-9');
    INSERT INTO MATCHES VALUES (53, 3, 4, 3, 3, '2017-12-9');
    INSERT INTO MATCHES VALUES (54, 2, 1, 1, 0, '2017-12-10');
    INSERT INTO MATCHES VALUES (55, 1, 6, 0, 2, '2017-12-16');
    INSERT INTO MATCHES VALUES (56, 2, 4, 1, 0, '2017-12-16');
    INSERT INTO MATCHES VALUES (57, 5, 3, 2, 1, '2018-1-17');
    INSERT INTO MATCHES VALUES (58, 4, 5, 3, 2, '2018-1-13');
    INSERT INTO MATCHES VALUES (59, 6, 2, 2, 3, '2018-1-14');
    INSERT INTO MATCHES VALUES (60, 3, 1, 1, 0, '2018-1-14');

/* 7. */

SELECT TEAMS.tname, A.NMatchesLocal, B.NMatchesVisitor
FROM (SELECT T.tid, T.tname, count(*) AS NMatchesLocal
        FROM MATCHES M, TEAMS T
        WHERE T.tid = M.mtidhome
        GROUP BY T.tid, T.tname) A,
        (SELECT T.tid, T.tname, count(*) AS NMatchesVisitor
        FROM MATCHES M, TEAMS T
        WHERE
        T.tid = M.mtidaway
        GROUP BY T.tid, T.tname) B, TEAMS
        WHERE A.tid = B.tid AND TEAMS.tid = A.tid;

/* 8. */



/* 9. */



/* 10. */



/* 11. */



/* 12. */



/* 13. */


