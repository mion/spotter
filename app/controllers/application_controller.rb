class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_path, alert: exception.message 
  end
end
