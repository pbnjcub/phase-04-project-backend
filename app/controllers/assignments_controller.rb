class AssignmentsController < ApplicationController
    def index
        assignments = Assignment.all
        render json: assignments, include: [:student, :course]
    end

    def show
        assignment = Assignment.find_by(id: params[:id])
        if assignment
            render json: assignment, include: [:student, :course]
        else
            render json: {error: "Assignment not found"}, status: 404
        end
    end

    def create
        assignment = Assignment.new(assignment_params)
        if assignment.save
            render json: assignment, status: :created
        else
            render json: {errors: assignment.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        assignment = Assignment.find_by(id: params[:id])
        if assignment
            if assignment.update(assignment_params)
                render json: assignment
            else
                render json: {errors: assignment.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Assignment not found"}, status: 404
        end
    end

    def destroy
        assignment = Assignment.find_by(id: params[:id])
        if assignment
            assignment.destroy
            head :no_content
        else
            render json: {error: "Assignment not found"}, status: 404
        end
    end
    

    private

    def assignment_params
        params.require(:assignment).permit(:name, :grade, :student_id, :course_id)
    end

end
