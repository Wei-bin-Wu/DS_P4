require "test_helper"

class ExamTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Introducir fecha con un formato erroneo" do
    exam = Exam.new(name:"ex1", date:"12kj4hi1uhasd", subject:1)
    assert_not exam.save, "Guardando examen con campo fecha no valido"
  end
end
