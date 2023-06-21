class TeachersController < ApplicationController
   

    def index
        teachers = Teacher.all
        render json: teachers, each_serializer: TeacherSerializer
    end

    def show
        find_teacher
        if @teacher
            render_teacher(@teacher)
        else
            render_not_found_response
        end
    end

    def create
        teacher = Teacher.new(teacher_params)
        if teacher.save
            render json: teacher, status: :created, serializer: TeacherSerializer
        else
            render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        find_teacher
        if @teacher
            if @teacher.update(teacher_params)
                render_teacher(@teacher)
            else
                render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render_not_found_response
        end
    end

    def destroy
        find_teacher
        if @teacher
            @teacher.destroy
            head :no_content
        else
            render_not_found_response
        end
    end
    

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :email, user_attributes: [:username, :password])
    end

    def find_teacher
        @teacher = Teacher.find_by(id: params[:id])
    end

    def render_teacher(teacher)
        render json: teacher, serializer: TeacherSerializer
    end

    def render_not_found_response
        render json: { error: "Teacher not found" }, status: 404
    end

end
