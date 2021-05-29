class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: "administrador", password: "administrador", except: [:index, :show, :descargar]
end
