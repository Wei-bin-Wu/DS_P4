require "application_system_test_case"

class NotaTest < ApplicationSystemTestCase
  setup do
    @nota = nota(:one)
  end

  test "visiting the index" do
    visit nota_url
    assert_selector "h1", text: "Nota"
  end

  test "creating a Nota" do
    visit nota_url
    click_on "New Nota"

    fill_in "Alumnos", with: @nota.alumnos_id
    fill_in "Examenes", with: @nota.examenes_id
    fill_in "Foto", with: @nota.foto
    fill_in "Nota", with: @nota.nota
    click_on "Create Nota"

    assert_text "Nota was successfully created"
    click_on "Back"
  end

  test "updating a Nota" do
    visit nota_url
    click_on "Edit", match: :first

    fill_in "Alumnos", with: @nota.alumnos_id
    fill_in "Examenes", with: @nota.examenes_id
    fill_in "Foto", with: @nota.foto
    fill_in "Nota", with: @nota.nota
    click_on "Update Nota"

    assert_text "Nota was successfully updated"
    click_on "Back"
  end

  test "destroying a Nota" do
    visit nota_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nota was successfully destroyed"
  end
end
