require "test_helper"

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator = administrators(:one)
  end

  test "nueva entrada sin credencial" do  
    get new_administrator_url
    assert_response :success
  end

  test "nueva entrada con credencial" do  
    get new_administrator_url, params:nil, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'admin') }
    assert_response :success
  end


  # no puesto en diseño
  test "should get index" do
    get administrators_url
    assert_response :success
  end

  test "should create administrator" do
    assert_difference('Administrator.count') do
      post administrators_url, params: { administrator: { email: @administrator.email, name: @administrator.name, pass: @administrator.pass, phone: @administrator.phone, surname: @administrator.surname } }
    end

    assert_redirected_to administrator_url(Administrator.last)
  end

  test "should show administrator" do
    get administrator_url(@administrator)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrator_url(@administrator)
    assert_response :success
  end

  test "should update administrator" do
    patch administrator_url(@administrator), params: { administrator: { email: @administrator.email, name: @administrator.name, pass: @administrator.pass, phone: @administrator.phone, surname: @administrator.surname } }
    assert_redirected_to administrator_url(@administrator)
  end

  test "should destroy administrator" do
    assert_difference('Administrator.count', -1) do
      delete administrator_url(@administrator)
    end

    assert_redirected_to administrators_url
  end
end
