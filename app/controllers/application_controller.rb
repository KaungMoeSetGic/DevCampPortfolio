class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent
    
    # Deleted. Cause it doesn't follow the Single responsibility rule
    # before_action :configure_permitted_parameters, if: :devise_controller?
    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # end
end
