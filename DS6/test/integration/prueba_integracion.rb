require "test_helper"

class PruebaIntegracion < ActionDispatch::IntegrationTest
    test "puede acceder primera pagina, que es tabla de profesores y menú" do
        get "/"
        assert_select "h1", "Professors"
        assert_select "div", 9
    end

    test "cambio de pagina correcto" do
        get "/students"
        assert_select "h1", "Students"
        assert_select "div", 9
    end
    
    setup do
        @student = students(:one)
    end
    test "editar elemento correctamente" do
        # ir a pagina student y editar su correspondiente entrada
        patch student_url(@student), params: { student: { email:"nuevo@nuevo.es", name: @student.name, pass: @student.pass, phone: @student.phone, surname: @student.surname, address:@student.address } }, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'admin') }
        assert_redirected_to student_url(@student)

        # vuelto a la página show
        get student_url(@student)
        assert_response :success
        # comprueba los elementos
        assert_select "p", "Student was successfully updated."
        assert_select 'p' do
              assert_select 'strong', 'Email:'
              assert 'nuevo@nuevo.es', 1
          end
    end
end