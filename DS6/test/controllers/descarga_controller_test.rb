require "test_helper"

class DescargaControllerTest < ActionDispatch::IntegrationTest
    test "debe descargar correctamente" do
        get "/app/assets/apks/flutter.apk"
        assert_response :success
    end
end