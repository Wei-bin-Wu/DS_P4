class DescargaController < ApplicationController

    def descargar
        send_file("#{Rails.root}/app/assets/apks/flutter.apk")
    end

end