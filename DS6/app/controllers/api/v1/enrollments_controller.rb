module Api
  module V1
class EnrollmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /enrollments or /enrollments.json
  def index
    render json: Enrollment.all, status: :ok
  end

  # GET /enrollments/1 or /enrollments/1.json
  def show
    @enrollments = Enrollment.find_by(id: params[:id])
    if (@enrollments!=nil)
      render json: @enrollments, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      render json: @enrollment, status: :created
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enrollments/1 or /enrollments/1.json
  def update
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.update(enrollment_params)
      render json: @enrollment, status: :created
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    @enrollment = Enrollment.find_by(id: params[:id])
    if @enrollment.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:subject_id, :student_id)
    end
end
end
end