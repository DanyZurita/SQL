/* 1. We want to create a MongoDB database for a blog. If we think in the 
same way that we did using relational model, a blog may have 3 entities:

User. Fields:
    _id
    name
    dateOfBirth
    email
Post. Fields:
    _id
    title
    text
    Tags ([ ])
Comment. Fields:
    _id
    text
    author

A user may create posts (a post belongs to a single user). Users may also 
comment posts (a comment belongs to a single post).
If we think in the same way that we did using relational model, this 
database will have 3 tables. But with MongoDB it’s a good idea to insert 
comments inside their post (because comments belong to a single post). The 
reason is that, usually, when you get a post you want its comments also… 
With MongoDB you think nearer to the implementation. You’ll understand this 
next year :)
So, create using MongoDB a database “blog” with two collections “user” and 
“post”. Remember that the comments are a field inside a “post” document…
Finally, join all the information of the users joined with their posts. */

    use blog

    db.users.insertMany([{
        _id: "000001",
        name: "Dany Zurita",
        dateOfBirth: "07/04/1999",
        email: "dzurita@cifpfbmoll.eu"
    },
    {
        _id: "000002",
        name: "Isidre Martí",
        dateOfBirth: "22/12/1999",
        email: "imarti@cifpfbmoll.eu"
    },
    {
        _id: "000003",
        name: "Tomás Tomasao",
        dateOfBirth: "07/04/1999",
        email: "dzurita@cifpfbmoll.eu"
    }])

    db.post.insertMany([{
        _id: "000001P",
        _auth_id: "000001",
        post_auth: "Dany Zurita",
        title: "Notas Evaluación",
        text: "Estas son las notas que he sacado: 8, 8, 7, 7 y 7",
        tags: ["notas","examen","evaluacion"],
        comments: [{
            _auth_id: "000002",
            com_auth: "Isidre Martí",
            text: "Que bien! Todo aprobado con buena nota."
        },
        {
            _auth_id: "000003",
            com_auth: "Tomás Tomasao",
            text: "Enhorabuena!"
        }]
    },
    {
        _id: "000002P",
        _auth_id: "000002",
        post_auth: "Isidre Martí",
        title: "Notas Evaluación",
        text: "Estas son las notas que he sacado: 8, 8, 8, 7 y 7",
        tags: ["notas","examen","evaluacion"],
        comments: [{
            _auth_id: "000001",
            com_auth: "Dany Zurita",
            text: "Qué cabrón, un 8 más que yo."
        },
        {
            _auth_id: "000003",
            com_auth: "Tomás Tomasao",
            text: "Esperar a ver las mias jaja"
        }]
    },
    {
        _id: "000003P",
        _auth_id: "000003",
        post_auth: "Tomás Tomasao",
        title: "Notas Evaluación",
        text: "Estas son las notas que he sacado: 5, 5, 5, 5 y 5",
        tags: ["notas","examen","evaluacion"],
        comments: [{
            _auth_id: "000002",
            com_auth: "Isidre Martí",
            text: "Al menos esta aprobado"
        },
        {
            _auth_id: "000001",
            com_auth: "Dany Zurita",
            text: "Ole, todo aprobado"
        }]
    },])

    db.post.aggregate(
        [{$lookup:
            {
                from: "users",
                localField: "comments._auth_id",
                foreignField: "_id",
                as: "authorData"
            }
        }]
    ).pretty()