class User < ActiveRecord::Base
  has_one :team, inverse_of: :user
  after_create :set_team
  def self.find_or_create_from_omniauth(auth)
    user = self.find_by(uid: auth.uid) || self.create_with_auth(auth)
    user
  end

  def self.create_with_auth(auth)
    user = self.new()
    user.uid        = auth.uid
    user.name       = auth.info.name
    user.image      = auth.info.image
    user.token      = auth.credentials.token
    user.secret     = auth.credentials.secret
    user.save
    user
  end

  def pokemons
    self.team.pokemons
  end

  private

  def set_team
    self.update(team: (Team.find_or_create_by(user_id: self.id)))
  end
end
