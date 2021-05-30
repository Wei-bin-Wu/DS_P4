require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "No debe guardar nota con campo student vacio" do
    nota = Note.new(exam:1, note:7, photo:"/imgs")
    assert_not nota.save, "Guardando nota con campo stundent vacío"
  end

  
end
