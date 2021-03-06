/* 1. Insert multiple companies (company data of your choice) 
into a collection - both with insertOne() and insertMany() */

    use test

    db.companies.insertMany([{
        _id: "000001",
        name: "Dany Zurita SL",
        dateOfFoundation: "07/04/2019",
        owner: "Dany Zurita",
        email: "dzurita@cifpfbmoll.eu"
    },
    {
        _id: "000002",
        name: "Isidre Marti SL",
        dateOfFoundation: "22/12/2019",
        owner: "Isidre Martí",
        email: "imarti@cifpfbmoll.eu"
    }])

/* 2. Deliberately insert duplicate ID data and "fix" failing 
additions with unordered inserts. */

    db.companies.insertMany([{
        _id: "000001",
        name: "Dany Zurita SL",
        dateOfFoundation: "07/04/2019",
        owner: "Dany Zurita",
        email: "dzurita@cifpfbmoll.eu"
    },
    {
        _id: "000003",
        name: "Tomás Tomasao SL",
        dateOfFoundation: "02/10/2019",
        owner: "Tomás Tomasao",
        email: "ttomasao@cifpfbmoll.eu"
    }],
    {ordered: false})

/* 3. Write data for a new company with both journaling being 
guaranteed and not being guaranteed. */

    /* NO SE HACE */

/* 4. Insert this json file inside a database named “tvshowsdb” 
and into a collection named “tvshows”. To to this use mongoimport. */

    /* $ mongoimport /home/danyzurita/Escritorio/shows.json -d tvshowsdb -c tvshows --jsonArray --drop */
