class CoursesController < ApplicationController
    before_action :set_teacher
    before_action :set_course, except: [:index, :create]

    def index
        courses = @teacher.courses
        render json: courses, include: [:students, :courses_students]
    end

    def show
        render json: @course, include: [:teacher, :students, :courses_students]
    end

    def create
        course = @teacher.courses.build(course_params)

        if course.save
            render json: course, status: :created, include: [:teacher, :students, :courses_students]
        else
            render json: {errors: course.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @course.update(course_params)
            render json: @course, status: :accepted, include: [:teacher, :students, :courses_students]
        else
            render json: {errors: @course.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @course.destroy
        head :no_content
    end

    private

    def set_teacher
        @teacher = Teacher.find(params[:teacher_id])
        render json: {error: "Teacher not found"}, status: 404 unless @teacher
    end

    def set_course
        @course = @teacher.courses.find_by(id: params[:id])
        render json: {error: "Course not found"}, status: 404 unless @course
    end

    def course_params
        params.require(:course).permit(:name, :teacher_id)
    end


end
