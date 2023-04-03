class SubjectsController < ApplicationController
    def index
        subjects = Subject.all
        render json: subjects, include: [:students, :assignments]
    end

    def show
        subject = Subject.find_by(id: params[:id])
        if subject
            render json: subject
        else
            render json: {error: "Subject not found"}, status: 404
        end
    end

    def create
        subject = Subject.new(subject_params)
        if subject.save
            render json: subject, status: :created
        else
            render json: subject.errors, status: :unprocessable_entity
        end
    end

    def update
        subject = Subject.find_by(id: params[:id])
        if subject
            subject.update(subject_params)
            render json: subject
        else
            render json: subject.errors, status: :unprocessable_entity
        end
    end

    def destroy
        subject = Subject.find_by(id: params[:id])
        if subject
            subject.destroy
            head :no_content
        else
            render json: {error: "Subject not found"}, status: 404
        end
    end

    private

    def subject_params
        params.require(:subject).permit(:name, :teacher)
    end


end
