class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end
  
  def descargar
    send_file("app/assets/images/"+params[:route]+".jpg")
  end

  # POST /notes or /notes.json
  def create
    if note_params[:photo] != nil
      uploaded_io = note_params[:photo]
      ruta = Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename)
      rutaDescarga = "/app/assets/images/" + uploaded_io.original_filename
      File.open(ruta,'wb') do |file|
        file.write(uploaded_io.read)
      end

      @note = Note.new({student_id:note_params[:student_id], exam_id:note_params[:exam_id],  nota:note_params[:nota], photo:rutaDescarga})
    else
      @note = Note.new(note_params)
    end

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    if note_params[:photo] != nil
      uploaded_io = note_params[:photo]
      ruta = Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename)
      rutaDescarga = "/app/assets/images/" + uploaded_io.original_filename
      File.open(ruta,'wb') do |file|
        file.write(uploaded_io.read)
      end
    else
      rutaDescarga = @note.photo
    end
    

    respond_to do |format|
      if @note.update({student_id:note_params[:student_id], exam_id:note_params[:exam_id],  nota:note_params[:nota], photo:rutaDescarga})
        format.html { redirect_to @note, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:student_id, :exam_id, :nota, :photo)
    end
end
