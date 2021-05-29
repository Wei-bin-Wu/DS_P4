module Api
  module V1
class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /students or /students.json
  def index
    render json: Student.all, status: :ok
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find_by(id: params[:id])
    if (@student!=nil)
      render json: @student, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student = Student.find_by(id: params[:id])
    if @notes.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :surname, :phone, :email, :pass, :address)
    end
end
end
end