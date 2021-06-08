class ApplicationController < ActionController::Base

#Configuracion para guardar toda la base de datos que queramos de devise
#Ejecutar este metodo solo si se inicio el controlador de devise
before_action :configure_devise_params, if: :devise_controller?

    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:name, :email, :url_photo, :password, :password_confirmation)
        end
    end
end

