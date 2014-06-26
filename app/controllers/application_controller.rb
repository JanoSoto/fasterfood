class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/users/sign_in", :alert => exception.message
  end

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  #before_filter do
  #  resource = controller_name.singularize.to_sym
  #  method = "#{resource}_params"
  #  params[resource] &&= send(method) if respond_to?(method, true)
  #end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :rut
    devise_parameter_sanitizer.for(:sign_up) << :nombre
    devise_parameter_sanitizer.for(:sign_up) << :apellido_paterno
    devise_parameter_sanitizer.for(:sign_up) << :apellido_materno
    devise_parameter_sanitizer.for(:sign_up) << :telefono
    devise_parameter_sanitizer.for(:sign_up) << :user_id
  end
end
