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

    

/* 3. Pick an area and see which points (that are stored in your collection) it contains. */

    

/* 4. Store at least one area in a different collection. */

    

/* 5. Pick a point and find out which areas in your collection contain that point. */

    
