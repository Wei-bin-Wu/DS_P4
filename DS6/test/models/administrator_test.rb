require "test_helper"

class AdministratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Introducir nueva entrada con mismo email" do
    assert_raises(StandardError) do
      admin = Administrator.new(name:"ad5", surname:"ad5", email:"email@ad1.es", pass:"ad5")
      admin.save
    end
  end
end
