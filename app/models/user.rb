class User < ActiveRecord::Base
  has_one :team, inverse_of: :user
  after_create :set_team
  def self.create_from_omniauth(auth)
    user = self.new()
    user.uid        = auth.uid
    user.name       = auth.info.name
    user.image      = auth.info.image
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
