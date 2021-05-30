require "test_helper"

class ProfessorTest < ActiveSupport::TestCase
  test "No debe guardar profesor con campo telefono con longitud mayor que 9" do
    p = Professor.new(id: 3, name: "Daniel", surname: "Saucedo", phone:"1234567890", email: "daniel@gmail.com", pass: "daniel")
    assert p.save, "Guardando correctamente"
    assert_equal 9, p.phone.length
  end
end
