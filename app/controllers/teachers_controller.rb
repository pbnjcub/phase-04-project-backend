class TeachersController < ApplicationController
    def index
        teachers = Teacher.all
        render json: teachers, include: :courses
    end

    def show
        teacher = Teacher.find_by(id: params[:id])
        if teacher
            render json: teacher, include: :courses
        else
            render json: {error: "Teacher not found"}, status: 404
        end
    end

    # def create
    #     teacher = Teacher.new(teacher_params)
    #     if teacher.save
    #         render json: teacher, status: :created
    #     else
    #         render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
    #     end
    # end

    # def update
    #     teacher = Teacher.find_by(id: params[:id])
    #     if teacher
    #         if teacher.update(teacher_params)
    #             render json: teacher
    #         else
    #             render json: {errors: teacher.errors.full_messages}, status: :unprocessable_entity
    #         end
    #     else
    #         render json: {error: "Teacher not found"}, status: 404
    #     end
    # end

    # def destroy
    #     teacher = Teacher.find_by(id: params[:id])
    #     if teacher
    #         teacher.destroy
    #         head :no_content
    #     else
    #         render json: {error: "Teacher not found"}, status: 404
    #     end
    # end
    

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name)
    end
end
