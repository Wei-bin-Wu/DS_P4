class DescargaController < ApplicationController

    skip_before_action :verify_authenticity_token

    def descargar
        send_file("#{Rails.root}/app/assets/apks/flutter.apk")
    end

end