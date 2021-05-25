class SessionsController < ApplicationController
    def create
        session[:rol] = params[:rol]
        if(params[:rol] === 'student')
            @user = Student.find_by(email: params[:email])
        end
        if(params[:rol] === 'professor')
            @user = Professor.find_by(email: params[:email])
        end
        if(params[:rol] === 'administrator')
            @user = Administrator.find_by(email: params[:email])
        end

        if !!@user && @user.pass === params[:pass]
            session[:user_id] = @user.id
            redirect_to professor_path
        else
            message = "Error login"
            redirect_to login_path, notice: message
        end
    end

end