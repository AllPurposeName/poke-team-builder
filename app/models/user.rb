class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = self.new()
    user.uid        = auth.uid
    user.name       = auth.info.name
    user.first_name = auth.info.first_name
    user.last_name  = auth.info.last_name
    user.email      = auth.info.email
    user.image      = auth.info.image
    #user.link       = auth.info.urls
    #user.gender     = auth.extra.gender
    user
  end
end
