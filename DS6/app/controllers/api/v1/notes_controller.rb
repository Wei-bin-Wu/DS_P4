module Api
  module V1
class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /notes or /notes.json
  def index
    render json: Note.all, status: :ok
  end

  # GET /notes/1 or /notes/1.json
  def show
    @notes = Note.find_by(id: params[:id])
    if (@notes!=nil)
      render json: @notes, status: :ok
    else  
      render json: :nothing, status: :not_found
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end
  
  def descargar
    send_file(request.original_url[25..-1])
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @notes = Note.find_by(id: params[:id])
    if @notes.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:student_id, :exam_id, :note, :photo)
    end
end
end
end