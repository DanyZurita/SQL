/* 1. Total number of persons per gender. Sort the result by amount of person per gender desc. 
Execution example: 
{"_id": {"gender": "female"}, "personsPerGender": 2565}
{"_id": {"gender": "male"}, "personsPerGender": 2435} */

    /* $ mongoimport /home/danyzurita/Escritorio/persons.json -d contactsDB -c contacts --jsonArray --drop */

    use contactsDB

    db.contacts.aggregate([
        {$match: {$or: [{gender: "female"}, {gender: "male"}]}},
        {$group: {_id: {gender: "$gender"}, personsPerGender: {$sum: 1}}},
        {$sort: {personsPerGender: -1}}
    ]).pretty()

/* 2. Total number of persons per gender but with age greater then 50. Sort the result by amount 
of person per gender desc. 
Execution example: 
{"_id": {"gender": "female"}, "personsPerGender": 1125}
{"_id": {"gender": "male"}, "personsPerGender": 1079} */

    db.contacts.aggregate([
        {$match: {$and: [{$or: [{gender: "female"}, {gender: "male"}]}, {"dob.age": {$gt: 50}}]}},
        {$group: {_id: {gender: "$gender"}, personsPerGender: {$sum: 1}}},
        {$sort: {personsPerGender: -1}}
    ]).pretty()

/* 3. Total number of persons per gender but with age greater then 50 and now also show the average age of the two groups. Sort the result by amount of person per gender desc. 
Execution example: 
{"_id": {"gender": "female"}, "personsPerGender": 1125, "averageAge": 61.90577777777778}
{"_id": {"gender": "male"}, "personsPerGender": 1079, "averageAge": 62.0667284} */

    
