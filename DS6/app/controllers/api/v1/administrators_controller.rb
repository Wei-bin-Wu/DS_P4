module Api
  module V1
class AdministratorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /administrators or /administrators.json
  def index
    @administrators = Administrator.all
    render json: @administrators, status: :ok
  end

  # GET /administrators/1 or /administrators/1.json
  def show
    @administrators = Administrator.find_by(id: params[:id])
    if (@administrators!=nil)
      render json: @administrators, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators or /administrators.json
  def create
    @administrator = Administrator.new(administrator_params)
      if @administrator.save
        render json: @administrator, status: :created
      else
        render json: @administrator.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /administrators/1 or /administrators/1.json
  def update
    @administrator = Administrator.find(params[:id])

    if @administrator.update(administrator_params)
      render json: @administrator, status: :ok
    else
      render json: @administrator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /administrators/1 or /administrators/1.json
  def destroy
    @administrator = Administrator.find_by(id: params[:id])
    if @administrator.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrator_params
      params.require(:administrator).permit(:name, :surname, :phone, :email, :pass)
    end
end
end
end