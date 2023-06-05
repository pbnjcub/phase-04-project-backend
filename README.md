# README

#read me for phase 4 backend

### MVC - Model, View, Controller
    * Model - communicates with the database, inherits from Active Record
        Students have many Courses, through Courses_Student
        Courses have many Students, through Courses_Student
        Teachers have many courses

    * View - displays the data to the client (browser) handled by react
    
    * Controller - interacts between the Model and the View => this is the request response flow

### Generators
    * migration - generates migration file
    * model - generates a model and migration file
    * controller - generates a controller
    * resource - generates a migration, model and controller, also gives routing.
    * scaffold - generates a migration, model, controller, also gives routing and full restful logic.

### Routes
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

* resources - all restful routes for that model

### Cookies
* Data that is stored in the browser and their role is to add persistence

