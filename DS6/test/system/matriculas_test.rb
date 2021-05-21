require "application_system_test_case"

class MatriculasTest < ApplicationSystemTestCase
  setup do
    @matricula = matriculas(:one)
  end

  test "visiting the index" do
    visit matriculas_url
    assert_selector "h1", text: "Matriculas"
  end

  test "creating a Matricula" do
    visit matriculas_url
    click_on "New Matricula"

    fill_in "Alumnos", with: @matricula.alumnos_id
    fill_in "Asignaturas", with: @matricula.asignaturas_id
    click_on "Create Matricula"

    assert_text "Matricula was successfully created"
    click_on "Back"
  end

  test "updating a Matricula" do
    visit matriculas_url
    click_on "Edit", match: :first

    fill_in "Alumnos", with: @matricula.alumnos_id
    fill_in "Asignaturas", with: @matricula.asignaturas_id
    click_on "Update Matricula"

    assert_text "Matricula was successfully updated"
    click_on "Back"
  end

  test "destroying a Matricula" do
    visit matriculas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matricula was successfully destroyed"
  end
end
