class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    user.save
    session[:user_id] = user.id
    redirect_to root_path
  end

  def fail
binding.pry
  end

  def login

  end
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
