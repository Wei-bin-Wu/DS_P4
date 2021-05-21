class NotaController < ApplicationController
  before_action :set_notum, only: %i[ show edit update destroy ]

  # GET /nota or /nota.json
  def index
    @nota = Notum.all
  end

  # GET /nota/1 or /nota/1.json
  def show
  end

  # GET /nota/new
  def new
    @notum = Notum.new
  end

  # GET /nota/1/edit
  def edit
  end

  # POST /nota or /nota.json
  def create
    @notum = Notum.new(notum_params)

    respond_to do |format|
      if @notum.save
        format.html { redirect_to @notum, notice: "Notum was successfully created." }
        format.json { render :show, status: :created, location: @notum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota/1 or /nota/1.json
  def update
    respond_to do |format|
      if @notum.update(notum_params)
        format.html { redirect_to @notum, notice: "Notum was successfully updated." }
        format.json { render :show, status: :ok, location: @notum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota/1 or /nota/1.json
  def destroy
    @notum.destroy
    respond_to do |format|
      format.html { redirect_to nota_url, notice: "Notum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notum
      @notum = Notum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notum_params
      params.require(:notum).permit(:alumnos_id, :examenes_id, :nota, :foto)
    end
end
