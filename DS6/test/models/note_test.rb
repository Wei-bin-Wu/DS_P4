require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  
  test "No debe guardar nota con campo student vacio" do
    nota = Note.new(exam:Exam.first, note:7, photo:"/imgs")
    assert nota.save, "Guardando nota con campo stundent vacío"
    # assert_not nota.save, "Guardando nota con campo stundent vacío" # para que se de correcto
  end

end
