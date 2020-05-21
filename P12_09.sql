/* 1. Pick 3 points on Google Maps and store them in a collection. */

    use myplaces

    db.places.insertMany([
        {
            name: 'Home Dany Zurita',
            location: {
                type: 'Point', 
                coordinates: [2.637161, 39.579635]
                }
        },
        {
            name: 'IES Emili Darder',
            location: {
                type: 'Point', 
                coordinates: [2.632480, 39.584080]
                }
        },
        {
            name: 'CIFP Francesc Borja Moll',
            location: {
                type: 'Point', 
                coordinates: [2.667388, 39.568884]
                }
        }
    ])

/* 2. Pick a point and find the nearest points within a min and max distance. */

    db.places.createIndex({
        location: "2dsphere"
    })
    
    db.places.find({
        location : {$near: {$geometry: {type: 'Point', 
                                        coordinates: [2.637161, 39.579635]
                                        },
                                        $minDistance: 0,
                                        $maxDistance: 50
                            }
                    }
    }).pretty()

/* 3. Pick an area and see which points (that are stored in your collection) it contains. */

    db.places.find({
        location : {$geoWithin: {$geometry: {type: 'Polygon', 
                                            coordinates: [[[2.635882, 39.579673],
                                                            [2.642013, 39.580135],
                                                            [2.642110, 39.576802],
                                                            [2.636413, 39.576182],
                                                            [2.635882, 39.579673]]]
                                            }
                                }
                  }
        }).pretty()

/* 4. Store at least one area in a different collection. */

    db.areas.insertOne({
        name: 'El Fortí - Son Cotoner',
        area: {
            type: 'Polygon', 
            coordinates: [[
                [2.635882, 39.579673],
                [2.642013, 39.580135],
                [2.642110, 39.576802],
                [2.636413, 39.576182],
                [2.635882, 39.579673]
                ]]
            }
    })

/* 5. Pick a point and find out which areas in your collection contain that point. */

    
