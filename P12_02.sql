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
Finally, join all the information of the users joined with their posts.
. */

    

