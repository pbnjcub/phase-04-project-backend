class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find_by(id: params[:id])
        if student
            render json: student
        else
            render json: {error: "Student not found"}, status: 404
        end
    end
end
