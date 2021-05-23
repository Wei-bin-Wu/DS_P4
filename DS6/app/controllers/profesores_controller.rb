class ProfesoresController < ApplicationController
  before_action :set_profesore, only: %i[ show edit update destroy ]

  # GET /profesores or /profesores.json
  def index
    @profesores = Profesore.all
  end

  # GET /profesores/1 or /profesores/1.json
  def show
  end

  def descargar
    send_file("#{Rails.root}/app/assets/apks/flutter.apk")
  end
  # GET /profesores/new
  def new
    @profesore = Profesore.new
  end

  # GET /profesores/1/edit
  def edit
  end

  # POST /profesores or /profesores.json
  def create
    @profesore = Profesore.new(profesore_params)

    respond_to do |format|
      if @profesore.save
        format.html { redirect_to @profesore, notice: "Profesore was successfully created." }
        format.json { render :show, status: :created, location: @profesore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profesore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesores/1 or /profesores/1.json
  def update
    respond_to do |format|
      if @profesore.update(profesore_params)
        format.html { redirect_to @profesore, notice: "Profesore was successfully updated." }
        format.json { render :show, status: :ok, location: @profesore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profesore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesores/1 or /profesores/1.json
  def destroy
    @profesore.destroy
    respond_to do |format|
      format.html { redirect_to profesores_url, notice: "Profesore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesore
      @profesore = Profesore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profesore_params
      params.require(:profesore).permit(:nombre, :apellido, :num_tlf, :email, :pass)
    end
end
