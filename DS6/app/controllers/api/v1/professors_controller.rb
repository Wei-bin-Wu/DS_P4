module Api
  module V1
class ProfessorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /professors or /professors.json
  def index
    render json: Professor.all, status: :ok
  end

  # GET /professors/1 or /professors/1.json
  def show
    @professor = Professor.find_by(id: params[:id])
    if (@professor!=nil)
      render json: @notes, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors or /professors.json
  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      render json: @professor, status: :created
    else
      render json: @professor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /professors/1 or /professors/1.json
  def update
    @professor = Professor.find(params[:id])

    if @professor.update(professor_params)
      render json: @professor, status: :created
    else
      render json: @professor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /professors/1 or /professors/1.json
  def destroy
    @professor = Professor.find_by(id: params[:id])
    if @professor.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professor_params
      params.require(:professor).permit(:name, :surname, :phone, :email, :pass)
    end
end
end
end