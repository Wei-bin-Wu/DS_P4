require "application_system_test_case"

class ExamenesTest < ApplicationSystemTestCase
  setup do
    @examene = examenes(:one)
  end

  test "visiting the index" do
    visit examenes_url
    assert_selector "h1", text: "Examenes"
  end

  test "creating a Examene" do
    visit examenes_url
    click_on "New Examene"

    fill_in "Asignaturas", with: @examene.asignaturas_id
    fill_in "Fecha", with: @examene.fecha
    fill_in "Nombre", with: @examene.nombre
    click_on "Create Examene"

    assert_text "Examene was successfully created"
    click_on "Back"
  end

  test "updating a Examene" do
    visit examenes_url
    click_on "Edit", match: :first

    fill_in "Asignaturas", with: @examene.asignaturas_id
    fill_in "Fecha", with: @examene.fecha
    fill_in "Nombre", with: @examene.nombre
    click_on "Update Examene"

    assert_text "Examene was successfully updated"
    click_on "Back"
  end

  test "destroying a Examene" do
    visit examenes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Examene was successfully destroyed"
  end
end
