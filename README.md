# README

### GRADEGURU
GradeGuru is a web application that allows teachers to manage courses and students. It provides features for creating, updating, and deleting courses, as well as enrolling and unenrolling students from courses. The app is built using React on the frontend and Ruby on Rails on the backend.

### FEATURES
- User authentication: Teachers can sign up, log in, and log out of the app.
- Course management: teachers can create new courses, update course details, and delete courses, and should only see their own courses.
- Student management: Teachers can view a list of students, enroll students in courses, and unenroll students from courses.

### Technologies used
-React
-Ruby on Rails
-HTML and CSS
-JavaScript

Model, View Controller, Rails Generators, RESTful Routing, Full CRUD capabilities, Many-to-Many relationship between Courses and Students, User Authorization

### Setup and Installation

1. Clone the repository: 
    - backend
        git clone https://github.com/pbnjcub/phase-04-project-backend
    - frontend
        git clone https://github.com/pbnjcub/phase-04-project-frontend


2. Navigate to the project directory:

    cd phase-04-project-backend
    cd phase-04-project-frontend

3. Install the front end and back end dependencies

    - frontend
        npm install

    - backend
        bundle install

4. Set up the database

    - rails db:create
    - rails db:migrate

5. Start the backend server on localhost:3000

    rails s

6. Start the frontend development server on localhost:4000

    npm start

7. Browser should automatically open to 'http://localhost:4000'

### Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

### License
GradeGuru is open source.





----------------------------------------------
### notes

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

-----------------------------------------------------------


