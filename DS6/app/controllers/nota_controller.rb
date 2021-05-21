class NotaController < ApplicationController
  before_action :set_nota, only: %i[ show edit update destroy ]

  # GET /nota or /nota.json
  def index
    @nota = Nota.all
  end

  # GET /nota/1 or /nota/1.json
  def show
  end

  # GET /nota/new
  def new
    @nota = Nota.new
  end

  # GET /nota/1/edit
  def edit
  end

  # POST /nota or /nota.json
  def create
    @nota = Nota.new(nota_params)

    respond_to do |format|
      if @nota.save
        format.html { redirect_to @nota, notice: "Nota was successfully created." }
        format.json { render :show, status: :created, location: @nota }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota/1 or /nota/1.json
  def update
    respond_to do |format|
      if @nota.update(nota_params)
        format.html { redirect_to @nota, notice: "Notum was successfully updated." }
        format.json { render :show, status: :ok, location: @nota }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota/1 or /nota/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to nota_url, notice: "Notum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota
      @nota = Notum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nota_params
      params.require(:nota).permit(:alumnos_id, :examenes_id, :nota, :foto)
    end
end
