require "application_system_test_case"

class ProfesoresTest < ApplicationSystemTestCase
  setup do
    @profesore = profesores(:one)
  end

  test "visiting the index" do
    visit profesores_url
    assert_selector "h1", text: "Profesores"
  end

  test "creating a Profesore" do
    visit profesores_url
    click_on "New Profesore"

    fill_in "Apellido", with: @profesore.apellido
    fill_in "Email", with: @profesore.email
    fill_in "Nombre", with: @profesore.nombre
    fill_in "Num tlf", with: @profesore.num_tlf
    fill_in "Pass", with: @profesore.pass
    click_on "Create Profesore"

    assert_text "Profesore was successfully created"
    click_on "Back"
  end

  test "updating a Profesore" do
    visit profesores_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @profesore.apellido
    fill_in "Email", with: @profesore.email
    fill_in "Nombre", with: @profesore.nombre
    fill_in "Num tlf", with: @profesore.num_tlf
    fill_in "Pass", with: @profesore.pass
    click_on "Update Profesore"

    assert_text "Profesore was successfully updated"
    click_on "Back"
  end

  test "destroying a Profesore" do
    visit profesores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profesore was successfully destroyed"
  end
end
