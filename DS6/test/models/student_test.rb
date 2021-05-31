require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Se puede guardar student con campo phone y address vacío" do
    student = Student.new(name:"s1", surname:"s11", email:"s1@gmail.com", pass:"s1")
    assert student.save, "Guardando student con campo phone y address vacío"
  end
end
