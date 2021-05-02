// Connect to admin database
conn = new Mongo();
db = conn.getDB("admin");
db.auth("admin","pass");

// Create 
db.createUser(
    {
        user: "tester",
        pwd: "PlayMongoIsGood123",
        roles: [
            "readWriteAnyDatabase"
        ]
    }
);
db.createUser(
    {
        user: "looker",
        pwd: "SeeMongoBehavior123",
        roles: [
            "readAnyDatabase"
        ]
    }
);