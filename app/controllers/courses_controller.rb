class CoursesController < ApplicationController
    def index
        courses = Course.all
        render json: courses, include: '*'
    end

    def show
        course = Course.find_by(id: params[:id])
        if course
            render json: course
        else
            render json: {error: "Course not found"}, status: 404
        end
    end

    def create
        course = Course.new(course_params)
        if course.save
            render json: course, status: :created
        else
            render json: {errors: course.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        course = Course.find_by(id: params[:id])
        if course
            if course.update(course_params)
                render json: course
            else
                render json: {errors: course.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Course not found"}, status: 404
        end
    end

    def destroy
        course = Course.find_by(id: params[:id])
        if course
            course.destroy
            head :no_content
        else
            render json: {error: "Course not found"}, status: 404
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :teacher_id)
    end


end
