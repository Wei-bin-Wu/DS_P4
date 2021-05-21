require "test_helper"

class ExamenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @examene = examenes(:one)
  end

  test "should get index" do
    get examenes_url
    assert_response :success
  end

  test "should get new" do
    get new_examene_url
    assert_response :success
  end

  test "should create examene" do
    assert_difference('Examene.count') do
      post examenes_url, params: { examene: { asignaturas_id: @examene.asignaturas_id, fecha: @examene.fecha, nombre: @examene.nombre } }
    end

    assert_redirected_to examene_url(Examene.last)
  end

  test "should show examene" do
    get examene_url(@examene)
    assert_response :success
  end

  test "should get edit" do
    get edit_examene_url(@examene)
    assert_response :success
  end

  test "should update examene" do
    patch examene_url(@examene), params: { examene: { asignaturas_id: @examene.asignaturas_id, fecha: @examene.fecha, nombre: @examene.nombre } }
    assert_redirected_to examene_url(@examene)
  end

  test "should destroy examene" do
    assert_difference('Examene.count', -1) do
      delete examene_url(@examene)
    end

    assert_redirected_to examenes_url
  end
end
