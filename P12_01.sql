/* Considering an example of customer schema like this:
{
	"name": "Bob",
	"surname": "Harris",
	"age": 47,
	"hobbies": [
		{"name": "tennis", "frequency": "1 time per week"},
		{"name": "jogging", "frequency": "3 times per week"}
	]
} */

/* 1. Create a database “gym” and inside that database a collection named 
“customers”. Finally, insert the document above inside the collection. */


    /* $ sudo mongod --fork --dbpath /home/danyzurita/mongodb/data/db 
    --logpath /home/danyzurita/mongodb/logs/log.log --port 22222 
       $ mongo --port 22222 */
    use gym 
    db.customers.insertOne({
        "name": "Bob",
        "surname": "Harris",
        "age": 47,
        "hobbies": [
            {"name": "tennis", "frequency": "1 time per week"},
            {"name": "jogging", "frequency": "3 times per week"}
        ]
    });

/* 2. Insert 3 customer records with at least 1 hobby entry per customer. */

db.customers.insertMany([
    {
        "name": "Dany",
        "surname": "Zurita",
        "age": 21,
        "hobbies": [
            {"name": "badminton", "frequency": "2 time per week"},
            {"name": "voley", "frequency": "1 times per month"},
            {"name": "bicking", "frequency": "5 times per week"}
        ]
    },
    {
        "name": "Isidre",
        "surname": "Marti",
        "age": 20,
        "hobbies": [
            {"name": "badminton", "frequency": "2 time per week"},
            {"name": "voley", "frequency": "1 times per month"}
        ]
    },
    {
        "name": "Tomas",
        "surname": "Tomasao",
        "age": 20,
        "hobbies": [
            {"name": "voley", "frequency": "1 times per month"}
        ]
    }
]);

/* 3. Update the age of Bob Harris to 48. */

db.customers.updateOne(
    {"name": "Bob",
    "surname": "Harris"},
    {$set: {
        "age" : 48
    }}
);

/* 4. Find all customers who are older than 18. */

db.customers.find({"age" : {$gt: 18}}).pretty();

/* 5. Delete all patients who have tennis as a hobby. */

db.customers.deleteMany(
    {"hobbies.name" : "tennis"}
);
