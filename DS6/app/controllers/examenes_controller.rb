class ExamenesController < ApplicationController
  before_action :set_examene, only: %i[ show edit update destroy ]

  # GET /examenes or /examenes.json
  def index
    @examenes = Examene.all
  end

  # GET /examenes/1 or /examenes/1.json
  def show
  end

  # GET /examenes/new
  def new
    @examene = Examene.new
  end

  # GET /examenes/1/edit
  def edit
  end

  # POST /examenes or /examenes.json
  def create
    @examene = Examene.new(examene_params)

    respond_to do |format|
      if @examene.save
        format.html { redirect_to @examene, notice: "Examene was successfully created." }
        format.json { render :show, status: :created, location: @examene }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @examene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examenes/1 or /examenes/1.json
  def update
    respond_to do |format|
      if @examene.update(examene_params)
        format.html { redirect_to @examene, notice: "Examene was successfully updated." }
        format.json { render :show, status: :ok, location: @examene }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @examene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examenes/1 or /examenes/1.json
  def destroy
    @examene.destroy
    respond_to do |format|
      format.html { redirect_to examenes_url, notice: "Examene was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examene
      @examene = Examene.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def examene_params
      params.require(:examene).permit(:nombre, :fecha, :asignaturas_id)
    end
end
