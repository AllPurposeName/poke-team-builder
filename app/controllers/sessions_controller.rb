class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def fail
binding.pry
  end

  def exit
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
