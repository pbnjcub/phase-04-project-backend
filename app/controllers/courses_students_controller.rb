class CoursesStudentsController < ApplicationController
    def index
        coursesstudents = CoursesStudent.all
        render json: coursesstudents, include: [:course, :student]
    end
    
    
    def create
        coursesstudent = CoursesStudent.create(student_id: params[:student_id], course_id: params[:course_id], grade: params[:grade])
        render json: coursesstudent, status: :created
    end

    def update
        coursesstudent = CoursesStudent.find_by(id: params[:id])
        if coursesstudent
            if coursesstudent.update(coursesstudent_params)
                render json: coursesstudent
            else
                render json: {errors: coursesstudent.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Student not enrolled"}, status: 404
        end
    end

    def destroy
        coursesstudent = CoursesStudent.find_by(id: params[:id])
        if coursesstudent
            coursesstudent.destroy
            head :no_content
        else
            render json: {error: "Student not enrolled or does not exist"}, status: 404
        end
    end

    private

    def coursesstudent_params
        params.require(:courses_student).permit(:grade)
    end
end