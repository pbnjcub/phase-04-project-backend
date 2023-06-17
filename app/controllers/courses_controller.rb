class CoursesController < ApplicationController

    def all_courses
        courses = Course.all
        render json: courses, include: [:students, :courses_students]
    end

    def index
        if params[:teacher_id].present?
            teacher = Teacher.find(params[:teacher_id])
            courses = current_teacher.courses
        elsif params[:student_id].present?
            student = Student.find(params[:student_id])
            courses = student.courses
        else
            courses = Course.all
        end
        render json: courses, include: [:students, :courses_students]
    end

    def show
        find_course
        if @course
            render json: @course, include: [:teacher, :students, :courses_students]
        else
            render_not_found_response
        end
    end

    def create
        teacher = Teacher.find(params[:teacher_id])
        if teacher
            course = teacher.courses.build(course_params)
            if course.save
                render json: course, status: :created, include: [:teacher, :students, :courses_students]
            else
                render json: {errors: course.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Teacher not found"}, status: 404
        end
    end

    def update
        find_course
        if @course
            if @course.update(course_params)
                render json: @course, status: :accepted, include: [:teacher, :students, :courses_students]
            else
                render json: {errors: @course.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render_not_found_response
        end
    end

    def destroy
        find_course
        if @course
            @course.destroy
            head :no_content
        else
            render_not_found_response
        end
    end

    private

    def course_params
        params.require(:course).permit(:name, :teacher_id)
    end

    def find_course
        @course = Course.find_by(id: params[:id])
    end

    def render_not_found_response
        render json: { error: "Course not found" }, status: 404
    end


end
