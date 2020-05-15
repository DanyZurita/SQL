/* 1. Create a new collection ("sports") and upsert two new documents into it
(with these fields: "title"-string, "requiresTeam"-boolean) */

    use sportsdb

    db.sports.insertMany([{
        title: "team1",
        requiresTeam: true
    },
    {
        title: "team2",
        requiresTeam: false
    }])

/* 2. Update all documents which do require a tem by addin a new field with the minimum
number of player requiered. Use upsert. */

    db.sports.updateMany(
        {requiresTeam: true},
        {"$set": {minPlayersRequired: 6}},
        {upsert:true}
    )

/* 3. Update all documents that require a team by increasing the number of required players
by 10. Use upsert. */

    
