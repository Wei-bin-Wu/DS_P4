require "test_helper"

class NotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nota = nota(:one)
  end

  test "should get index" do
    get nota_url
    assert_response :success
  end

  test "should get new" do
    get new_nota_url
    assert_response :success
  end

  test "should create nota" do
    assert_difference('Nota.count') do
      post nota_url, params: { nota: { alumnos_id: @nota.alumnos_id, examenes_id: @nota.examenes_id, foto: @nota.foto, nota: @nota.nota } }
    end

    assert_redirected_to nota_url(Nota.last)
  end

  test "should show nota" do
    get nota_url(@nota)
    assert_response :success
  end

  test "should get edit" do
    get edit_nota_url(@nota)
    assert_response :success
  end

  test "should update nota" do
    patch nota_url(@nota), params: { nota: { alumnos_id: @nota.alumnos_id, examenes_id: @nota.examenes_id, foto: @nota.foto, nota: @nota.nota } }
    assert_redirected_to nota_url(@nota)
  end

  test "should destroy nota" do
    assert_difference('Nota.count', -1) do
      delete nota_url(@nota)
    end

    assert_redirected_to nota_url
  end
end
