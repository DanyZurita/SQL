/* 1. Import this json file data into a new database (e.g. boxOffice) 
and collection (e.g. movieStarts). */

    /* $ mongoimport /home/danyzurita/Escritorio/shows.json -d boxOffice -c movieStarts --jsonArray --drop */

/* 2. Search all movies that have a rating higher than 9.2 and a 
runtime lower than 100 minutes. */

    use boxOffice
    
    db.movieStarts.find({$and: [
        {"rating.average" : {$gt: 9.2}}, 
        {"runtime" : {$lte: 100}}
    ]}).pretty()

/* 3. Search all movies that have a genre of “drama” or “action”. */

    db.movieStarts.find({$or: [
        {"genres" : "Drama"}, 
        {"genres": "Action"}
    ]}).pretty()

/* 4. Search all movies where field “runtime” exceeded field “weight”. */

    db.movieStarts.find({$expr: {
        $gt: ["$runtime", "$weight"]
        }}).pretty()
