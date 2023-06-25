class CoursesStudentsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:find_grade]


    def index
        courses_students = CoursesStudent.all
        render json: courses_students, include: [:course, :student]
    end

    def create
        courses_student = CoursesStudent.create(student_id: params[:student_id], course_id: params[:course_id], grade: params[:grade])
        render json: courses_student, status: :created
    end

    def update
        courses_student = CoursesStudent.find_by(id: params[:id])
        if courses_student
            if courses_student.update(courses_student_params)
                render json: courses_student
            else
                render json: {errors: courses_student.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Student not enrolled"}, status: 404
        end
    end

    def find_grade
        #filter all objects so that only the ones with the grade returns
        grades = CoursesStudent.all.filter{|student| student.grade === params[:grade].to_s}
        #find all course ids associated with grades
        course_ids = grades.map{|grade| grade.course_id}
        courses = course_ids.map do |course_id|
            Course.all.find{|course| course.id == course_id}
        end
        teachers = courses.map{|course| course.teacher}
        render json: teachers
    end

    def destroy
        student_id = params[:student_id]
        course_id = params[:course_id]

        courses_student = CoursesStudent.find_by(student_id: student_id, course_id: course_id)
        if courses_student
            courses_student.destroy
            head :no_content
        else
            render json: {error: "Student not enrolled or does not exist"}, status: 404
        end
    end

    private

    def courses_student_params
        params.require(:courses_student).permit(:grade)
    end
end