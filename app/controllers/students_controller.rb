class StudentsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:all_students]

    def all_students
        students = Student.all
        render json: students, each_serializer: StudentSerializer
    end

    def index
        course = Course.find(params[:course_id])
        if course
            students = course.students
            render json: students, each_serializer: StudentSerializer
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
            render json: student, status: :created, serializer: StudentSerializer
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
        render json: student, serializer: StudentSerializer
    end

    def render_not_found_response
        render json: { error: "Student not found" }, status: 404
    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session[:user_id]
    end

end
