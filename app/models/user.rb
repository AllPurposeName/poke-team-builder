class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = self.new()
    user.uid        = auth.uid
    user.name       = auth.info.name
    user.image      = auth.info.image
    user
  end
end
