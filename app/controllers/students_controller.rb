class StudentsController < ApplicationController
    before_action :set_course, only: [:index, :create]

    def all_students
        students = Student.all
        render json: students, include: [:courses, :courses_students]
    end

    def index
        students = @course.students
        render json: students, include: [:courses, :courses_students]
    end

    def show
        student = Student.find_by(id: params[:id])
        if student
            render json: student, include: [:courses, :courses_students]
        else
            render json: {error: "Student not found"}, status: 404
        end
    end

    def create
        student = @course.students.build(student_params)
        if student.save
            courses_student = CoursesStudent.create(student_id: student.id, course_id: params[:course_id], grade: params[:grade])
            render json: student, status: :created, include: [:courses, :courses_students]
        else
            render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        student = Student.find_by(id: params[:id])
        if student
            if student.update(student_params)
                render json: student, include: [:courses, :courses_students]
            else
                render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Student not found"}, status: 404
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
        else
            render json: {error: "Student not found"}, status: 404
        end
    end
    

    private

    def student_params
        params.require(:student).permit(:id, :first_name, :last_name)
    end

    def set_course
        @course = Course.find(params[:course_id])
        render json: {error: "Course not found"}, status: 404 unless @course
    end

end
