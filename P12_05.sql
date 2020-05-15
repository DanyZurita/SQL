/* 1. Import this json file data into a new database (e.g. boxOffice) 
and collection (e.g. movieStarts). */

    /* $ mongoimport /home/danyzurita/Escritorio/shows.json -d boxOffice -c movieStarts --jsonArray --drop */

/* 2. Find all movies with exactly two genres. */

    use boxOffice

    db.movieStarts.find(
        {genres: {$size: 2}}
        ).pretty()

/* 3. Find all movies with scheduled time 21:00. */

    

/* 4. Find all movies with scheduled time 21:00 and days Sunday. */

    

/* 5. Find all movies with genres “Action”, “Drama” and “Thriller” (only those ones and in any order). 
Use $all. */

    
