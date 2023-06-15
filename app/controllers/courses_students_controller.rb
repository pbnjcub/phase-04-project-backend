class CoursesStudentsController < ApplicationController
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