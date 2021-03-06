class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  
  def new
    super
  end
  
  protected
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :university, :department, :mobile_phone, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
