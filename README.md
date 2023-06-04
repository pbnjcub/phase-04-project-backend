# README

#read me for phase 4 backend

REPRESENTATIONAL STATE TRANSFER
CRUD - CREATE, READ, UPDATE, DELETE

7 RESTFUL ROUTES

HTTP VERB               ROUTE                   ACTION
get                     /students               index
get                     /students/:id           show
get                     /students/new           new
get                     /students/:id/edit      edit
patch                   /students/:id           update
post                    /students               create
delete                  /students/:id           destroy

MVC - Model, View, Controller
Model - communicates with the database, inherits from Active Record
    Students have many Courses, through StudentCourses
    Courses have many Students, through StudentCourses
    Teachers have many courses
    
View - displays the data to the client (browser) handled by react
Controller - interacts between the Model and the View => this is the request response flow

teacher has many classes
a class has one teacher


