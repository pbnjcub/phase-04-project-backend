class StudentsController < ApplicationController

    def all_students
        students = Student.all
        render json: students, include: [:courses, :courses_students]
    end

    def index
        course = Course.find(params[:course_id])
        if course
            students = course.students
            render json: students, include: [:courses, :courses_students]
        else
            render json: {error: "Course not found"}, status: 404
        end
    end

    def show
        find_student
        
        if @student
            render_student(@student)
        else
            render_not_found_response
        end
      end

    def create
        student = Student.new(student_params)
        if student.save
            render json: student, status: :created, include: [:courses, :courses_students]
        else
            render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        find_student
        if @student
            if @student.update(student_params)
                render_student(@student)
            else
                render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render_not_found_response
        end
    end

    def destroy
        find_student
        if @student
            @student.destroy
            head :no_content
        else
            render_not_found_response
        end
    end
    

    private

    def student_params
        params.require(:student).permit(:id, :first_name, :last_name)
    end

    def find_student
        @student = Student.find_by(id: params[:id])
    end

    def render_student(student)
        render json: student, include: [:courses, :courses_students]
    end

    def render_not_found_response
        render json: { error: "Student not found" }, status: 404
    end

end
