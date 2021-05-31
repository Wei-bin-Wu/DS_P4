require "test_helper"

class ProfessorTest < ActiveSupport::TestCase
  test "No debe guardar profesor con campo telefono con longitud mayor que 9" do
    assert_raises(StandardError) do
      p = Professor.new(name: "Daniel", surname: "Saucedo", phone:"1234567890", email: "daniel@gmail.com", pass: "daniel")
      p.save
    end
  end
end
