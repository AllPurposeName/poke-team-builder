class Sprite < ActiveRecord::Base
  belongs_to :pokemon, inverse_of: :sprites

  def self.make_new(poke_struct)
    sprite = self.new()
    sprite.national_id = poke_struct.national_id
    sprite.name = poke_struct.name
    sprite.image = "http://pokeapi.co#{poke_struct.image}"
    sprite.save
  end
end
