module Api
  module V1
class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /exams or /exams.json
  def index
    render json: Exam.all, status: :ok
  end

  # GET /exams/1 or /exams/1.json
  def show
    @exam = Exam.find_by(id: params[:id])
    if (@exam!=nil)
      render json: @exam, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      render json: @exam, status: :created
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    @exam = Exam.find(params[:id])

    if @exam.update(exam_params)
      render json: @exam, status: :ok
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam = Exam.find_by(id: params[:id])
    if @exam.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:name, :date, :subject_id)
    end
end
end
end