module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def create
      super do |user|
        unless user.persisted?
          flash.now[:alert] = user.errors.full_messages.join(', ')
        end
      end
    end
    

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :prefecture])
    end

    def after_sign_up_path_for(resource)
      root_path
    end
  end
end
