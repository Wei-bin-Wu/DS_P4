module Api
  module V1
class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # GET /subjects or /subjects.json
  def index
    render json: Subject.all, status: :ok
  end

  # GET /subjects/1 or /subjects/1.json
  def show
    @subject = Subject.find_by(id: params[:id])
    if (@subject!=nil)
      render json: @subject, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      render json: @subject, status: :ok
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject = Subject.find_by(id: params[:id])
    if @subject.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :professor_id)
    end
end
end
end