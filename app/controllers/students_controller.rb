class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def create
        student = Student.create!(name: params[:name], major: params[:major], age: params[:age], instructor_id: params[:instructor_id])
        render json: student, status: :created
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        head :no_content
    end

    private
    def render_not_found
        render json: { error: "Student not found" }, status: :not_found
    end
end
