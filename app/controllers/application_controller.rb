class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_user

  def current_user
    current_user ||= CurrentUser.new(User.find_by(id: session[:user_id]))
  end
end
